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

    bootstrapFileBrowser();


});

