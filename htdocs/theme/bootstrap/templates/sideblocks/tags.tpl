<div class="panel panel-default">
    <h3 class="panel-heading has-link">
        <a href="{$WWWROOT}tags.php">{str tag="tags"} <span class="fa fa-arrow-right mls  pull-right"></span></a>
    </h3>
    <div class="tagblock panel-body">
        {if $sbdata.tags}
            {foreach from=$sbdata.tags item=tag}
                <a class="tag"{if $tag->size} style="font-size: {$tag->size}em;"{/if} href="{$WWWROOT}tags.php?tag={$tag->tag|urlencode|safe}" title="{str tag=nitems arg1=$tag->count}">{$tag->tag|str_shorten_text:20}</a> &nbsp;
            {/foreach}
        {else}
            {str tag=youhavenottaggedanythingyet}
        {/if}
    </div>
</div>
