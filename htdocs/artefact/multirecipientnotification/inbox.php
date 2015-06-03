<?php
/**
 *
 * @package    mahara
 * @subpackage artefact-multirecipientnotification
 * @author     David Ballhausen, Tobias Zeuch
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL version 3 or later
 * @copyright  For copyright information on Mahara, please see the README file distributed with this software.
 *
 */

define('INTERNAL', 1);
define('MENUITEM', 'inbox');
define('SECTION_PLUGINTYPE', 'artefact');
define('SECTION_PLUGINNAME', 'multirecipientnotification');
define('SECTION_PAGE', 'inbox');

require(dirname(dirname(dirname(__FILE__))) . '/init.php');
require_once('pieforms/pieform.php');
safe_require('artefact', 'multirecipientnotification');

global $USER;
global $THEME;

// Add new title
define('TITLE', get_string('notification', 'artefact.multirecipientnotification'));

// Make sure the unread message count is up to date whenever the
// user hits this page.
$USER->reload_background_fields();

$installedtypes = get_records_assoc(
    'activity_type', '', '',
    'plugintype,pluginname,name',
    'name,admin,plugintype,pluginname'
);

$options = array();
// check if user is an admin in at least one group and if so they can see group admin filter options
$groupadmin = false;
$grouproles = $USER->get('grouproles');
if (array_search('admin', $grouproles) !== false) {
    $groupadmin = true;
}

foreach ($installedtypes as $t) {
    if (!$t->admin || $USER->get('admin') || ($groupadmin && $t->pluginname == 'forum')) {
        $section = $t->pluginname ? "{$t->plugintype}.{$t->pluginname}" : 'activity';
        $options[$t->name] = get_string('type' . $t->name, $section);
    }
}

if ($USER->get('admin')) {
    $options['adminmessages'] = get_string('typeadminmessages', 'activity');
}

// sort activitytypes now, when they have been translated
uasort($options, 'strcmp');
// ... and add the element for 'all types' to the beginning
$options = array_merge(array('all' => get_string('alltypes', 'activity')), $options);
$type = param_variable('type', 'all');
if ($type == '') {
    $type = 'all';
}
if (!isset($options[$type])) {
    // Comma-separated list; filter out anything that's not an installed type
    $type = join(',', array_unique(array_filter(
        split(',', $type),
        function ($a) {global $installedtypes; return isset($installedtypes[$a]);}
    )));
}

require_once(get_config('docroot') . 'lib/activity.php');
// add the new function for outgoing notification
// use the new function to show from - and to user
$activitylist = activitylistin_html($type);

$strread = json_encode(get_string('read', 'activity'));
$strnodelete = json_encode(get_string('nodelete', 'activity'));

$deleteall = pieform(array(
    'name'        => 'delete_all_notifications',
    'class'       => 'form-deleteall sr-only',
    'method'      => 'post',
    'plugintype'  => 'core',
    'pluginname'  => 'account',
    'elements'    => array(
        'type' => array(
            'type' => 'hidden',
            'value' => $type,
        ),
        'submit' => array(
            'type' => 'submit',
            'class' => 'deleteallnotifications',
            'value' => get_string('deleteallnotifications', 'activity'),
            'confirm' => get_string('reallydeleteallnotifications', 'activity'),
        ),
    ),
));

function delete_all_notifications_submit() {
    global $USER, $SESSION;
    $userid = $USER->get('id');
    $type = param_variable('type', 'all');

    db_begin();

    // delete multirecipient-message separately
    $count = 0;
    if (in_array($type, array('all', 'usermessage'))) {
        if ($type !== 'all') {
            $at = activity_locate_typerecord($type);
            $typecond = 'AND {msg}.{type} = ' . $at->id;
        }
        else {
            $typecond = '';
        }

        $query = 'SELECT msg.id AS id
                FROM {artefact_multirecipient_notification} as msg
                INNER JOIN {artefact_multirecipient_userrelation} as rel
                ON msg.id = rel.notification
                AND rel.usr = ?
                AND rel.role = ?
                AND rel.deleted = \'0\'
                ' . $typecond;
        $result = get_records_sql_array($query, array($userid, 'recipient'));
        $msgids = array();
        if (is_array($result)) {
            foreach ($result as $record) {
                $msgids[] = $record->id;
            }
           delete_messages_mr($msgids, $userid);
        }
        $count = count($msgids);
    }

    $typesql = '';
    if ($type != 'all') {
        // Treat as comma-separated list of activity type names
        $types = split(',', preg_replace('/[^a-z,]+/', '', $type));
        if ($types) {
            $typesql = ' at.name IN (' . join(',', array_map('db_quote', $types)) . ')';
            if (in_array('adminmessages', $types)) {
                $typesql = '(' . $typesql . ' OR at.admin = 1)';
            }
            $typesql = ' AND ' . $typesql;
        }
    }
    // changed to meesage from usr
    $fromexpression = "FROM {notification_internal_activity} a
        INNER JOIN {activity_type} at ON a.type = at.id
        WHERE a.usr = ? $typesql";
    $values = array($userid);

    $records = get_records_sql_array('SELECT a.id ' . $fromexpression, $values);
    if ($records) {
        $count += sizeof($records);
        $ids = array();
        foreach ($records as $row) {
            $ids[] = $row->id;
        }
        // Remove parent pointers to messages we're about to delete
        execute_sql('
            UPDATE {notification_internal_activity}
            SET parent = NULL
            WHERE parent IN (' . join(',', array_map('db_quote', $ids)) . ')'
        );
        // delete
        execute_sql('
            DELETE FROM {notification_internal_activity}
            WHERE id IN (' . join(',', array_map('db_quote', $ids)) . ')'
        );
        // The update_unread_delete db trigger on notification_internal_activity
        // will update the unread column on the usr table.
    }

    db_commit();
    $SESSION->add_ok_msg(get_string('deletednotifications1', 'activity', $count));
    redirect(get_config('wwwroot') . 'artefact/multirecipientnotification/inbox.php?type=' . $type);
}

$extrastylesheets = $THEME->get_url('style.css', false, 'artefact/multirecipientnotification');
$smarty = smarty(array('paginator'),
    array('')
);
$smarty->assign('options', $options);
$smarty->assign('type', $type);
$smarty->assign('INLINEJAVASCRIPT',null);
$smarty->assign('paginatorData', $activitylist['pagination_js']);

// Adding the links to out- and inbox
$smarty->assign('PAGEHEADING', TITLE);

// show urls and titles
define('NOTIFICATION_SUBPAGE', 'inbox');
$smarty->assign('SUBPAGENAV', PluginArtefactMultirecipientnotification::submenu_items());

$smarty->assign('deleteall', $deleteall);
$smarty->assign('activitylist', $activitylist);

// Changed to new tpl
$smarty->display('artefact:multirecipientnotification:indexin.tpl');
