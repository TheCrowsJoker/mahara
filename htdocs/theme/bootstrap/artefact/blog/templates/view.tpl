{include file="header.tpl"}
<div class="text-right btn-top-right">
    <a class="btn btn-success addpost" href="{$WWWROOT}artefact/blog/post.php?blog={$blog->get('id')}">{str section="artefact.blog" tag="addpost"}</a>
    {if !$blog->get('locked')}
    <a class="btn btn-default settings" href="{$WWWROOT}artefact/blog/settings/index.php?id={$blog->get('id')}">{str section="artefact.blog" tag="settings"}</a>
    {/if}
</div>
<div id="myblogs" class="rel">
    <div id="blogdescription">
        {clean_html($blog->get('description'))|safe}
    </div>
    {if $blog->get('tags')}
    <div class="tags">
        <strong>{str tag=tags}:</strong> {list_tags owner=$blog->get('owner') tags=$blog->get('tags')}
    </div>
    {/if}

    {if $posts}
    <div id="postlist" class="listing ptl">
        {$posts.tablerows|safe}
    </div>
    <div id="blogpost_page_container" class="hidden">{$posts.pagination|safe}</div>
    <script>
    addLoadEvent(function() {literal}{{/literal}
        {$posts.pagination_js|safe}
        removeElementClass('blogpost_page_container', 'hidden');
        {literal}}{/literal});
    </script>
    {else}
    <div class="message">
        {str tag=nopostsyet section=artefact.blog} {if !$blog->get('locked')}<a href="{$WWWROOT}artefact/blog/post.php?blog={$blog->get('id')}">{str tag=addone section=mahara}</a>{/if}
    </div>
    {/if}

    {if $enablemultipleblogstext}
    <p class="dull center">{str tag=enablemultipleblogstext section=artefact.blog arg1=$WWWROOT}</p>
    {/if}
    {if $hiddenblogsnotification}
    <p class="dull center">{str tag=hiddenblogsnotification section=artefact.blog arg1=$WWWROOT}</p>
    {/if}
</div>
{include file="footer.tpl"}
