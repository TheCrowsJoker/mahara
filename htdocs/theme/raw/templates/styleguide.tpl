{include file="header.tpl"}
<h1 id="top">{$heading}</h1>

<p>{$description}</p>

<ul id="category-tabs" class="nav nav-tabs">
</ul>

{*
    examples go here,
    each one should be formatted like so:
<section data-markdown data-category="category-name-goes-here">
### Title of element
Description of element, this can include any markdown formatting, multiple paragraphs etc (optional).
```
<code for the element goes in between the triple backticks - there should only be one triple backtick part per section>
```
</section>

*}



<section data-markdown data-category="buttons">
### Add button
This button has padding on the right of the icon due to the plus class.
```
<button class="btn-default button btn">
    <span class="icon icon-plus icon-lg left" role="presentation"></span>
    Create page
</button>
```
</section>

<section data-markdown data-category="buttons">
### Small add button
This button is used for adding items to a list/table eg url's, users etc
```
<button class="btn-default btn-sm btn">
    <span class="icon icon-plus icon-lg" role="presentation"></span>
</button>
```
</section>

<section data-markdown data-category="buttons">
### Default button
This button is generally the one you will use for most things.
```
<button class="btn-default button btn">
    Default button
</button>
```
</section>

<section data-markdown data-category="buttons">
### Primary button
This button is used for accepting or agreeing with something.
```
<button class="btn-primary button btn">
    Primary button
</button>
```
</section>

<section data-markdown data-category="buttons">
### Yes/no button
This pair of buttons is used for deleting or editing an item.
```
<div id="delete_submit_container" class=" default submitcancel form-group">
    <button type="submit" class="btn-default submitcancel submit btn" name="submit" tabindex="0">
        Yes
    </button>
    <input type="submit" class="btn-default submitcancel cancel" name="cancel_submit" tabindex="0" value="No">
</div>
```
</section>

<section data-markdown data-category="buttons">
### Blocks edit buttons
This pair of buttons is used for editing or deleting a block item.
```
<div class="panel-heading">
<span class="pull-left btn-group btn-group-top">
    <button class="configurebutton btn btn-inverse btn-xs" alt="Configure 'Latest changes I can view' block (ID 24)" data-id="24">
        <span class="icon icon-cog icon-lg"></span>
    </button>
    <button class="deletebutton btn btn-inverse btn-xs" alt="Remove 'Latest changes I can view' block (ID 24)" data-id="24">
        <span class="icon icon-trash text-danger icon-lg"></span>
    </button>
</span>
</div>
```
</section>

<section data-markdown data-category="buttons">
### Button groups
A group of buttons.
```
<div class=" btn-group">
    <a href="#" class="btn btn-default">
        Button group
    </a>
    <a href="#" class="btn btn-default">
        Button group
    </a>

</div>
```
</section>

<section data-markdown data-category="buttons">
### Button group top
A group of buttons aligned on the top. (Box only in example to show the layout of the buttons)
```
<div style="border: 1px solid #cfcfcf; min-height: 50px; padding-right: 10px; width: 400px;">
    <div class="btn-top-right btn-group btn-group-top">
        <a class="btn btn-default addpost" href="">
            Button group top
        </a>
        <a class="btn btn-default settings" href="">
            Button group top
        </a>

    </div>
</div>
```
</section>

<section data-markdown data-category="buttons">
### Display page
This button is used to display a page you have just edited.
```
<button class="btn-default button btn">
    Display page
    <span class="icon icon-arrow-circle-right right" role="presentation"></span>
</button>
```
</section>

<section data-markdown data-category="buttons">
### Switchbox
Switchboxes are used to turn things on and off or for other true/false type fields.
```
    <div class="form-switch ">
        <div class="switch " style="width:61px">
            <input type="checkbox" class="switchbox" id="siteoptions_dropdownmenu" name="dropdownmenu" tabindex="0" aria-describedby="siteoptions_dropdownmenu_description " aria-label="Drop-down navigation">
            <label class="switch-label" for="siteoptions_dropdownmenu" aria-hidden="true">
                <span class="switch-inner"></span>
                <span class="switch-indicator"></span>
                <span class="state-label on">Yes</span>
                <span class="state-label off">No</span>
            </label>
        </div>
    </div>
```
</section>

