{if $foruminfo}
    <div class="blocktype mtm" id="latestforumposts">
        {foreach from=$foruminfo item=postinfo name=item}
        <div class="row">
            <div class="metadata col-md-1 col-xs-2">
                <a href="{profile_url($postinfo->author)}" class="user-icon small-icon">
                    <img src="{profile_icon_url user=$postinfo->author maxheight=60 maxwidth=60}" alt="{str tag=profileimagetext arg1=$postinfo->author|display_default_name}" />
                </a>
                <p class="smaller-text mts">{$postinfo->author|display_name}</p>
            </div>
            <div class="col-md-11 col-xs-10">
                 <a href="{$WWWROOT}interaction/forum/topic.php?id={$postinfo->topic|escape}&post={$postinfo->id}">
                    {$postinfo->topicname}
                </a>
                 <p class="smaller-text mts">
                    {$postinfo->body|str_shorten_html:100:true|safe}
                </p>
            </div>
        </div>
            {if !$.foreach.item.last}
                <hr />
            {/if}
        {/foreach}
        <a href="{$WWWROOT}interaction/forum/index.php?group={$group->id}" class="panel-footer">
        {str tag=gotoforums section=interaction.forum}
        <span class="fa fa-arrow-circle-right mls"></span>
        </a>
    </div>
{else}
    <div class="panel-body">
        {str tag=noforumpostsyet section=interaction.forum}
    </div>
{/if}

