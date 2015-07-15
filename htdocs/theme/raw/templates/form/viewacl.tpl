<input type="hidden" name="accesslist" value="">
<div id="editaccesswrap">

    <h2 class="mtxl">{{str tag=sharedwith section=view}}</h2>
    <table id="accesslisttable" class="fullwidth accesslists table form-inline">
        <thead>
            <tr class="accesslist-head">
                <th></th>
                <th>{{str tag=sharedwith section=view}}</th>
                <th class="text-center">Allow comments</th>
                <th class="text-center">Moderate comments</th>
                <th class="text-center">From</th>
                <th class="text-center">To</th>
            </tr>
        </thead>
        <tbody id ="accesslistitems" data-id="accesslistitems">
        </tbody>
        <tfoot>
            <tr class="accesslist-foot">
                <td class="pl0" colspan="6">
                    <a href="#" id="add-user" class="btn btn-default mtm">
                        <span class="icon icon-plus text-link prs"></span>
                        <span>{{str tag=addarow section=view}}</span>
                    </a>
                </td>
            </tr>
        </tfoot>
    </table>
</div>

<script type="text/x-tmpl" id="row-template">
<tr id="row-{%=o.id%}" data-id="{%=o.id%}">
    <td class="text-center pr0">
    {% if (o.id > 0) { %}
        <a href="#" id="remove-share">
            <span class="icon icon-times icon-lg text-danger"></span>
        </a>
    {% } else { %}
        <span class="icon icon-times icon-lg icon-placeholder">&nbsp;</span>
    {% } %}
    </td>
    <td>
        <div class="dropdown-group">
            <span class="picker input-short">
                <select id="type-{%=o.id%}" name="accesslist[{%=o.id%}][type]" class="js-share-type form-control input-small select">
                    <option disabled selected>Share</option>
                    <optgroup label="Users &amp; Groups">
                        <option id="friend" value="friend">{{str tag=friends section=view}}</option>
                        <option id="group" value="group">{{str tag=groups}}</option>
                        <option id="user" value="user">{{str tag=users}}</option>
                    </optgroup>
                    <optgroup label="Share with" id="potentialpresetitemssharewith">
                        {% for (var i=0; i<o.shareoptions.general.length; i++) { %}
                            <option value="{%=o.shareoptions.general[i].id%}">{%=o.shareoptions.general[i].name%}</option>
                        {% } %}
                    </optgroup>
                    <optgroup label="Institutions" id="potentialpresetitemsinstitutions">
                        {% for (var i=0; i<o.shareoptions.institutions.length; i++) { %}
                            <option value="{%=o.shareoptions.institutions[i].id%}">{%=o.shareoptions.institutions[i].name%}</option>
                        {% } %}
                    </optgroup>
                    <optgroup label="Groups" id="potentialpresetitemsgroups">
                        <option value="{%=o.shareoptions.allGroups.id%}">{%=o.shareoptions.allGroups.name%}</option>
                        {% for (var i=0; i<o.shareoptions.myGroups.length; i++) { %}
                            <option value="{%=o.shareoptions.myGroups[i].id%}">{%=o.shareoptions.myGroups[i].name%}</option>
                        {% } %}
                    </optgroup>
                </select>
            </span>
            <div class="hidden picker input-short" data-select-wrapper="true">
                <select id="hidden-user-search-[{%=o.id%}]" name="accesslist[{%=o.id%}][id]" class=" select js-select2-search"></select>
            </div>
        </div>
    </td>
    <td class="text-center">
        <input name="accesslist[{%=o.id%}][allowcomments]" class="allow-comments-checkbox" type="checkbox" checked>
    </td>
    <td class="text-center">
        <input name="accesslist[{%=o.id%}][approvecomments]" class="moderate-comments-checkbox" type="checkbox">
    </td>
    <td class="text-center js-date" data-name='from' >
        <div class="date-picker js-date-picker">
            <input type="text" name="accesslist[{%=o.id%}][startdate]" class="form-control pull-left" data-setmin="true" setdatatarget="to">
        </div>
    </td>
    <td class="text-center js-date" data-name='to'>
        <div class="date-picker js-date-picker">
            <input type="text" name="accesslist[{%=o.id%}][stopdate]" class="form-control pull-left " data-setmax="true" setdatatarget="from">
        </div>
    </td>