<section data-markdown data-category="buttons">
### Pagination
Has forwards and back buttons.
```
<ul class="pagination pagination-xs">
    <li class=""><span>«<span class="sr-only">Previous page</span></span></li>
    <li class="active"><span>1</span></li>
    <li class=""><a title="" href="link">2</a></li>
    <li class=""><a title="Next page" href="link"> »<span class="sr-only">Next page</span></a></li>
</ul>
```
</section>

<section data-markdown data-category="buttons">
### Nav tabs
Tabs to switch between pages.
```
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#" role="tab" data-toggle="tab" aria-expanded="true">Tab 1</a>
    </li>
    <li role="presentation">
        <a href="#" role="tab" data-toggle="tab" aria-expanded="false">Tab 2</a>
    </li>
    <li role="presentation">
        <a href="#" role="tab" data-toggle="tab" aria-expanded="false">Tab 3</a>
    </li>
    <li role="presentation">
        <a href="#" role="tab" data-toggle="tab" aria-expanded="false">Tab 4</a>
    </li>
</ul>
```
</section>

<section data-markdown data-category="buttons">
### Arrow bar
Another style of tabs used for third level nav on groups and webservices.
```
<div class="arrow-bar group">
    <span class="arrow hidden-xs">
        <span class="text">
            Tabs
        </span>
    </span>
    <span class="right-text">
        <ul class="nav nav-pills nav-inpage">
            <li class=" current-tab active">
                <a class=" current-tab" href="#">
                    Tab 1
                    <span class="accessible-hidden sr-only">(tab selected)</span>
                </a>
            </li>
            <li class=" current-tab">
                <a class=" current-tab" href="#">
                    Tab 2
                    <span class="accessible-hidden sr-only">(tab selected)</span>
                </a>
            </li>
            <li class=" current-tab ">
                <a class=" current-tab" href="#">
                    Tab 3
                    <span class="accessible-hidden sr-only">(tab selected)</span>
                </a>
            </li>
            <li class=" current-tab">
                <a class=" current-tab" href="#">
                    Tab 4
                    <span class="accessible-hidden sr-only">(tab selected)</span>
                </a>
            </li>
        </ul>
    </span>
</div>
```
</section>


<section data-markdown data-category="panels">
### Panel
A basic panel.
```
<div class="panel panel-default">
    <h3 class="panel-heading has-link">
        <a href="#">Tags <span class="icon icon-arrow-right pull-right" role="presentation"></span></a>
    </h3>
    <div class="tagblock panel-body">
        <a title="1 item" href="#" class="tag">llamas</a> &nbsp;
        <a title="1 item" href="#" class="tag">pineapple</a> &nbsp;
    </div>
</div>
```
</section>

<section data-markdown data-category="panels">
### Delete panel
A delete panel.
```
<div class="panel panel-danger view-container">
    <h2 class="panel-heading">Delete</h2>
    <div class="panel-body">
        <p><strong>Title</strong></p>
        <p>Are you really sure you wish to delete this?</p>
        <div class=" default submitcancel form-group">
            <button type="submit" class="btn-default submitcancel submit btn" tabindex="0">Yes</button>
            <input type="submit" class="btn-default submitcancel cancel" tabindex="0" value="No">
        </div>

    </div>
</div>
```
</section>

<section data-markdown data-category="panels">
### Side panel
A side panel.
```
<div class="col-md-3 sidebar">
    <div class="panel panel-default">
        <h3 class="panel-heading">
            Side panel
            <br>
            <span  class="text-small text-midtone">(Description)</span>
        </h3>
        <ul class="list-group">
            <li class="list-group-item list-unstyled list-group-item-link">
                <a>
                    Side panel
                </a>
            </li>

        </ul>
        <a href="http://mahara.liamsharpe.wgtn.cat-it.co.nz/user/online.php" class="panel-footer text-small">
            Side panel footer
            <span class="icon icon-arrow-circle-right pull-right"></span>
        </a>
    </div>
</div>
```
</section>

