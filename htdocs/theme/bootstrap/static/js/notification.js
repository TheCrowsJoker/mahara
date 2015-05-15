/*jslint browser: true, nomen: true,  white: true */
/* global jQuery, $ */
jQuery(function($) {
    "use strict";

    function markread(e, self, paginatorData) {

       var checked = $(self).closest('.notification-parent').find('.js-notifications .control.unread input:checked'),
            i,
            paginator = {};

        if(checked.length < 1){
             //@todo maybe tell the user they need soemthign valid cvhecked
            return; //no valid items selected
        }

        for (i = 0; i < checked.length; i++) {
            paginator[checked[i].name] = 1;
        }

        paginator['markasread'] = 1;

        if (paginatorData) {
            for (page in paginatorData.params) {
                if(paginatorData.params.hasOwnProperty(page)){
                    paginator[page] = paginatorData.params[page];
                }
            }
        }

        sendjsonrequest('indexin.json.php', paginator, 'GET', function (data) {
           updateUnread(data, false);
        });
    }

     function deleteselected(e, self, paginatorData) {

       var checked = $(self).closest('.notification-parent').find('.js-notifications .control input:checked'),
            i,
            paginator = {};

        if(checked.length < 1){
            //@todo maybe tell the user they need something valid checked

            return; //no valid items selected
        }

        for (i = 0; i < checked.length; i++) {
            paginator[checked[i].name] = 0;
        }

        paginator['delete'] = 1;

        if (paginatorData) {
            for (page in paginatorData.params) {
                if(paginatorData.params.hasOwnProperty(page)){
                    paginator[page] = paginatorData.params[page];
                }
            }
        }

        sendjsonrequest('indexin.json.php', paginator, 'GET', function (data) {
           // paginator.updateResults(data);
            updateUnread(data, false);
        });
    }

     function markthisread(e, self, paginatorData) {

       var checked = $(self).find('.control.unread input.tocheck'),
           item = self,
           i,
           paginator = {};

       if(checked.length < 1){
            return; //no valid items selected
       }

        for (i = 0; i < checked.length; i++) {
            paginator[checked[i].name] = 1;
        }

        paginator['table'] = $(self).find('a[data-table]').attr('data-table');

        paginator['readone'] = $(self).find('a[data-id]').attr('data-id');

        if (paginatorData) {
            for (page in paginatorData.params) {
                if(paginatorData.params.hasOwnProperty(page)){
                    paginator[page] = paginatorData.params[page];
                }
            }
        }

        sendjsonrequest('indexin.json.php', paginator, 'GET', function (data) {
           updateUnread(data, item);
        });
    }

    function updateUnread(data, self) {
        var inboxmenu = $('.header .inbox'),
            countnode,
            notificationList = $('.notification-list');

        if (inboxmenu.length < 1) {
            return;
        }
        if (data.data.newunreadcount !== undefined) {
            countnode = inboxmenu.find('.unreadmessagecount');
            if (countnode.length > 0) {
                countnode.html(data.data.newunreadcount);
            }
        }
        if(data.data.html){
            notificationList.html(data.data.html);
        } else if(self) {
            $(self).removeClass('panel-primary js-panel-unread').addClass('panel-default');
            $(self).find('.control').removeClass('control');
        }
    }

    function changeactivitytype() {
        var delallform = document.forms['delete_all_notifications'];
        delallform.elements['type'].value = this.options[this.selectedIndex].value;
        var params = {'type': this.options[this.selectedIndex].value};
        sendjsonrequest('indexin.json.php', params, 'GET', function(data) {
            paginator.updateResults(data);
        });
    }

    // We want the paginator to tell us when a page gets changed.
    // @todo: remember checked/unchecked state when changing pages
    function PaginatorData() {
        var self = this;
        var params = {};

        this.pageChanged = function(data) {
            self.params = {
                'offset': data.offset,
                'limit': data.limit,
                'type': data.type
            }
        }

        paginatorProxy.addObserver(self);
        connect(self, 'pagechanged', self.pageChanged);
    }

    if($('.notification-list').attr('[data-paginator]') !== undefined){
        var paginator;
        var paginatorData = new PaginatorData();

        addLoadEvent(function () {
            paginator = $('.notification-list').attr('[data-paginator]');

            connect('notifications_type', 'onchange', changeactivitytype);
        });
    }


    $('.notification .control-wrapper').on('click', function(e) {
        e.stopPropagation();
    });

    // Check all of type
    $('[data-togglecheckbox]').on('change', function(){
        var targetClass = '.' + $(this).attr('data-togglecheckbox');
        $(targetClass).prop('checked', $(this).prop('checked'));
        $(targetClass).trigger('change');
    });

    // Add warning class to all selected notifications
    $('.panel .control input').on('change', function(){
         if ($(this).prop('checked')){
            $(this).closest('.panel').addClass('panel-warning');
        } else {
            $(this).closest('.panel').removeClass('panel-warning');
        }
    });

    $('[data-triggersubmit]').on('click', function(){
        var targetID = '#'  + $(this).attr('data-triggersubmit');
        $(targetID).trigger('click');
    });

    $('[data-action="markasread"]').on('click', function(e){
        e.preventDefault;
        markread(e, this, paginatorData);
    });

    $('[data-action="deleteselected"]').on('click', function(e){
        e.preventDefault;
        deleteselected(e, this, paginatorData);
    });


    $('[data-action="markasread"]').on('click', function(e){
        e.preventDefault;
        markread(e, this, paginatorData);
    });

    $('.js-panel-unread').on('show.bs.collapse', function(e){
        markthisread(e, this, paginatorData);
    });

});
