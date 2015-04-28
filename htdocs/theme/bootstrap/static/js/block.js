/*jslint browser: true, nomen: true,  white: true */

jQuery(function($) {
"use strict";

    // Load content into ajax blocks

    var baseurl = $('head').attr('data-basehref'),
        blocks,
        i,
        id;

    if($('.block').is('[data-blocktype-ajax]')){
        blocks = $('.block[data-blocktype-ajax]');

        for(i = 0; i < blocks.length; i = i + 1) {
            id = $(blocks[i]).attr('data-blocktype-ajax');

           $(blocks[i]).load(baseurl + "blocktype/blocktype.ajax.php?blockid="+ id, function(){
                if ($(this).is(':empty')){
                    $(this).closest('.panel').addClass('hidden');
                }
           });
          
        }
    }

    // Hide empty panels
    $('.block[data-blocktype-noajax]:empty').closest('.panel').addClass('hidden');

});

