<div class="{if $user->pending} pending panel-success{else}panel-default {/if} panel panel-half">
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
            <img src="{profile_icon_url user=$user maxwidth=40 maxheight=40}" alt="{str tag=profileimagetext arg1=$user|display_default_name}">
        </span>
    </h3>
    <div class="panel-body">
        {if $user->institutions}
        <div class="memberof detail pbm">
            <span class="fa fa-university prs"></span>
            {$user->institutions|safe}
        </div>
        {/if}
        <div class="content ptm pbm">
            {if $user->introduction}
            <p class="intro">
                {$user->introduction|str_shorten_html:100:true|safe}
            </p>
            {/if}
            
            {if $user->friend && $page == 'myfriends' && $user->views}
            <p class="viewlist">
                <span>
                    <strong>{str tag='Views' section='group'}:</strong>
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
                <strong>
                    {str tag='whymakemeyourfriend' section='group'}
                </strong>
                <p>{$user->message|format_whitespace|safe}</p>
            </div>
            {/if}
        </div>
        {if $user->messages}
        <div class="sendmessage small-text">
            <span class="fa fa-envelope prs"></span>
            <a href="{$WWWROOT}user/sendmessage.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="text-right" title="{str tag='sendmessage' section='group'}">
            {str tag='sendmessage' section='group'}
            </a>
        </div>
        {/if}
        {if $admingroups}
        <div class="editgroup small-text">
            <span class="fa fa-pencil prs"></span>
            <a href="" onclick="showGroupBox(event, {$user->id})" class="btn-edit">{str tag='editgroupmembership' section='group'}</a>
        </div>
        {/if}
    </div>

    <div class="panel-footer has-form small-text">
        <div class="">
        {if $user->pending}
            <span class="approvefriend pull-left">
                {$user->accept|safe}
            </span>
            <span class="denyrequest mtl">
                <a href="{$WWWROOT}user/denyrequest.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="btn btn-danger btn-xs">
                    {str tag='denyrequest' section='group'}
                </a>
            </span>
        {/if}
        {if $user->friend}
            <span class="removefriend">
                <a href="{$WWWROOT}user/removefriend.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="btn btn-danger btn-xs">
                    <!-- <span class="fa fa-remove prs"></span> -->
                    {str tag='removefromfriendslist' section='group'}
                </a>
            </span>
        {/if}
        </div>
        
<!--         <div>
        {if $user->requestedfriendship}
            <span class="notbtn">
                {str tag='friendshiprequested' section='group'}
            </span>
        {elseif !$user->pending && !$user->friend} {* Not an existing, pending, or requested friend *}
            {if $user->friendscontrol == 'auth'}
            <span class="friend">
                <span class="fa fa-user-plus prs"></span>
                <a href="{$WWWROOT}user/requestfriendship.php?id={$user->id}&amp;returnto={$page}&amp;offset={$offset}" class="btn-request">
                    {str tag='sendfriendrequest' section='group'}
                </a>
            </span>
            {elseif $user->friendscontrol == 'auto'}
            <span class="friend">
                {$user->makefriend|safe}
            </span>
            {else}
            <span class="nofriend">
                    {str tag='userdoesntwantfriends' section='group'}
            </span>
            {/if}
        {/if}
        </div> -->
    </div>
</div>