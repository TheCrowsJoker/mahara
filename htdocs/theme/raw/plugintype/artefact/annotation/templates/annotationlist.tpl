{foreach from=$data item=item}
<li class="{cycle name=rows values='r0,r1'}{if $item->highlight} list-group-item-warning{/if}{if $item->makepublicform} list-group-item-warning{/if} list-group-item">
    <div class="comment-heading clearfix">
        <span class="user-icon small-icon pull-left mls mts mrm">
            {if $item->author}
                <img src="{profile_icon_url user=$item->author maxheight=25 maxwidth=25}" alt="{str tag=profileimagetext arg1=$item->author|display_default_name}">
            {else}
                <img src="{profile_icon_url user=null maxheight=20 maxwidth=20}" alt="{str tag=profileimagetextanonymous}">
            {/if}
        </span>
        <h5 class="pull-left mt0">
            {if $item->author}
            <a href="{$item->author->profileurl}">
            {/if}
                <span>{$item->author|display_name}</span>
            {if $item->author}
            </a>
            {/if}

            <br />

            <span class="postedon text-small">
            {$item->date}
            {if $item->updated}
                [{str tag=Updated}: {$item->updated}]
            {/if}
            </span>
        </h5>
        <div class="btn-group btn-group-top">
            {if $item->deleteform}
                {$item->deleteform|safe}
            {/if}
            {if $item->canedit}
            <a href="{$WWWROOT}artefact/annotation/edit.php?id={$item->id}&amp;viewid={$viewid}" class="btn btn-default pull-left">
                <span class="icon icon-lg icon-pencil text-default"></span>
                <span class="sr-only">{str tag=edit}</span>
            </a>
            {/if}
        </div>
    </div>

    {if $item->deletedmessage}
        <div class="metadata">
            {$item->deletedmessage}
        </div>
    {else}
        <div>
            {$item->description|safe|clean_html}
        </div>

        {if $item->attachmessage}
        <div class="attachmessage">
            {$item->attachmessage}
        </div>
        {/if}

        <div class="metadata">
            {if $item->pubmessage}
            <em class="privatemessage">
                {$item->pubmessage} -
            </em>
            {/if}

            {if $item->makepublicform}
                {$item->makepublicform|safe}
            {/if}

            {if $item->makepublicrequested}
            <span class="icon icon-lock text-default prs"></span>
            {/if}
        </div>
    {/if}
</li>
{/foreach}
