<div class="{if $user->pending}pending panel-warning{else}panel-default{/if} panel panel-half">
    <h3 class="panel-heading profile-block">
        <a href="{profile_url($user)}">
            {$user->display_name}
            {if $user->pending}
            <span class="pendingfriend"> 
            <i>- {str tag='pending' section='group'}</i>
            </span>
            {elseif $user->friend && $page == 'find'}
            <span class="existingfriend"> 
            <i>- {str tag='existingfriend' section='group'}</i>
            </span>
            {/if}
        </a>
        <span class="user-icon" id="friendinfo_{$user->id}">
            <img src="{profile_icon_url user=$user maxwidth=60 maxheight=60}" alt="{str tag=profileimagetext arg1=$user|display_default_name}">
        </span>
    </h3>
    <div class="panel-body">
        {if $user->institutions}
        <div class="memberof detail pbm prxxl">
            <span class="fa fa-university prs"></span>
            {$user->institutions|safe}
        </div>
        {/if}
        <div class="content pbm">
            {if $user->introduction}
            <p class="intro prxxl">
                {$user->introduction|str_shorten_html:100:true|safe}
            </p>
            {/if}
            
            {if $user->friend && $page == 'myfriends' && $user->views}
            <p class="viewlist">
                <span class="lead small-text">
                    {str tag='Views' section='group'}:
                </span>
                {foreach from=$user->views item=view}
                <span>
                    <a href="{$view->fullurl}">{$view->title}</a>
                </span>
                {/foreach}
            </p>
            {/if}
            
            {if $user->pending}
            <div class="whymakemeyourfriend">
                <span class="lead small-text">
                    {str tag='whymakemeyourfriend' section='group'}
                </span>
                <p>{$user->message|format_whitespace|safe}</p>
            </div>
            {/if}
        </div>
        {if $user->messages}
        <div class="sendmessage small-text prxxl">
            <span class="fa fa-envelope prs"></span>
            <a href="{$WWWROOT}user/sendmessage.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="text-right" title="{str tag='sendmessage' section='group'}">
            {str tag='sendmessage' section='group'}
            </a>
        </div>
        {/if}
        {if $admingroups}
        <div class="editgroup small-text prxxl">
            <span class="fa fa-pencil prs"></span>
            <a href="" onclick="showGroupBox(event, {$user->id})" class="btn-edit">{str tag='editgroupmembership' section='group'}</a>
        </div>
        {/if}
    </div>

    {if $user->pending}
    <div class="has-form small-text panel-footer btn-toggle">
        <div class="btn">
            <span class="fa fa-check fa-lg text-primary prs"></span>
            {$user->accept|safe}
        </div>

        <a href="{$WWWROOT}user/denyrequest.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="btn">
             <span class="fa fa-ban prs fa-lg text-danger"></span>
            {str tag='denyrequest' section='group'}
        </a>
    </div>
    {/if}
    {if $user->friend}
        <a href="{$WWWROOT}user/removefriend.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="panel-footer">
            <span class="fa fa-remove prs fa-lg text-danger"></span>
            {str tag='removefromfriendslist' section='group'}
        </a>
    {/if}

</div>