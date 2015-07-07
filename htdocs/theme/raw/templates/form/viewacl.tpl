<input type="hidden" name="accesslist" value="">
<div id="editaccesswrap">
    <div class="mbs pbs">
        <span>{{str tag=views}}</span>
        <select multiple class="js-sort-dropdown mlm form-control">
            <option value="Friends">Friends</option>
            <option value="Groups">Groups</option>
            <option value="Users">Users</option>
        </select>
    </div>
    <div class="mbs pbs last">
        <span>{{str tag=Collections section=collection}}</span>
        <select multiple class="js-sort-dropdown mlm form-control">
            <option value="Friends">Friends</option>
            <option value="Groups">Groups</option>
            <option value="Users">Users</option>
        </select>
    </div>

    <h2 class="mtxl">{{str tag=sharedwith section=view}}</h2>
    <table id="accesslisttable" class="fullwidth accesslists table">
        <thead>
            <tr class="accesslist-head">
                <th></th>
                <th>{{str tag=sharedwith section=view}}</th>
                <th class="text-center">From</th>
                <th class="text-center">To</th>
            </tr>
        </thead>
        <tbody id ="accesslistitems">
        </tbody>
        <tfoot>
            <tr class="accesslist-foot">
                <td>
                    <a href="#" id="add-user">
                        <span class="icon icon-plus icon-lg text-link"></span>
                    </a>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tfoot>
    </table>
</div>



<script type="application/javascript">
var count = 0;

jQuery(function($) {
"use strict";
    var counter = 0;
    $('#add-user').click(function(event){
        event.preventDefault();
        counter++;
        var newRow = $( '<tr id="accesslistrow' + counter + '" class="accesslist-body">' +
                            '<td>' +
                                '<a href="#" id="remove-share">' +
                                    '<span class="icon icon-minus icon-lg text-danger"></span>' +
                                '</a>' +
                            '</td>' +
                            '<td>' +
                                '<span class="picker">' +
                                    '<select id="type" class="form-control input-small select">' +
                                        '<optgroup label="Users &amp; Groups">' +
                                            '<option value="friend" selected="selected">{{str tag=friends section=view}}</option>' +
                                            '<option value="group">{{str tag=groups}}</option>' +
                                            '<option value="user">{{str tag=users}}</option>' +
                                        '</optgroup>' +
                                        '<optgroup label="Share with" id="potentialpresetitemssharewith">' +
                                        '</optgroup>' +
                                        '<optgroup label="Institutions" id="potentialpresetitemsinstitutions">' +
                                        '</optgroup>' +
                                        '<optgroup label="Groups" id="potentialpresetitemsgroups">' +
                                        '</optgroup>' +
                                    '</select>' +
                                '</span>' +
                                '<select id="hidden-user-search" class="form-control select "></select>' +
                            '</td>' +
                            '<td class="text-center">' +
                                '<span class="icon icon-calendar icon-lg"></span>' +
                            '</td>' +
                            '<td class="text-center">' +
                                '<span class="icon icon-calendar icon-lg">' +
                            '</td>' +
                        '</tr>');
        
        $('#accesslistitems').append(newRow);
        var potentialPresets = {{$potentialpresets|safe}};
        forEach(potentialPresets, function(preset) {
            renderPotentialPresetItem(preset);
        });
        var myInstitutions = {{$myinstitutions|safe}};
        if (myInstitutions.length) {
            appendChildNodes('potentialpresetitemssharewith', H3({'class': 'title'}, '{{str tag=sharewithmyinstitutions section=view}}'));
            var i = 0;
            var maxInstitutions = 5;
            forEach(myInstitutions, function(preset) {
                if (i == maxInstitutions) {
                    var more = A({'href':''}, '{{str tag=moreinstitutions section=view}} »');
                    connect(more, 'onclick', function(e) {
                        e.stop();
                        forEach(getElementsByTagAndClassName('div', 'moreinstitutions', 'potentialpresetitemssharewith'), partial(toggleElementClass, 'hidden'));
                    });
                    appendChildNodes('potentialpresetitemssharewith', DIV(null, ' ', more));
                }
                if (i >= maxInstitutions) {
                    preset['class'] = 'hidden moreinstitutions';
                }
                renderPotentialPresetItem(preset);
                i++;
            });

        }
        var allGroups = {{$allgroups|safe}};
        var myGroups = {{$mygroups|safe}};
        if (myGroups) {
            appendChildNodes('potentialpresetitemssharewith', H3({'class': 'title'}, {{jstr tag=sharewithmygroups section=view}}));
            renderPotentialPresetItem(allGroups);
            var i = 0;
            var maxGroups = 10;
            forEach(myGroups, function(preset) {
                if (i == maxGroups) {
                    var more = A({'href':''}, {{jstr tag=moregroups section=group}} + ' »');
                    connect(more, 'onclick', function(e) {
                        e.stop();
                        forEach(getElementsByTagAndClassName('div', 'moregroups', 'potentialpresetitemssharewith'), partial(toggleElementClass, 'hidden'));
                    });
                    appendChildNodes('potentialpresetitemssharewith', DIV(null, ' ', more));
                }
                if (i >= maxGroups) {
                    preset['class'] = 'hidden moregroups';
                }
                renderPotentialPresetItem(preset);
                i++;
            });
        }
    

        $(document).on('click', '#remove-share', function () {
            $(this).closest('tr').remove();
            return false;
        });
        
        function formatResults (data) {
            if (data.loading) return data.text;
            var markup = 
            '<img class="prm" src="' + config.wwwroot + 'thumb.php?type=profileicon&maxwidth=35&maxheight=35&id=' + data.id + '" />' +
            data.firstname + ' ' + data.lastname;
            return markup;
        }

        function formatRepoSelection (data) {
            return data.firstname || data.text;
        }

        $("#hidden-user-search").select2({
            ajax: {
                url: "access.json.php",
                dataType: 'json',
                delay: 250,
                type: 'POST',
                data: function (params) {
                  return {
                    'type' : $('#type').val(),
                    'query': params.term, // search term
                    'offset': 0, 
                    'limit': 10,
                    'page': params.page,
                    'sesskey': config.sesskey
                  };
                },
                processResults: function (data, page) {
                  // parse the results into the format expected by Select2.
                  // since we are using custom formatting functions we do not need to
                  // alter the remote JSON data
                  return {
                    results: data.message.data
                  };
                },
                cache: true
              },
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatResults,
            templateSelection: formatRepoSelection
        });
    });
});


