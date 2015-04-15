<div class="groupinfo panel-heading panel-heading-nested">
    <p class="metadata text-right">
       {str tag=Created section=group}: {$group->ctime}
    </p>
</div>

<div class="panel-body">
    <p class="lead small-text">
        {$group->settingsdescription}
    </p>
    {if $group->categorytitle}
    <p>
         <span class="lead small-text">{str tag=groupcategory section=group}:</span>
        {$group->categorytitle}
    </p>
    {/if}
    
    {if $editwindow}
    <p>
        <span class="lead small-text">{str tag=editable section=group}:</span>
        {$editwindow}
    </p>
    {/if}
    <p class="lead small-text">{str tag=groupadmins section=group}:</p>
    {foreach name=admins from=$group->admins item=user}
        <a href="{profile_url($user)}" class="label label-default">
            <img src="{profile_icon_url user=$user maxwidth=20 maxheight=20}" alt="{str tag=profileimagetext arg1=$user|display_default_name}" class="user-icon-alt">
            {$user|display_name}
        </a>
    {/foreach}
</div>

<div class="last ptm groupstat panel-footer">
    {if $group->membercount}
    <span class="mrm label label-default">
        {$group->membercount} {str tag=Members section=group}
        
    </span>
    {/if}
    <span class="mrm label label-default">
        {$group->viewcount} {str tag=Views section=view}
    </span>
    <span class="mrm label label-default">
        {$group->filecounts->files} {str tag=Files section=artefact.file}
        
    </span>
    <span class="mrm label label-default">
        {$group->filecounts->folders} {str tag=Folders section=artefact.file}
        
    </span>
    <span class="mrm label label-default">
        {$group->forumcounts} {str tag=nameplural section=interaction.forum}
        
    </span>
    <span class="mrm label label-default">
        {$group->topiccounts} {str tag=Topics section=interaction.forum}
        
    </span>
    <span class="mrm label label-default">
        {$group->postcounts} {str tag=Posts section=interaction.forum}
        
    </span>
</div>
