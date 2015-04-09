<?php
/**
 *
 * @package    mahara
 * @subpackage auth-webservice
 * @author     Catalyst IT Ltd
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL version 3 or later
 * @copyright  For copyright information on Mahara, please see the README file distributed with this software.
 *
 */

define('INTERNAL', 1);
define('ADMIN', 1);
define('MENUITEM', 'configextensions/webservices');
require(dirname(dirname(dirname(__FILE__))) . '/init.php');
define('TITLE', get_string('pluginadmin', 'admin'));
require_once('pieforms/pieform.php');

$service  = param_integer('service', 0);
$dbservice = get_record('external_services', 'id', $service);
if (empty($dbservice)) {
    $SESSION->add_error_msg(get_string('invalidservice', 'auth.webservice'));
    redirect('/webservice/admin/index.php?open=webservices_function_groups');
}
$enabled = $dbservice->enabled;
$restrictedusers = ($dbservice->restrictedusers <= 0 ? 0 : 1);
$tokenusers = ($dbservice->tokenusers <= 0 ? 0 : 1);

$functions =
    array(
        'name'             => 'allocate_webservice_functions',
        'successcallback'  => 'allocate_webservice_functions_submit',
        'validatecallback' => 'allocate_webservice_functions_validate',
        'jsform'           => true,
        'renderer'         => 'multicolumntable',
        'elements'   => array(
                        'enabled' => array(
                            'title' => ' ',
                            'class' => 'header',
                            'type'  => 'html',
                            'value' => get_string('enabled'),
                        ),
                        'classname' => array(
                            'title' => ' ',
                            'class' => 'header',
                            'type'  => 'html',
                            'value' => get_string('classname', 'auth.webservice'),
                        ),
                        'methodname' => array(
                            'title' => ' ',
                            'class' => 'header',
                            'type'  => 'html',
                            'value' => get_string('methodname', 'auth.webservice'),
                        ),
                ),
        );


$dbfunctions = get_records_array('external_functions', null, null, 'name');
foreach ($dbfunctions as $function) {
    $sfexists = record_exists('external_services_functions', 'externalserviceid', $dbservice->id, 'functionname', $function->name);
    $functions['elements']['id' . $function->id . '_enabled'] = array(
        'defaultvalue' => ($sfexists ? 'checked' : ''),
        'type'         => 'switchbox',
        'disabled'     => false,
        'title'        => $function->name,
    );

    $functions['elements']['id' . $function->id . '_class'] = array(
        'value'        =>  $function->classname,
        'type'         => 'html',
        'title'        => $function->name,
    );

    $functions['elements']['id' . $function->id . '_method'] = array(
        'value'        =>  '<a href="' . get_config('wwwroot') . 'webservice/wsdoc.php?id=' . $function->id . '">' . $function->methodname . '</a>',
        'type'         => 'html',
        'title'        => $function->name,
    );
}

$functions['elements']['submit'] = array(
    'type' => 'submitcancel',
    'value' => array(get_string('save'), get_string('back')),
    'goto' => get_config('wwwroot') . 'webservice/admin/index.php?open=webservices_function_groups',
);

$elements = array(
    // fieldset of master switch
    'webservicesmaster' => array(
         'type' => 'fieldset',
         'legend' => get_string('enableservice', 'auth.webservice'),
         'elements' =>  array(
             'webservicesmasterform1' => array(
                 'type' => 'html',
                 'value' =>
                     pieform(
                         array(
                             'name' => 'activate_webservices_enable',
                             'renderer' => 'div',
                             'elementclasses' => false,
                             'successcallback' => 'serviceconfig_submit',
                             'jsform' => false,
                             'action' => get_config('wwwroot') . 'webservice/admin/serviceconfig.php',
                             'elements' => array(
                                 'service' => array('type' => 'hidden', 'value' => $dbservice->id),
                                 'enabled' => array('type' => 'switchbox',
                                     'value' => $enabled,
                                     'on_label' => get_string('enabled'),
                                     'off_label' => get_string('disabled'),
                                     'wrapperclass' => 'switch-wrapper-inline',
                                     'labelhtml' => get_string('servicename', 'auth.webservice'),
                                 ),
                             ),
                         )
                     ),
             ),
             'webservicesmasterform2' => array(
                 'type' => 'html',
                 'value' =>
                     pieform(
                         array(
                             'name' => 'activate_webservices_restrictedusers',
                             'renderer' => 'div',
                             'elementclasses' => false,
                             'successcallback' => 'serviceconfig_submit',
                             'jsform' => false,
                             'action' => get_config('wwwroot') . 'webservice/admin/serviceconfig.php',
                             'elements' => array(
                                 'service' => array('type' => 'hidden', 'value' => $dbservice->id),
                                 'restrictedusers' => array('type' => 'switchbox',
                                     'value' => $restrictedusers,
                                     'on_label' => get_string('usersonly', 'auth.webservice'),
                                     'off_label' => get_string('tokensonly', 'auth.webservice'),
                                     'wrapperclass' => 'switch-wrapper-inline',
                                     'labelhtml' => get_string('restrictedusers', 'auth.webservice'),
                                 ),
                             ),
                         )
                     ),
             ),
             'webservicesmasterform3' => array(
                 'type' => 'html',
                 'value' =>
                     pieform(
                         array(
                             'name' => 'activate_webservices_tokenusers',
                             'renderer' => 'div',
                             'elementclasses' => false,
                             'successcallback' => 'serviceconfig_submit',
                             'jsform' => false,
                             'action' => get_config('wwwroot') . 'webservice/admin/serviceconfig.php',
                             'elements' => array(
                                 'service' => array('type' => 'hidden', 'value' => $dbservice->id),
                                 'tokenusers' => array('type' => 'switchbox',
                                     'value' => $tokenusers,
                                     'on_label' => get_string('enabled'),
                                     'off_label' => get_string('disabled'),
                                     'wrapperclass' => 'switch-wrapper-inline',
                                     'labelhtml' => get_string('fortokenusers', 'auth.webservice'),
                                 ),
                             ),
                         )
                     ),
             ),
    ),
    'collapsible' => false,
    'collapsed'   => false,
),
    // fieldset for managing service function list
    'functions' => array(
        'type' => 'fieldset',
        'legend' => get_string('servicefunctionlist', 'auth.webservice'),
        'elements' => array(
            'sfgdescription' => array(
                'value' => '<tr><td colspan="2">' . get_string('sfldescription', 'auth.webservice') . '</td></tr>'
            ),
            'sflist' => array(
                'type'  => 'html',
                'value' =>     pieform($functions),
            )
        ),
        'collapsible' => false,
    ),
);
$form = array(
    'renderer' => 'div',
    'type' => 'div',
    'id' => 'maintable',
    'elements' => $elements,
);