// Utility functions

// Populate fields in the dropdown menu
function renderPotentialPresetItem(item) {
    var accessString = item.name;
    // if (item.type == 'group' || item.type == 'institution') {
    //     accessString = (item.type, item.name);
    // }
    // else {
    //     accessString = (item.name);
    // }
    var addButton = SPAN({'value': 'button', 'class': 'btn btn-default mtl'}, accessString);
    var attribs = {};
    if (item.preset) {
        attribs = {'class': 'preset'};
    }
    else if (item['class']) {
        attribs = {'class': item['class']};
    }

    var row = OPTION(attribs, addButton);
    item.preset = true;

    if (item.type == 'allgroups') {
        connect(addButton, 'onclick', function() {
            var rows = [];
            forEach(myGroups, function(g) {
                rows.push(renderAccessListItem(g));
            });
            if (rows.length > 0) {
                getFirstElementByTagAndClassName('input', null, rows[0]).focus();
            }
        });
    }
    else {
        connect(addButton, 'onclick', function() {
            var row = renderAccessListItem(item);
            getFirstElementByTagAndClassName('input', null, row).focus();
        });
    }
    

    if (item.type == "public" || item.type == "loggedin") {
        appendChildNodes('potentialpresetitemssharewith', row);
    }

    else if (item.type == "institution") {
        appendChildNodes('potentialpresetitemsinstitutions', row);
    }

    else if (item.type == "group" || item.type == "allgroups") {
        appendChildNodes('potentialpresetitemsgroups', row);
    }
    else {
        console.log(item)
    }
   
    return row;
}

// function renderAccessListDefault() {
//     addElementClass('accesslisttable', 'hidden');
//     removeElementClass('accesslisttabledefault', 'hidden');
// }

// if (jQuery('#type').val() == 'users') {
//     removeElementClass('hidden-user-search', 'hidden')
// }
// else {
//     addElementClass('hidden-user-search', 'hidden')
// };

// Given a row, render it on the right hand side
// function renderAccessListItem(item) {
//     var addButton = SPAN({'type': 'button', 'title': {{jstr tag=add}}, 'class' : 'icon icon-plus icon-lg text-link'});
//     var removeButton = SPAN({'type': 'button', 'title': {{jstr tag=remove}}, 'class' : 'icon icon-minus icon-lg text-danger'});
//     var allowfdbk = INPUT({
//         'type': 'checkbox',
//         'name': 'accesslist[' + count + '][allowcomments]',
//         'id'  :  'allowcomments' + count,
//         'value':  1});
//     var allowfdbklabel = LABEL({'for': 'allowcomments' + count}, get_string('Allow'));
//     var approvefdbk = INPUT({
//         'type': 'checkbox',
//         'name': 'accesslist[' + count + '][approvecomments]',
//         'id'  :  'approvecomments' + count,
//         'value':  1});
//     var approvefdbklabel = LABEL({'for': 'approvecomments' + count}, get_string('Moderate'));

