{include file="header.tpl"}

{if $membership}
<div id="forumbtns" class="btn-top-right btn-group btn-group-top">
    {if !$topic->forumsubscribed}
    {$topic->subscribe|safe}
    {/if}
    {if $topic->canedit}
    <a href="{$WWWROOT}interaction/forum/edittopic.php?id={$topic->id}" class="btn btn-default editforum">
        <span class="fa fa-pencil"></span>
        {str tag=edittopic section=interaction.forum}
    </a>
    {if $moderator}
    <a href="{$WWWROOT}interaction/forum/deletetopic.php?id={$topic->id}" class="btn btn-default deletetopic">
        <span class="fa fa-trash prs text-danger"></span>
        {str tag=deletetopic section=interaction.forum}
    </a>
    {/if}
    {/if}

</div>
{/if}


<h2 class="ptxl pbm">
    <span class="lead text-small mbs inline ptl">
        <a href="{$WWWROOT}interaction/forum/view.php?id={$topic->forumid}">
            {$topic->forumtitle}
        </a> /
    </span>
    <br />
    {$topic->subject}
</h2>

<hr class="mbxl" />

{if $topic->closed}
<div class="message closed">
    {str tag=topicisclosed section=interaction.forum}
</div>

{else}
    {if $lastpostid}
    <div class="postbtns">
        <a href="{$WWWROOT}interaction/forum/editpost.php?parent={$lastpostid}" class="btn">
            <span class="fa fa-reply"></span>
            {str tag="Reply" section=interaction.forum}
        </a>
    </div>
    {/if}
{/if}

{$posts|safe}

{if !$topic->closed}
{if $lastpostid}
<div class="postbtns">
    <a href="{$WWWROOT}interaction/forum/editpost.php?parent={$lastpostid}" class="btn">
        <span class="fa fa-reply"></span>
        {str tag="Reply" section=interaction.forum}
    </a>
</div>
{/if}
{/if}

<div>
    {$pagination|safe}
</div>
{include file="footer.tpl"}
