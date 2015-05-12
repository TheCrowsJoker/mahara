/*jslint browser: true, nomen: true,  white: true */

jQuery(function($) {
"use strict";

    /*
     * Add bootstrap class to the add file content for filebrowser
     */
    function bootstrapFileBrowser() {
        // modal screen
        $('.js-filebrowser').wrapInner('<div class="modal-dialog modal-lg"><div class="modal-content modal-filebrowser"></div></div>');
        $('.js-filebrowser').modal('hide');
    }

    function updateFileLegend(e){
        var selectfileTitle = $('.select-file legend a'),
            title = e.originalEvent.data.title;

        if(selectfileTitle.find('.file-name').length > 0) {
            selectfileTitle.find('.file-name').text(' - ' + title);
        } else {
            selectfileTitle.find('.collapse-indicator').before('<span class="metadata file-name"> - '+ title + '</span>');
        }
    }

    $(document).on('fileselect', function(e){
        updateFileLegend(e);
    });

    bootstrapFileBrowser();
});