//     if (item['allowcomments']==1) {
//         setNodeAttribute(allowfdbk,'checked',true);
//         if (item['approvecomments'] == 1) {
//             setNodeAttribute(approvefdbk, 'checked', true);
//         }
//     }
//     else {
//         setNodeAttribute(approvefdbk, 'disabled', true);
//     }
//     connect(allowfdbk, 'onclick', function() {
//         if (allowfdbk.checked) {
//             approvefdbk.disabled = false;
//         }
//         else {
//             approvefdbk.disabled = true;
//             approvefdbk.checked = false;
//         }
//     });
//     var cssClass = 'ai-container';
//     if (item.preset) {
//         cssClass += '  preset';
//     }
//     cssClass += ' ' + item.type + '-container';
//     var name = [item.shortname ? SPAN({'title': item.name}, item.shortname) : item.name];
//     if (item.role != null) {
//         name.push(' - ', item.roledisplay);
//     }
//     var icon = null;
//     if (item.type == 'user') {
//         icon = IMG({'src': config.wwwroot + 'thumb.php?type=profileicon&id=' + item.id + '&maxwidth=25&maxheight=25'});
//     }

//     // if this item is 'public' and public pages are disabled
//     // change the background colour and add some contextual help
//     if (item.accesstype == 'public' && !item.publicallowed) {
//         cssClass += ' item-disabled';

//         var helpText = SPAN({'class': 'page-help-icon'}, SPAN({'class': 'help'}, contextualHelpIcon('', '', 'core', 'view', 'publicaccessrevoked', '')));
//         name.push(helpText);
//     }

//     var notpublicorallowed = (item.accesstype != 'public' || item.publicallowed);


    

//     var row = TR({'class': cssClass, 'id': 'accesslistitem' + count},
//         TD({'class': 'removebutton'}, removeButton),
//         TD({'class': 'accesslistname'}, icon, name),
//         TD(null, makeCalendarInput(item, 'start', notpublicorallowed)),
//         TD(null, makeCalendarInput(item, 'stop', notpublicorallowed))
//     );

    
//     jQuery('#add-user').click(function(event){
//         event.preventDefault();
//         jQuery('#accesslistitems').append(row);
//     });

//     connect(removeButton, 'onclick', function() {
//         removeElement(row);

//         // Update the formchangechecker state
//         if (typeof formchangemanager !== 'undefined') {
//             formchangemanager.setFormStateById('{{$formname}}', FORM_CHANGED);
//         }
//     });
//     appendChildNodes('accesslistitems', row);


//     if (notpublicorallowed) {
//         setupCalendar(item, 'start');
//         setupCalendar(item, 'stop');
//     }

//     if (item.locked) {
//         // Remove buttons
//         $j(row).find('button').remove();

//         // Disable date inputs
//         $j(row).find("input[name*='startdate']").attr('disabled', 'disabled');
//         $j(row).find("input[name*='stopdate']").attr('disabled', 'disabled');
//         $j(row).find('.ui-datepicker-trigger').hide();
//     }
//     count++;
//     // Update the formchangechecker state
//     if (typeof formchangemanager !== 'undefined') {
//         formchangemanager.setFormStateById('{{$formname}}', FORM_CHANGED);
//     }

//     return row;
// }

function makeCalendarInput(item, type, disabled) {
    var label = LABEL({
        'for': type + 'date_' + count,
        'class': 'accessible-hidden sr-only'
    }, get_string(type + 'date'));
    var input = INPUT({
        'type':'text',
        'name': 'accesslist[' + count + '][' + type + 'date]',
        'id'  :  type + 'date_' + count,
        'value': item[type + 'date'] ? item[type + 'date'] : '',
        'size': '15'
    });

    input.disabled = (disabled == 0);
    return SPAN(null, label, input);
}

