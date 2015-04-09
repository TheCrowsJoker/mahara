<div class="groupinfo">
    <p>
        {$group->settingsdescription}
    </p>
    
    <p>
        <strong class="groupinfolabel">{str tag=Created section=group}:</strong>{$group->ctime}
    </p>
    
    <p>
        <strong class="groupinfolabel">
            {str tag=groupadmins section=group}:
        </strong> 
        {foreach name=admins from=$group->admins item=user}
            <img src="{profile_icon_url user=$user maxwidth=20 maxheight=20}" alt="{str tag=profileimagetext arg1=$user|display_default_name}">
            <a href="{profile_url($user)}">
                {$user|display_name}
            </a>
            {if !$.foreach.admins.last}, 
            {/if}
        {/foreach}
    </p>
    
    {if $group->categorytitle}
    <p>
        <strong>{str tag=groupcategory section=group}:</strong> 
        {$group->categorytitle}
    </p>
    {/if}
    
    {if $editwindow}
    <p>
        <strong class="groupinfolabel">{str tag=editable section=group}:</strong>
        {$editwindow}
    </p>
    {/if}
</div>

<div class="last ptm groupstat">
    {if $group->membercount}
    <span class="mrm">
        <strong>{str tag=Members section=group}:</strong>
        {$group->membercount}
    </span>
    {/if}
    <span class="mrm">
        <strong>{str tag=Views section=view}:</strong>
        {$group->viewcount}
    </span>
    <span class="mrm">
        <strong>{str tag=Files section=artefact.file}:</strong>
        {$group->filecounts->files}
    </span>
    <span class="mrm">
        <strong>{str tag=Folders section=artefact.file}:</strong>
        {$group->filecounts->folders}
    </span>
    <span class="mrm">
        <strong>{str tag=nameplural section=interaction.forum}:</strong>
        {$group->forumcounts}
    </span>
    <span class="mrm">
        <strong>{str tag=Topics section=interaction.forum}:</strong>
        {$group->topiccounts}
    </span>
    <span class="mrm">
        <strong>{str tag=Posts section=interaction.forum}:</strong>
        {$group->postcounts}
    </span>
</div>
