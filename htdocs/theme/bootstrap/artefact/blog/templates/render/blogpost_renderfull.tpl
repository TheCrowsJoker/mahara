{**
* This template displays a blog post.
*}
<div id="blogpost-{$postid}" class="panel-body">
    {if $artefacttitle}<h3 class="title">{$artefacttitle|safe}</h3>{/if}

    <div class="postdetails metadata mbm">{$postedbyon}</div>

    {$artefactdescription|clean_html|safe}

    {if $artefact->get('tags')}<div class="tags">{str tag=tags}: {list_tags owner=$artefact->get('owner') tags=$artefact->get('tags')}</div>{/if}


    {if $license}
    <div class="postlicense">
        {$license|safe}
    </div>
    {/if}
</div>


{if isset($attachments)}
    <div class="has-attachment panel panel-default mlm mrm">
        <a class="collapsible collapsed in-panel panel-footer" aria-expanded="false" href="#blog-attach-{$postid}" data-toggle="collapse">
            <p class="text-left mbs">
                <span class="fa fa-lg prm fa-paperclip"></span>
                <span class="label label-info mrs"> {$attachments|count}</span>
                <span class="small-text">{str tag=attachedfiles section=artefact.blog}</span>
                <span class="fa fa-chevron-down pull-right collapse-indicator"></span>
            </p>
        </a>


        <div id="blog-attach-{$postid}" class="collapse">
            <ul class="list-unstyled list-group mbs">
            {foreach from=$attachments item=item}
                <li class="list-group-item-text list-group-item-link">
                    <a href="{$item->downloadpath}">
                        <div class="file-icon mrs">
                            <img src="{$item->iconpath}" alt="">
                        </div>
                        {$item->title|truncate:25}
                    </a>
                </li>
            {/foreach}
            </ul>
        </div>
    </div>
{/if}