$heading = get_string('servicegroups', 'auth.webservice');
$form['name'] = 'serviceconfig';
$form['successcallback'] = 'serviceconfig_submit';
$form = pieform($form);
$smarty = smarty(array(), array('<link rel="stylesheet" type="text/css" href="' . $THEME->get_url('style/webservice.css', false, 'auth/webservice') . '">',));
safe_require('auth', 'webservice');
$webservice_menu = PluginAuthWebservice::menu_items(MENUITEM);
$smarty->assign('TERTIARYMENU', $webservice_menu);
$smarty->assign('form', $form);
$smarty->assign('PAGEHEADING', $heading);
$smarty->display('form.tpl');

function allocate_webservice_functions_submit(Pieform $form, $values) {
    global $SESSION, $service, $dbservice;
    foreach (array_keys($values) as $key) {
        if (preg_match('/^id(\d+)\_enabled$/', $key, $matches)) {
            $function = $matches[1];
            $dbfunction = get_record('external_functions', 'id', $function);
            if (empty($dbfunction)) {
                $SESSION->add_error_msg(get_string('invalidinput', 'auth.webservice'));
                redirect('/webservice/admin/serviceconfig.php?service=' . $service);
            }
            $service_function = record_exists('external_services_functions', 'externalserviceid', $service, 'functionname', $dbfunction->name);
            // record should exist - so create if necessary
            if ($values[$key]) {
                if (!$service_function) {
                    $service_function = array('externalserviceid' => $service, 'functionname' => $dbfunction->name);
                    insert_record('external_services_functions', $service_function);
                    $dbservice->mtime = db_format_timestamp(time());
                    update_record('external_services', $dbservice);
                }
            }
            else {
                // disabled - record should not exist
                if ($service_function) {
                    delete_records('external_services_functions', 'externalserviceid', $service, 'functionname', $dbfunction->name);
                    $dbservice->mtime = db_format_timestamp(time());
                    update_record('external_services', $dbservice);
                }
            }
        }
    }
    $SESSION->add_ok_msg(get_string('configsaved', 'auth.webservice'));
    redirect('/webservice/admin/serviceconfig.php?service=' . $service);
}

function allocate_webservice_functions_validate(PieForm $form, $values) {
    global $SESSION, $service;
}

function serviceconfig_submit(Pieform $form, $values) {
    global $SESSION, $service, $dbservice;

    if (isset($values['enabled'])) {
        $enabled = $values['enabled'] ? 0 : 1;
        $dbservice->enabled = $enabled;
        update_record('external_services', $dbservice);
        $SESSION->add_ok_msg(get_string('configsaved', 'auth.webservice'));
    }
    else if (isset($values['tokenusers'])) {
        $tokenusers = $values['tokenusers'] ? 0 : 1;
        $dbservice->tokenusers = $tokenusers;
        update_record('external_services', $dbservice);
        $SESSION->add_ok_msg(get_string('configsaved', 'auth.webservice'));
    }
    else if (isset($values['restrictedusers'])) {
        // flip flop
        $restrict = ($values['restrictedusers'] <= 0 ? 1 : 0);
        if ($restrict) {
            // must not disable token users
            $cnt = count_records('external_tokens', 'externalserviceid', $service);
            if ($cnt > 0) {
                $SESSION->add_error_msg(get_string('existingtokens', 'auth.webservice'));
                redirect('/webservice/admin/serviceconfig.php?service=' . $service);;
            }
        }
        else {
            // must not disable auth users
            $cnt = count_records('external_services_users', 'externalserviceid', $service);
            if ($cnt > 0) {
                $SESSION->add_error_msg(get_string('existingserviceusers', 'auth.webservice'));
                redirect('/webservice/admin/serviceconfig.php?service=' . $service);;
            }
        }
        $dbservice->restrictedusers = $restrict;
        update_record('external_services', $dbservice);
        $SESSION->add_ok_msg(get_string('configsaved', 'auth.webservice'));
    }
    redirect('/webservice/admin/serviceconfig.php?service=' . $service);
}

function serviceconfig_validate(PieForm $form, $values) {
}