<section data-markdown data-category="panels">
### Dropdown panel
A dropdown panel.
```
<div class="last form-group collapsible-group">
    <fieldset class="pieform-fieldset last collapsible">
        <legend>
            <h4>
                <a href="#dropdown" data-toggle="collapse" aria-expanded="false" aria-controls="dropdown" class="collapsed">
                    Dropdown
                    <span class="icon icon-chevron-down collapse-indicator right pull-right"> </span>
                </a>
            </h4>
        </legend>
        <div class="fieldset-body collapse " id="dropdown">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis metus orci, in posuere nulla tempus quis. Curabitur aliquet, turpis sit amet fermentum euismod, nisl massa posuere nulla, sed tempor lorem magna a urna. In porttitor lobortis mauris, et tristique ipsum hendrerit a. In et quam fringilla, accumsan enim et, fermentum diam. Ut risus lectus, feugiat eget dolor sed, fringilla fringilla nulla. Vivamus laoreet mollis ex ut pulvinar. Praesent ultrices enim sem, vel mattis tellus feugiat et.
        </div>
</fieldset>
</div>
```
</section>

<section data-markdown data-category="modals">
### Modal docked
A slide out panel.
```
<button type="button" class="btn btn-primary" data-toggle="modal-docked" data-target="#modal-docks">
    Launch demo modal
</button>

<div class="modal modal-docked modal-docked-right modal-shown closed" id="modal-docks" tabindex="-1" role="dialog" aria-labelledby="#modal-docks-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button class="deletebutton close" data-dismiss="modal-docked" aria-label="Close">
                  <span class="times">×</span>
                  <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title blockinstance-header  text-inline modal-docks-title" >Modal heading</h4>
            </div>
            <div class="modal-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium, magna in tempor accumsan, augue lacus pretium urna, fringilla malesuada orci eros iaculis dui. Donec blandit urna sed condimentum ullamcorper. Vestibulum commodo hendrerit suscipit. Etiam eget fermentum risus. Etiam faucibus elit at tortor molestie rutrum at nec ex. Mauris id elit sed neque rhoncus iaculis. Maecenas id dui turpis.
            </div>
        </div>
    </div>
</div>
```
</section>


<section data-markdown data-category="tables">
### Table
A normal table.
```
<table class="table fullwidth table-padded">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
            <th class="text-center">Column 3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <h3 class="title">
                    <a href="">Item 1</a>
                </h3>

                <div class="forumpath text-small text-midtone">
                    <a href="" class="topicgroup text-muted">Info</a> /
                    <a href="" class="topicforum  text-midtone">More info</a>
                </div>
            </td>
            <td>
                <p class="postdetail">
                    Item 1
                </p>
                <span class="poster text-small text-midtone">
                    <a href="">
                        User
                    </a>
                    - 10 February 2016, 11:03 AM
                </span>
            </td>
            <td class="text-center">2</td>
        </tr>
    </tbody>
</table>
```
</section>

<section data-markdown data-category="tables">
### Striped table
A striped table.
```
<table class="fullwidth table table-striped">
    <thead>
        <tr>
            <th>Column 1</th>
            <th class="center">Column 2</th>
            <th class="center">Column 3</th>
            <th>Column 4</th>

            <th>Column 5</th>
            <th><span class="accessible-hidden sr-only">Edit</span></th>
        </tr>
    </thead>
    <tbody>
        <tr class="r0">
            <td><a href="">Item 1</a></td>
            <td class="center">3</td>
            <td class="center">1</td>
            <td>Item 1 info</td>
            <td>Item 1 stuff</td>
            <td class="right">
                <div class="btn-group">
                    <a class="btn btn-default btn-sm" title="Manage" href="">
                        <span class="icon icon-cog icon-lg"></span><span class="sr-only">Manage "Item 1"</span>
                    </a>
                    <a class="btn btn-default btn-sm" title="Delete" href="">
                        <span class="icon icon-trash text-danger icon-lg"></span><span class="sr-only">Delete "Item 1"</span>
                    </a>
                </div>
            </td>
        </tr>
        <tr class="r1">
            <td><a href="">Item 2</a></td>
            <td class="center">5</td>
            <td class="center">2</td>
            <td>Item 2 info</td>

            <td>Item 2 stuff</td>
            <td class="right">
                <div class="btn-group">
                    <a class="btn btn-default btn-sm" title="Manage" href="">
                        <span class="icon icon-cog icon-lg"></span><span class="sr-only">Manage "Item 2"</span>
                    </a>
                    <a class="btn btn-default btn-sm" title="Delete" href="">
                        <span class="icon icon-trash text-danger icon-lg"></span><span class="sr-only">Delete "Item 2"</span>
                    </a>
                </div>
            </td>
        </tr>
    </tbody>
</table>
```
</section>


