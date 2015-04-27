/*jslint browser: true, nomen: true,  white: true */

jQuery(function($) {
"use strict";

    /*
     * Make sure an affix is always the width of its container element
     */
    function affixSize(){
        var affix = $('[data-spy="affix"]'),
            affixwidth,
            affixheight,
            i;

        for(i = 0; i < affix.length; i = i + 1) {
            affixwidth = $(affix[i]).parent().width();
            affixheight = $(affix[i]).height() + 100;

           $(affix[i]).width(affixwidth);

           // prevents short pages from bouncing the user back to the top
           $(affix[i]).parent().height(affixheight);

        }

        $(window).on('resize colresize', function(){
            var i;

            for(i = 0; i < affix.length; i = i + 1) {
                affixwidth = $(affix[i]).parent().width();
                affixheight = $(affix[i]).height() + 100;

                $(affix[i]).width(affixwidth);

                // prevents short pages from bouncing the user back to the top
                $(affix[i]).parent().height(affixheight);
            }
        });
    }

    /*
     * We need to know the number of site message in ordder to adjust positioning
     */
    function siteMessages() {
        var message;

        // Remove extra padding when there are no site message
        if ($('.site-messages').length === 0) {
            $('.header').addClass('no-site-messages');
            $('.main-nav').addClass('no-site-messages');
        } else if ($('.site-messages') !== undefined) {
            message = $('.site-messages').find('.site-message');
            $('.header').addClass('message-count-'+ message.length);
        }
    }

    /*
     * Add bootstrap class to the add file content for filebrowser
     */
    function bootstrapFileBrowser() {
        // modal screen
        $('.js-filebrowser').wrapInner('<div class="modal-dialog modal-lg"><div class="modal-content modal-filebrowser"></div></div>');
        $('.js-filebrowser').modal('hide');
    }

    /* 
     * Clear form when a form is collapsed
     */
    function resetOnCollapse() {

        $('[data-action="reset-on-collapse"]').on('hidden.bs.collapse', function () {
            var i, 
                forms =$(this).find('form');
            for (i = 0; i < forms.length; i = i + 1){
                forms[i].reset();
            }
        });
    }

    function attachTooltip() {
        $('[data-toggle="tooltip"]').tooltip({
            container: 'body',
            placement: 'right',
            viewport: 'body'
        });
    }


    affixSize();
    siteMessages();
    bootstrapFileBrowser();
    resetOnCollapse();
    attachTooltip();


});