</tr>
</script>

<script type="application/javascript">
var count = 0;

jQuery(function($) {
"use strict";

    $(document).ready(function() {

        function setDatePicker(target){
            target.datetimepicker({
                dateFormat: 'dd/mm/yy',
                showOtherMonths: true,
                selectOtherMonths: true,
                showButtonPanel: true,
                onClose: function( selectedDate ) {
                    var setmin = $(this).attr('data-setmin'),
                        setmax = $(this).attr('data-setmax'),
                        setdatatarget =  $(this).attr('data-setdatatarget'),
                        settarget = $(this).closest('td').siblings(['data-name="' + setdatatarget + '"']).find('input');

                    if(setmin !== undefined){
                        settarget.datetimepicker( "option", "minDate", selectedDate);
                    }
                    if(setmax !== undefined){
                        settarget.datetimepicker( "option", "maxDate", selectedDate);
                    }
                }
            });
        }

        function formatResults (data) {
            if (data.loading) {
                return data.text;
            }
            var markup;

            // Need to know which row
            if (data.grouptype !== undefined) {
                markup = data.name;
            } else {
                markup =
                '<img class="prm" src="' + config.wwwroot + 'thumb.php?type=profileicon&maxwidth=40&maxheight=40&id=' + data.id + '" />' +
                data.firstname + ' ' + data.lastname;
            }
            return markup;
        }

        function formatSelection (data) {
            if (data.grouptype !== undefined) {
                return data.name;
            } else {
                return data.firstname || data.text;
            }
        }

        function attachSelect2Search(object) {
            var self = object;
            $(self).select2({
                ajax: {
                    url: "access.json.php",
                    dataType: 'json',
                    delay: 250,
                    type: 'POST',
                    data: function (params) {
                        return {
                            'type' : $(self).attr('data-type'),
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
                templateSelection: formatSelection
            });
        }

        function addNewRow(shareoptions){

            var data,
                lastrow,
                id,
                newrow;

            if($('#accesslistitems tr').length > 0){
                lastrow = $('#accesslistitems tr:last-child');
                id = parseInt(lastrow.attr('data-id'), 10) + 1;
            } else {
                id = 0;
            }

            data = {
                id: id,
                shareoptions: shareoptions
            };
            
            $('#accesslistitems').append(tmpl("row-template", data));

            newrow = $('#accesslistitems').find('[data-id="' + id + '"]');
            attachShowSelect();
            setDatePicker($(newrow).find('.js-date-picker > input'));
            attachSelect2Search($(newrow).find('.js-select2-search'));
        }

        /*
         * Construct data for share with dropdown
         *
         * @return Array | array of objects
         */
        function shareWithOptions() {
            var general = {{$potentialpresets|safe}},
                institutions = {{$myinstitutions|safe}},
                allGroups = {{$allgroups|safe}},
                myGroups = {{$mygroups|safe}},
                i,
                results = {
                    general: [],
                    institutions: [],
                    allGroups: [],
                    myGroups: []
                },
                item;

            for (i = 0; i < general.length; i = i + 1 ){
                item = general[i];

                results.general[i] = {
                    'id':  item.id,
                    'name': item.name,
                    'selected': item.preset
                };
            }

            for (i = 0; i < institutions.length; i = i + 1 ){
                item = institutions[i];

                results.institutions[i] = {
                    'id':  item.id,
                    'name': item.name,
                    'selected': item.preset
                };
            }

            item = allGroups;
            results.allGroups = {
                'id':  item.id,
                'name': item.name,
                'selected': item.preset
            };

            for (i = 0; i < myGroups.length; i = i + 1 ){
                item = myGroups[i];

                results.myGroups[i] = {
                    'id':  item.id,
                    'name': item.name,
                    'selected': item.preset
                };
            }

            return results;
        };

        function attachShowSelect(){
            // Make search box visible only when friends, groups, or users is selected
            $(".js-share-type").on('change', function(){
                // affic data-type to slect2 k
                var id = $(this).find("option:selected").attr("value"),
                    selectWrapper = $(this).closest('td').find('[data-select-wrapper="true"]');

                // set data-type as a param on select related fields
                selectWrapper.find('> *').attr('data-type', id);

                if (id === "friend" || id === "group" || id === "user") {
                    selectWrapper.removeClass('hidden');
                } else {
                    selectWrapper.addClass('hidden');
                }
            });
        }

        var rows = $('#accesslistitems > tr'),
            i,
            shareoptions = shareWithOptions(rows[i]);



        addNewRow(shareoptions);
        setDatePicker($( ".js-date-picker > input" ));


        // Create a new row
        $('#add-user').on('click', function(e) {
            e.preventDefault();
            addNewRow(shareoptions);
        });

        // Remove a table row when the remove button is clicked
        $(document).on('click', '#remove-share', function($e) {
            $e.preventDefault();
            $(this).closest('tr').remove();
        });

        attachShowSelect();

        $('.allow-comments-checkbox').on('change', function() {
            $('#editaccess_allowcomments').prop('checked', false);
        });
        $('#editaccess_allowcomments').on('change', function() {
            $('.allow-comments-checkbox').prop('checked', true);
        });

        $('.moderate-comments-checkbox').on('change', function() {
            $('#editaccess_approvecomments').prop('checked', false);
        });
        $('#editaccess_approvecomments').on('change', function() {
            $('.moderate-comments-checkbox').prop('checked', true);
        });

        var select2 = $(".js-select2-search"),
            i;

        for(i = 0; i < select2.length; i = i + 1) {
            attachSelect2Search($(select2[i]));
        }
    });
});



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

// function makeCalendarInput(item, type, disabled) {
//     var label = LABEL({
//         'for': type + 'date_' + count,
//         'class': 'accessible-hidden sr-only'
//     }, get_string(type + 'date'));
//     var input = INPUT({
//         'type':'text',
//         'name': 'accesslist[' + count + '][' + type + 'date]',
//         'id'  :  type + 'date_' + count,
//         'value': item[type + 'date'] ? item[type + 'date'] : '',
//         'size': '15'
//     });
//
//     input.disabled = (disabled == 0);
//     return SPAN(null, label, input);
// }

// function setupCalendar(item, type) {
// //    var dateStatusFunc, selectedFunc;
//     if (!$(type + 'date_' + count)) {
//         logWarn('Couldn\'t find element: ' + type + 'date_' + count);
//         return;
//     }
//     var input = jQuery('#' + type + 'date_' + count).datetimepicker({
//         {{$datepickeroptions|safe}}
//         beforeShow: function(input, inst) {
//             setTimeout(function() {
//                 add_prev_next_year(inst);
//             }, 1);
//         },
//         onChangeMonthYear: function(y, m, inst) {
//             setTimeout(function() {
//                 add_prev_next_year(inst);
//             }, 1);
//         },
//         showOn: "input",
//
//     });
// }

// function updateFormChangeChecker() {
//     if (typeof formchangemanager !== 'undefined') {
//         formchangemanager.setFormStateById('{{$formname}}', FORM_CHANGED);
//     }
// }

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
// addLoadEvent(function () {
//     {{if $defaultaccesslist}}
//     // renderAccessListDefault();
//     {{else}}
//     var accesslist = {{$accesslist|safe}};
//     if (accesslist) {
//         forEach(accesslist, function(item) {
//             renderAccessListItem(item);
//         });
//     }
//     {{/if}}
// });

// addLoadEvent(function() {
//     // Populate the "potential access" things (public|loggedin|allfreidns)
//
//     connect($('search'), 'onkeydown', function(e) {
//         if (e.key().string == 'KEY_ENTER') {
//             search(e);
//         }
//     });
//     connect($('dosearch'), 'onclick', search);
//     // connect('viewacl-advanced-show', 'onclick', function(e) {
//     //     e.stop();
//     //     toggleElementClass('hidden', 'viewacl-advanced-search');
//     // });
// });

</script>