<section data-markdown data-category="dropdowns">
### Normal dropdown menu
A dropdown select box.
```
<div class="input-small select form-group">
    <label for="searchviews_orderby">
        Dropdown:
    </label>
    <span class="picker">
        <select class="form-control input-small select" name="orderby" tabindex="0" style="">
        	<option value="1" selected="selected">Option 1</option>
        	<option value="2">Option 2</option>
        	<option value="3">Option 3</option>
        	<option value="4">Option 4</option>
        </select>
    </span>
</div>
```
</section>

<section data-markdown data-category="dropdowns">
### Normal dropdown menu
A dropdown select box.
```
<form class="pieform form-inline with-heading" name="search" method="post">
    <div class="dropdown-group js-dropdown-group form-group">
        <fieldset class="pieform-fieldset dropdown-group js-dropdown-group">
            <div class="with-dropdown js-with-dropdown text form-group">
                <label for="search_query">
                    Search:
                </label>
                <input type="text" class="form-control with-dropdown js-with-dropdown text autofocus" name="query" tabindex="0" value="" placeholder="Option 1">
            </div>
	        <div id="search_filter_container" class="dropdown-connect js-dropdown-connect select form-group">
                <label for="search_filter">
                    Filter:
                </label>
                <span class="picker">
                    <select class="form-control dropdown-connect js-dropdown-connect select" id="search_filter" name="filter" tabindex="0" style="">
                    	<option value="1" selected="selected">Option 1</option>
                    	<option value="2">Option 2</option>
                    	<option value="3">Option 3</option>
                    	<option value="4">Option 4</option>
                    </select>
                </span>
            </div>
        </fieldset>
    </div>
</form>
```
</section>


