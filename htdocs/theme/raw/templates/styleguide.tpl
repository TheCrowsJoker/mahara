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
Used to signify deleting and item.
```
<i class="icon icon-trash" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Spinner
Used to signify loading. icon-pulse makes it spin
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
Used as a edit button.
```
<i class="icon icon-pencil" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Cross
Used as a delete button. Should really use the trash icon instead.
```
<i class="icon icon-times" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Plus
Used as a add new button. Usually also has text-success
```
<i class="icon icon-plus" role="presentation"></i>
```
</section>

<section data-markdown data-category="icons">
### Bars
Used as a menu button.
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
### ToDo: COME BACK TO ME!!!
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
### Question mark

```
<i class="icon icon-question-circle" role="presentation"></i>
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
