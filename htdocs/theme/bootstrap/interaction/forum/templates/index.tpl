{include file="header.tpl"}

<h2 class="pbl mbl">
    {str tag="nameplural" section=interaction.forum}
    {if $publicgroup}
    <a href="{$feedlink}">
        <span class="fa-rss fa"></span>
    </a>
    {/if}
</h2>

{if $admin}
<div id="forumbtn" class="text-right btn-top-right">
    <a href="{$WWWROOT}interaction/edit.php?group={$groupid}&amp;plugin=forum" class="btn btn-default newforum">
        <span class="fa fa-plus fa-lg prs text-primary"></span>
        {str tag="newforum" section=interaction.forum}
    </a>
</div>
{/if}

{if $forums}
<div id="view-forum" class="table-responsive">
    <table id="forums-list" class="table fullwidth nohead">
        <tr>
            <th>
                {str tag="name" section="interaction.forum"}
            </th>
            <th class="text-center">
                {str tag="Topics" section="interaction.forum"}
            </th>
            <th class="subscribeth">
                <span class="accessible-hidden sr-only">
                    {str tag=Subscribe section=interaction.forum}
                </span>
            </th>
            <th class="control-buttons">
                <span class="accessible-hidden sr-only">
                    {str tag=edit}
                </span>
            </th>
        </tr>
    {foreach from=$forums item=forum}
    <tr class="{cycle values='r0,r1'}">
        <td>
            <h3 class="title">
                <a href="{$WWWROOT}interaction/forum/view.php?id={$forum->id}">
                    {$forum->title}
                </a>
                
                {if $publicgroup}
                <a href="{$forum->feedlink}">
                   <span class="fa-rss fa"></span>
                </a>
                {/if}
            </h3>
            <div class="detail small-text pts">
                {$forum->description|str_shorten_html:1000:true|safe}
            </div>
            
            {if $forum->moderators}
            <div class="inlinelist">
                <span>
                    {str tag="Moderators" section="interaction.forum"}:
                </span>
                
                {foreach from=$forum->moderators item=mod}
                <a href="{profile_url($mod)}">
                    <img src="{profile_icon_url user=$mod maxwidth=20 maxheight=20}" alt="{str tag=profileimagetext arg1=$mod|display_default_name}">
                </a>
                
                <a href="{profile_url($mod)}" class="moderator">
                    {$mod|display_name:null:true}
                </a>
                {/foreach}
            </div>
            {/if}
        </td>
        
        <td class="text-center">
            {$forum->topiccount}
        </td>
        
        <td class="subscribetd">
            {if $forum->subscribe}
            {$forum->subscribe|safe}
            {/if}
        </td>
        
        <td class="right control-buttons">
            <a href="{$WWWROOT}interaction/edit.php?id={$forum->id}&amp;returnto=index" class="icon btn btn-default btn-xs" title="{str tag=edit}">
                <span class="fa fa-pencil"></span>
                <span class="sr-only">{str tag=editspecific arg1=$forum->title}</span>
            </a>
            
            <a href="{$WWWROOT}interaction/delete.php?id={$forum->id}&amp;returnto=index" class="icon btn btn-danger btn-xs" title="{str tag=delete}">
                <span class="fa fa-trash"></span>
                <span class="sr-only">{str tag=deletespecific arg1=$forum->title}</span>
            </a>
        </td>
    </tr>
    {/foreach}
    </table>
</div>
{else}
<div class="message">
    {str tag=noforums section=interaction.forum}
</div>
{/if}
<div class="forummods">
    <p class="lead small-text">
        {str tag="groupadminlist" section="interaction.forum"}
    </p>
    
    {foreach from=$groupadmins item=groupadmin}
        <a href="{profile_url($groupadmin)}" class="label label-default">
            <img src="{profile_icon_url user=$groupadmin maxheight=20 maxwidth=20}" alt="{str tag=profileimagetext arg1=$groupadmin|display_default_name}" class="user-icon-alt"> {$groupadmin|display_name}
        </a>
    {/foreach}
</div>
{include file="footer.tpl"}