<section data-markdown data-category="icons">
### Copy to clipboard
As used on the secret URLs page.
```
<i class="icon icon-files-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Extensions
As used on the extension pages.
```
<i class="icon icon-puzzle-piece" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Trash
Used on buttons to signify deleting an item. "Text-danger" makes the icon red.
```
<i class="icon icon-trash text-danger" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Spinner
Used to signify loading. "Icon-pulse" makes it spin
```
<i class="icon icon-spinner icon-pulse" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Check
Used to signify a successful action.
```
<i class="icon icon-check" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Exclamation triangle
Used to signify an unsuccessful action or a warning.
```
<i class="icon icon-exclamation-triangle" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Group
As used on the group pages.
```
<i class="icon icon-users" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Cog
Used as a settings button.
```
<i class="icon icon-cog" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Star
As used on the register site page.
```
<i class="icon icon-star" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Paint brush
Used to signify themes and styling.
```
<i class="icon icon-paint-brush" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Shield
As used on the cookie consent page.
```
<i class="icon icon-shield" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Legal
As used on the licences page.
```
<i class="icon icon-legal" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Pencil
Used on edit buttons.
```
<i class="icon icon-pencil" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Cross
Used as a delete button. Should really use the trash icon instead. "Text-danger" makes the icon red.
```
<i class="icon icon-times text-danger" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Plus
Used as a add new button. "Text-success" makes the icon green.
```
<i class="icon icon-plus text-success" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Bars
Used on menu buttons.
```
<i class="icon icon-bars" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Exchange
As seen on the networking page.
```
<i class="icon icon-exchange" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Refresh
As seen on the networking page.
```
<i class="icon icon-refresh" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Cogs
As seen on the options page.
```
<i class="icon icon-cogs" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Refresh
As seen on the networking page.
```
<i class="icon icon-refresh" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Key
As seen on the share views page.
```
<i class="icon icon-key" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### File text
As seen on the views page.
```
<i class="icon icon-file-text" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Area chart
As seen on the statistics page.
```
<i class="icon icon-area-chart" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Add user
As seen on the add user page.
```
<i class="icon icon-user-plus" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### User
As seen on the admin user page.
```
<i class="icon icon-user" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Remove user
Remove users.
```
<i class="icon icon-user-times" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### University
Used on the institution pages.
```
<i class="icon icon-university" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Ban
Used to signify banning a user.
```
<i class="icon icon-ban" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Lock
Used as a security icon.
```
<i class="icon icon-lock" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Download
Used to signify downloadable content.
```
<i class="icon icon-download" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### File image
As seen on the site files page.
```
<i class="icon icon-file-image-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Arrow right
Arrow pointing right. Usually means next step.
```
<i class="icon icon-arrow-right" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Long arrow up
Long arrow pointing up. Used for sorting items vertically.
```
<i class="icon icon-long-arrow-up" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Long arrow down
Long arrow pointing down. Used for sorting items vertically.
```
<i class="icon icon-long-arrow-down" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Long arrow left
Long arrow pointing left. Used for sorting items horizontally.
```
<i class="icon icon-long-arrow-left" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Long arrow right
Long arrow pointing right. Used for sorting items horizontally.
```
<i class="icon icon-long-arrow-right" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Folder open
Used to signify a folder of items.
```
<i class="icon icon-folder-open" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Filter
Used to signify filtering items.
```
<i class="icon icon-filter" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Circle cross
Used to signify removable columns on a table.
```
<i class="icon icon-times-circle" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Previous
Arrow pointing left. Usually signifies collapsible elements.
```
<i class="icon icon-chevron-left" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Next
Arrow pointing right. Usually signifies collapsible elements.
```
<i class="icon icon-chevron-right" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Up
Arrow pointing up. Usually signifies collapsible elements.
```
<i class="icon icon-chevron-up" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Down
Arrow pointing down. Usually signifies collapsible elements.
```
<i class="icon icon-chevron-down" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Help
Used as a help icon.
```
<i class="icon icon-info-circle" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Inbox
Used to show the inbox.
```
<i class="icon icon-inbox" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Outbox
Used to show the outbox
```
<i class="icon icon-paper-plane" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Search
Used to signify searchable items
```
<i class="icon icon-search" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### RSS
Used to show external sources.
```
<i class="icon icon-rss" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Remove
Pretty much the same as the times icon. Should use the trash icon instead.
```
<i class="icon icon-remove" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Plus circle
Used to show adding something new. Usually a new table row.
```
<i class="icon icon-plus-circle" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Book
As used on the journals page.
```
<i class="icon icon-book" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Annotation
used on the annotations block.
```
<i class="icon icon-annotation" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Calendar
Usually used on buttons to signify a pop-up date selctor.
```
<i class="icon icon-calendar" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Tags
used to show tags.
```
<i class="icon icon-tags" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Comments
Used to show comments.
```
<i class="icon icon-comments" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Paperclip
Used to show attachments.
```
<i class="icon icon-paperclip" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Reply
Used to show you can reply to something. Usually comments or messages.
```
<i class="icon icon-reply" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Level up
Used in the file browser to signify going up a folder.
```
<i class="icon icon-level-up" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Caret down
Used to show a dropdown menu.
```
<i class="icon icon-caret-down" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Envelope
Used as an inbox item.
```
<i class="icon icon-envelope" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Check square
used as a checked checkbox.
```
<i class="icon icon-check-square-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Square
used as an un-checked checkbox.
```
<i class="icon icon-square-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Arrow circle right
Usually shows moving to a next step.
```
<i class="icon icon-arrow-circle-right" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Comments
used on the forum posts block.
```
<i class="icon icon-comments-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Wrench
used on a system message notification
```
<i class="icon icon-wrench" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Reply all
Used to show replying to multiple people.
```
<i class="icon icon-reply-all" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Flag
used to signify flagging inappropriate content
```
<i class="icon icon-flag" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Table
Shows you can export site statistics.
```
<i class="icon icon-table" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Area chart
Used to show statistics.
```
<i class="icon icon-area-chart" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Unlock
Used on the share dashboard block.
```
<i class="icon icon-unlock" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Ellipsis
Shows there are more options available.
```
<i class="icon icon-ellipsis-h" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Birthday cake
Shows the date something was created.
```
<i class="icon icon-birthday-cake" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Undo
Used to show something can be undone or refreshed.
```
<i class="icon icon-undo" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Sign out
Used to show the sign out button.
```
<i class="icon icon-sign-out" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Sign in
Used to show the sign in button.
```
<i class="icon icon-sign-in" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Code
Used to show the HTMl block.
```
<i class="icon icon-code" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Heart
Shows that something has been favourited
```
<i class="icon icon-heart" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Heart hollow
Shows something can be favourited
```
<i class="icon icon-heart-o" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### User secret
used to show you can log in as another user.
```
<i class="icon icon-user-secret" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Globe
Shows the secret URL's button
```
<i class="icon icon-globe" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Angle double right
Shows that a panel can be expanded or collapsed to the right.
```
<i class="icon icon-angle-double-right" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Angle double left
Shows that a panel can be expanded or collapsed to the left.
```
<i class="icon icon-angle-double-left" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Arrows
Shows that an object can be dragged and dropped.
```
<i class="icon icon-arrows" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Columns
Used as the edit layout button.
```
<i class="icon icon-columns" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Navigation
Used on the navigation block.
```
<i class="icon icon-navigation" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Text
Used on the text block.
```
<i class="icon icon-text" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Image
Used on the image block.
```
<i class="icon icon-image" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Media
Used on the media category block.
```
<i class="icon icon-fileimagevideo" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### File download
Used on the file download block.
```
<i class="icon icon-filedownload" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Folder
Used on the folder block.
```
<i class="icon icon-folder" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Text
Used on the text block.
```
<i class="icon icon-text" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Internal media
Used on the internal media block.
```
<i class="icon icon-internalmedia" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### PDF
Used on the PDF block.
```
<i class="icon icon-pdf" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Recent posts
Used on the recent journal entries block.
```
<i class="icon icon-recentposts" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Text
Used on the text block.
```
<i class="icon icon-text" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Tagged posts
Used on the tagged journal entries block.
```
<i class="icon icon-taggedposts" role="presentation"></i>
```
</section>


{*
    end of examples
*}

<div id="scroll-to-top" class="container">
    <a href="#top" class="btn btn-primary">{$scrollup}</a>
</div>

<script type="text/javascript" src="https://cdn.rawgit.com/chjj/marked/v0.3.5/marked.min.js"></script>
<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/v1.5.1/dist/clipboard.min.js"></script>
<script type="text/javascript">
    // using inline js here because it's so specific to the use case of the style guide
    // this is all done on the client side and would be to inefficient for anything other than the styleguide

    var categories = [];

    (function styleguide(){

      [].forEach.call( document.querySelectorAll('[data-markdown]'), function  fn(elem, i){

        // modified from https://gist.github.com/paulirish/1343518
        // strip leading whitespace so it isn't evaluated as code
        var text      = elem.innerHTML.replace(/\n\s*\n/g,'\n'),
            // set indentation level so your markdown can be indented within your HTML
            leadingws = text.match(/^\n?(\s*)/)[1].length,
            regex     = new RegExp('\\n?\\s{' + leadingws + '}','g'),
            md        = text.replace(regex,'\n'),
            html      = marked(md);

        elem.innerHTML = html;

        // add in the example code using jQuery
        var codeElem = $j(elem).find('code');
        var code = $j.parseHTML(codeElem.text());
        codeElem.parent().before(code);
        codeElem.attr('id', 'code-block-' + i);

        // add copy button
        codeElem.before('<button class="copy" role="presentation" data-clipboard-target="#code-block-' + i + '" title="{$copy}"><i class="icon icon-files-o"></i></button>');

        // add the category to the sections index
        var category = $j(elem).data('category');

        if ($j.inArray(category, categories) === -1) {
            categories.push(category);
        }

        // hide this section if it isn't part of the first category in the array
        if (category !== categories[0]) {
            $j(elem).hide();
        }
      });

      // init copy to clipboard buttons
      new Clipboard('.copy');

      // build section tabs
      $j.each(categories, function(i, category) {
          var readableName = category.replace("-", " ");
          if (i === 0) {
              $j('#category-tabs').append('<li class="active"><a href="#" data-category="' + category + '">' + readableName + '</a></li>');
          } else {
              $j('#category-tabs').append('<li><a href="#" data-category="' + category + '">' + readableName + '</a></li>');
          }
      });

      // handle tab click
      $j('#category-tabs a').click(function(event) {
          var category = $j(this).data('category');
          event.preventDefault();
          $j(this).parent().siblings().removeClass('active');
          $j(this).parent().addClass('active');

          $j('[data-markdown]').each(function(){
              if ($j(this).data('category') !== category) {
                  $j(this).hide();
              } else {
                  $j(this).show();
              }
          });

      });

      // prevent example clicks going elsewhere
      $j('[data-markdown] a').click(function(event) {
          event.preventDefault();
      });

      // scroll to top button position
      $j(window).scroll(function() {
          var scroll = $j(window).scrollTop();
          if (scroll < 100) {
              $j('#scroll-to-top').removeClass('fixed');
          } else {
              $j('#scroll-to-top').addClass('fixed');
          }
      });

      $j('#scroll-to-top a').click(function(event) {
          event.preventDefault();
          $j(window).scrollTop(0);
      });

    }());

</script>




{include file="footer.tpl"}
