/**
 * plugin.js
 *
 * Copyright, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://www.tinymce.com/license
 * Contributing: http://www.tinymce.com/contributing
 */

/*global tinymce:true */

tinymce.PluginManager.add('imagebrowser', function(editor) {

    function imageBrowserDialogue() {
        return function () {
            // open our own dialogue instead of using editor.windowManager.open
            // this enables us to use existing Mahara infrastructure for config windows more easily
            // including firing of Pieform js
            loadImageBrowser();
        }
    }

    function loadImageBrowser() {
        // Check to see if we need to add an overlay. In block edit
        // page we don't as the configure form already has overlay but
        // elsewhere we do.
        var formname = '#imgbrowserconf',
            win, 
            data = {}, 
            dom = editor.dom, 
            imgElm = editor.selection.getNode();

        if (imgElm.nodeName == 'IMG' && !imgElm.getAttribute('data-mce-object') && !imgElm.getAttribute('data-mce-placeholder')) {
            // existing values
            data = {
                src: dom.getAttrib(imgElm, 'src'),
                alt: dom.getAttrib(imgElm, 'alt')//,
                // width: width,
                // height: height
            };
        } else {
            imgElm = null;
        }

        // Parse styles from img
        if (imgElm) {
            data.hspace = removePixelSuffix(imgElm.style.marginLeft || imgElm.style.marginRight);
            data.vspace = removePixelSuffix(imgElm.style.marginTop || imgElm.style.marginBottom);
            data.border = removePixelSuffix(imgElm.style.borderWidth);
            data.style = editor.dom.serializeStyle(editor.dom.parseStyle(editor.dom.getAttrib(imgElm, 'style')));
        } else {
            data.hspace = data.vspace = data.border = data.style = '';
        }

        // are we in a view, somewhere in a group, etc? (forum topic, forum or group page, blog, blog post, etc.?)
        // this determines selected tab for file browser
        // TODO find a better way than scraping the page like this
        var viewid = 0;
        if (jQuery('#viewid').length) {
            viewid = jQuery('#viewid').val()
        }
        var blogpostid = 0;
        if (jQuery('#editpost_blogpost').length) {
            blogpostid = jQuery('#editpost_blogpost').val()
        }
        var blogid = 0;
        if (jQuery('#editpost_blog').length) {
            blogid = jQuery('#editpost_blog').val()
        }
        var postid = 0;
        if (jQuery('#edittopic_post').length) {
            postid = jQuery('#edittopic_post').val()
        }
        var group = 0;
        if (jQuery('#edit_interaction_group').length) {
            group = jQuery('#edit_interaction_group').val();
        } else if (jQuery('input[name="group"]').length) {
            group = jQuery('input[name="group"]').val();
        }
        var pd = {'id': viewid, 'post': postid, 'blogid': blogid, 'blogpostid': blogpostid, 'group': group, 'change': 1};

        sendjsonrequest(config['wwwroot'] + 'json/imagebrowser.json.php', pd, 'POST', function(ibdata) {
            addImageBrowser(ibdata);
            // fill url field
            jQuery(formname + '_url').val(data.src);
        });

        function addImageBrowser(configblock) {
            var browser = jQuery(configblock.data.html);


            jQuery('body').append(browser);
            win = jQuery('#imagebrowser');

            jQuery(formname).submit(function( event ) {
                event.preventDefault();
                onSubmitForm();
            });

            jQuery('#filebrowserupdatetarget').on("click", function() {
                // update dimensions on change of selection
                srcChange(getSelectedImageUrl());
            });

            // Formatting options toggle
            jQuery('#imgbrowserconf_toggleformatting_container').click(function(event) {
                jQuery('#imgbrowserconf_formattingoptions_container').toggleClass('js-hidden');
                jQuery('#formattingoptionstoggle').toggleClass('retracted');
            });

            jQuery(formname + '_align, ' + formname + '_hspace, ' + formname + '_vspace, ' + formname + '_border').change(function() {
                updateStyle();
            });

            var cancelbutton = jQuery(browser).find('#cancel_imgbrowserconf_action_submitimage');
            if (cancelbutton.length) {
                cancelbutton.off('click');
                cancelbutton.on('click', function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    removeImageBrowser();
                });
            }

            var deletebutton = jQuery(browser).find('.deletebutton.close');
            if (deletebutton.length) {
                deletebutton.off('click');
                deletebutton.on('click', function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    removeImageBrowser();
                });
            }

            jQuery(browser).removeClass('hidden');

            (function($) {
                // configblock.javascript might use MochiKit so $ must have its default value
                eval(configblock.data.javascript);
            })(getElement);

            if (deletebutton.length) {
                deletebutton.focus();
            }
        } // end of addImageBrowser()

        function getSelectedImageUrl() {
            var selected = window.imgbrowserconf_artefactid.selecteddata;
            var url;
            for (var a in selected) {
                if (selected[a].artefacttype == 'image' || selected[a].artefacttype == 'profileicon') {
                    url = config.wwwroot + 'artefact/file/download.php?file=' + selected[a].id + "&embedded=1";
                }
            }
            return url;
        }

        function onSubmitForm() {
            function waitLoad(imgElm) {
                function selectImage() {
                    imgElm.onload = imgElm.onerror = null;
                    editor.selection.select(imgElm);
                    editor.nodeChanged();
                }

                imgElm.onload = function() {
                    if (!data.width && !data.height) {
                        dom.setAttribs(imgElm, {
                            width: imgElm.clientWidth,
                            height: imgElm.clientHeight
                        });
                    }
                    selectImage();
                };

                imgElm.onerror = selectImage;
            }

            updateStyle();

            var data = getFormVals();

            if (data.width === '') {
                data.width = null;
            }

            if (data.height === '') {
                data.height = null;
            }

            if (data.style === '') {
                data.style = null;
            }

            data = {
                src: data.src,
                alt: data.alt,
                width: data.width,
                height: data.height,
                style: data.style
            };

            editor.undoManager.transact(function() {
                if (!data.src) {
                    if (imgElm) {
                        dom.remove(imgElm);
                        editor.nodeChanged();
                    }
                    return;
                }

                if (!imgElm) {
                    data.id = '__mcenew';
                    editor.focus();
                    editor.selection.setContent(dom.createHTML('img', data));
                    imgElm = dom.get('__mcenew');
                    dom.setAttrib(imgElm, 'id', null);
                } else {
                    dom.setAttribs(imgElm, data);
                }

                waitLoad(imgElm);
            });
            if (jQuery('#configureblock').length) {
                jQuery('#configureblock').removeClass('hidden');
            }
            removeImageBrowser();
        } // end onSubmitForm

        function removeImageBrowser() {
            setTimeout(function() {
                jQuery('#imagebrowser div.configure').each( function() {
                    jQuery(this).addClass('hidden');
                });
                jQuery('#imagebrowser').remove();
            }, 1);
        }

        function getFormVals() {
            data = {
                    src: jQuery(formname + '_url').val(),
                    alt: jQuery(formname + '_alt').val(),
                    width: jQuery(formname + '_width').val(),
                    height: jQuery(formname + '_height').val(),
                    style: jQuery(formname + '_style').val(),
                    hspace: jQuery(formname + '_hspace').val(),
                    vspace: jQuery(formname + '_vspace').val(),
                    border: jQuery(formname + '_border').val(),
                    align: jQuery(formname + '_align').val(),
                };
            return data;
        }

        function removePixelSuffix(value) {
            if (value) {
                value = value.replace(/px$/, '');
            }
            return value;
        }

        function srcChange(imgurl) {
            getImageSize(imgurl, function(data) {
                if (data.width && data.height) {
                    width = data.width;
                    height = data.height;

                    win.find(formname + '_width').val(width);
                    win.find(formname + '_height').val(height);
                }
            });
            // fill url field
            win.find(formname + '_url').val(imgurl);
        }

        function getImageSize(url, callback) {
            // create dom element in order to get dimensions
            // remove it when done
            var img = document.createElement('img');

            function done(width, height) {
                if (img.parentNode) {
                    img.parentNode.removeChild(img);
                }

                callback({width: width, height: height});
            }

            img.onload = function() {
                done(img.clientWidth, img.clientHeight);
            };

            img.onerror = function() {
                done();
            };

            var style = img.style;
            style.visibility = 'hidden';
            style.position = 'fixed';
            style.bottom = style.left = 0;
            style.width = style.height = 'auto';

            document.body.appendChild(img);
            img.src = url;
        }

        function updateStyle() {
            function addPixelSuffix(value) {
                if (value.length > 0 && /^[0-9]+$/.test(value)) {
                    value += 'px';
                }
                return value;
            }

            var data = getFormVals();
            var css = dom.parseStyle(data.style);

            delete css.margin;
            css['margin-top'] = css['margin-bottom'] = addPixelSuffix(data.vspace);
            css['margin-left'] = css['margin-right'] = addPixelSuffix(data.hspace);
            css['border-width'] = addPixelSuffix(data.border);
            switch(data.align)
                            {
                            case 'left':
                                css['float'] = 'left';
                                css['vertical-align'] = '';
                               break;
                            case 'right':
                                css['float'] = 'right';
                                css['vertical-align'] = '';
                              break;
                            case 'top':
                                css['vertical-align'] = 'top';
                                css['float'] = '';
                              break;
                            case 'bottom':
                                css['vertical-align'] = 'bottom';
                                css['float'] = '';
                              break;
                            case 'middle':
                                css['vertical-align'] = 'middle';
                                css['float'] = '';
                              break;
                            default:
                                css['vertical-align'] = '';
                                css['float'] = '';
                            }

            win.find(formname +'_style').val(dom.serializeStyle(dom.parseStyle(dom.serializeStyle(css))));
        }
    } // end of loadImageBrowser

    editor.addButton('imagebrowser', {
        icon: 'image',
        tooltip: 'Insert/edit image',
        onclick: imageBrowserDialogue(),
        stateSelector: 'img:not([data-mce-object],[data-mce-placeholder])'
    });

    editor.addMenuItem('imagebrowser', {
        icon: 'image',
        text: 'Insert image',
        onclick: imageBrowserDialogue(),
        context: 'insert',
        prependToContext: true
    });
});