function setupCalendar(item, type) {
//    var dateStatusFunc, selectedFunc;
if (!$(type + 'date_' + count)) {
    logWarn('Couldn\'t find element: ' + type + 'date_' + count);
    return;
}
var input = jQuery('#' + type + 'date_' + count).datetimepicker({
    {{$datepickeroptions|safe}}
    beforeShow: function(input, inst) {
        setTimeout(function() {
            add_prev_next_year(inst);
        }, 1);
    },
    onChangeMonthYear: function(y, m, inst) {
        setTimeout(function() {
            add_prev_next_year(inst);
        }, 1);
    },
    showOn: "input",
          // buttonImage: "{{theme_url filename='images/btn_calendar.png'}}",
          // buttonText: get_string('element.calendar.opendatepicker', 'pieforms'),
        });
}

function updateFormChangeChecker() {
    if (typeof formchangemanager !== 'undefined') {
        formchangemanager.setFormStateById('{{$formname}}', FORM_CHANGED);
    }
}

// SETUP

// Left hand side
// var searchTable = new TableRenderer(
//     'results',
//     'access.json.php',
//     [
//         undefined, undefined, undefined
//     ]
// );
// searchTable.statevars.push('type');
// searchTable.statevars.push('query');
// searchTable.type = 'friend';
// searchTable.pagerOptions = {
//     'firstPageString': '\u00AB',
//     'previousPageString': '<',
//     'nextPageString': '>',
//     'lastPageString': '\u00BB',
//     'linkOptions': {
//         'href': '',
//         'style': 'padding-left: 0.5ex; padding-right: 0.5ex;'
//     }
// }
// searchTable.query = '';
// searchTable.rowfunction = function(rowdata, rownumber, globaldata) {
//     rowdata.type = searchTable.type;
//     rowdata.type = rowdata.type == 'friend' ? 'user' : rowdata.type;

//     var buttonTD = TD({'class': 'buttontd'});

//     var addButton = BUTTON({'type': 'button', 'class': 'button'}, {{jstr tag=add}});
//     connect(addButton, 'onclick', function() {
//         appendChildNodes('accesslist', renderAccessListItem(rowdata));
//     });
//     appendChildNodes(buttonTD, addButton);

//     var identityNodes = [], profileIcon = null, roleSelector = null;
//     if (rowdata.type == 'user') {
//         profileIcon = IMG({'src': config.wwwroot + 'thumb.php?type=profileicon&maxwidth=25&maxheight=25&id=' + rowdata.id});
//         identityNodes.push(A({'href': rowdata.url, 'target': '_blank'}, rowdata.name));
//     }
//     else if (rowdata.type == 'group') {
//         rowdata.role = null;
//         var options = [OPTION({'value':null, 'selected':true}, {{jstr tag=everyoneingroup section=view}})];
//         for (r in globaldata.roles[rowdata.grouptype]) {
//             options.push(OPTION({'value':globaldata.roles[rowdata.grouptype][r].name}, globaldata.roles[rowdata.grouptype][r].display));
//         }
//         roleSelector = SELECT({'name':'role'}, options);
//         connect(roleSelector, 'onchange', function() {
//             rowdata.role = this.value;
//             if (this.value) {
//                 rowdata.roledisplay = scrapeText(this.childNodes[this.selectedIndex]);
//             }
//         });
//         identityNodes.push(A({'href': rowdata.url, 'target': '_blank'}, rowdata.name));
//         identityNodes.push(" - ");
//         identityNodes.push(roleSelector);
//     }

//     return TR({'class': 'r' + (rownumber % 2)},
//         buttonTD,
//         TD({'class': 'sharewithusersname'}, identityNodes),
//         TD({'class': 'right icon-container'}, profileIcon)
//         );
// }
// searchTable.updateOnLoad();

// function search(e) {
//     searchTable.query = $('search').value;
//     searchTable.type  = $('type').options[$('type').selectedIndex].value;
//     searchTable.doupdate();
//     e.stop();
// }


// Right hand side
addLoadEvent(function () {
    {{if $defaultaccesslist}}
    // renderAccessListDefault();
    {{else}}
    var accesslist = {{$accesslist|safe}};
    if (accesslist) {
        forEach(accesslist, function(item) {
            renderAccessListItem(item);
        });
    }
    {{/if}}
});

addLoadEvent(function() {
    // Populate the "potential access" things (public|loggedin|allfreidns)

    connect($('search'), 'onkeydown', function(e) {
        if (e.key().string == 'KEY_ENTER') {
            search(e);
        }
    });
    connect($('dosearch'), 'onclick', search);
    // connect('viewacl-advanced-show', 'onclick', function(e) {
    //     e.stop();
    //     toggleElementClass('hidden', 'viewacl-advanced-search');
    // });
});

</script>
