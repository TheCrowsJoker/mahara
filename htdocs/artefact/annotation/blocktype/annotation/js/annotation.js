/**
 * Javascript for the annotation artefact
 *
 * @package    mahara
 * @subpackage blocktype-annotation
 * @author     Catalyst IT Ltd
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL version 3 or later
 * @copyright  For copyright information on Mahara, please see the README file distributed with this software.
 */

/**
 * Return the specified request variable from the URL.
 * This should be moved to mahara.js to everyone can use it.
 */
function getURLParameter(variable) {
   var query = window.location.search.substring(1);
   var vars = query.split("&");
   for (var i = 0; i < vars.length; i++) {
       var pair = vars[i].split("=");
       if (pair[0] == variable) {
           return pair[1];
       }
   }
   return false;
}

function isTinyMceUsed(elementname) {
    return (tinyMCE !== undefined && tinyMCE.get(elementname) !== undefined);
}

function initTinyMCE (formname){
    if(tinyMCE !== undefined){
        tinyMCE.execCommand('mceRemoveEditor', false,  formname + '_message')
        tinyMCE.execCommand('mceAddEditor', false, formname + '_message');
    }
}

function modifyAnnotationFeedbackSuccess(form, data) {
    var formname = form.name;
    var limit    = getURLParameter('limit');
    var offset   = getURLParameter('offset');

    if (limit === false && offset === false) {
        // Pagination is not used.
        limit = null;
        offset = null;
    }

    // Reload the annotation feedback table with the new feedback that's just been made public.
    sendjsonrequest('../artefact/annotation/annotations.json.php',
        {
            'annotationid' : $(formname + '_annotationid').value,
            'viewid'       : $(formname + '_viewid').value,
            'artefactid'   : $(formname + '_artefactid').value,
            'blockid'      : $(formname + '_blockid').value,
            'limit'        : limit,
            'offset'       : offset,
        }, 'GET', function (data) {
            var blockid = $(formname + '_blockid').value;
            // Populate the div.

            (function($) {
                var scope = $('#annotationfeedbackview_' + blockid);
                scope.html(data.data);
                dock.init(scope);
                initTinyMCE(formname);
            })(jQuery);
    });

    formSuccess(form, data);
}

function addAnnotationFeedbackSuccess(form, data) {
    var formname = form.name;
    var blockid  = $(formname + '_blockid').value;
    var limit    = getURLParameter('limit');
    var offset   = getURLParameter('offset');
    var tinymce = $(form.id + '_message');

    if (limit === false && offset === false) {
        // Pagination is not used.
        limit = null;
        offset = null;
    }

    if (typeof(paginator) != 'undefined' && paginator.id == 'annotationfeedback_pagination_' + blockid) {
        // Make sure its using the annotation paginator for its block not the feedback paginator.
        paginator.updateResults(data);
        paginator.alertProxy('pagechanged', data['data']);
    }
    else {
        // Reload the annotation feedback table with the new feedback that's just been entered.
        sendjsonrequest('../artefact/annotation/annotations.json.php',
            {
                'annotationid' : $(formname + '_annotationid').value,
                'viewid'       : $(formname + '_viewid').value,
                'artefactid'   : $(formname + '_artefactid').value,
                'blockid'      : $(formname + '_blockid').value,
                'limit'        : limit,
                'offset'       : offset,
            }, 'GET', function (data) {
                var blockid = $(formname + '_blockid').value;
                // Populate the div

                (function($) {
                    var scope = $('#annotationfeedbackview_' + blockid);
                    scope.html(data.data);
                    dock.init(scope);
                    initTinyMCE(formname);
                })(jQuery);
        });
    }

    // Clear TinyMCE
    if (isTinyMceUsed(formname + '_message')) {
        tinyMCE.activeEditor.setContent('');
    }

    // Clear the textarea (in case TinyMCE is disabled)
    var messageid = 'message';
    if (data.fieldnames && data.fieldnames.message) {
        messageid = data.fieldnames.message;
    }
    $(formname + '_' + messageid).value = '';
    formSuccess(form, data);
}
