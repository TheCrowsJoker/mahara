{include file="header.tpl"}
<div class="text-right btn-top-right">
    <a class="btn btn-success" href="{$WWWROOT}artefact/blog/new/index.php">{str section="artefact.blog" tag="addblog"}</a>
</div>
<div id="myblogs" class="rel">
    {if !$blogs->data}
    <div>{str tag=youhavenoblogs section=artefact.blog}</div>
    {else}

    <div class="panel-items js-masonry" data-masonry-options='{ "itemSelector": ".panel" }'>
        {$blogs->tablerows|safe}
    </div>

    {$blogs->pagination|safe}
    {/if}
</div>
{include file="footer.tpl"}