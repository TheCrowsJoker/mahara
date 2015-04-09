{if $foruminfo}
    <div class="listing blocktype" id="latestforumposts">
        {foreach from=$foruminfo item=postinfo}
        <p class="listrow">
            <a href="{$WWWROOT}interaction/forum/topic.php?id={$postinfo->topic|escape}&post={$postinfo->id}">{$postinfo->topicname}
            </a>
            <small class="detail mts">
                {$postinfo->body|str_shorten_html:100:true|safe}
            </small>
            <a href="{profile_url($postinfo->author)}" class="small-text mts">
                <img src="{profile_icon_url user=$postinfo->author maxheight=20 maxwidth=20}" alt="{str tag=profileimagetext arg1=$postinfo->author|display_default_name}">
                {$postinfo->author|display_name}
            </a>
        </p>
        {/foreach}
        <p class="morelink">
            <a href="{$WWWROOT}interaction/forum/index.php?group={$group->id}">
            {str tag=gotoforums section=interaction.forum}
            <span class="fa fa-arrow-circle-right mls pull-right"></span>
            </a>
        </p>
    </div>
{else}
    <div class="no-resutl">
        {str tag=noforumpostsyet section=interaction.forum}
    </div>
{/if}

