{include file="header.tpl"}
<hr />
<h2 class="ptl">
    {str tag=nameplural section=interaction.forum} &gt; 
    {$subheading}

    {if $publicgroup}
    <a href="{$feedlink}">
        <span class="fa-rss fa"></span>
    </a>
    {/if}
</h2>
<div class="text-right btn-top-right">
    {if $membership}
    {$forum->subscribe|safe}
    {/if}
</div>

<div id="forum-description" class="lead pbl">
    {$forum->description|clean_html|safe}
</div>

<div id="viewforum">
    <h3 class="pbl mbl">
        {str tag=Topics section="interaction.forum"}
    </h3>
    
    {if $membership && ($moderator || ($forum->newtopicusers != 'moderators') && $ineditwindow) }
    <div class="text-right btn-top-right">
        <div class="btn-group">
            <a href="{$WWWROOT}interaction/forum/edittopic.php?forum={$forum->id}" class="btn btn-default newforumtopic">
                <span class="fa fa-plus fa-lg prs text-primary"></span>
                {str tag="newtopic" section="interaction.forum"}
            </a>
            {if $admin}
                <a href="{$WWWROOT}interaction/edit.php?id={$forum->id}" class="btn btn-default editforumtitle">
                    <span class="fa fa-cog"></span>
                    {str tag="edittitle" section="interaction.forum"}
                </a>
                
                <a href="{$WWWROOT}interaction/delete.php?id={$forum->id}" class="btn btn-default deleteforum">
                    <span class="fa fa-trash text-danger"></span>
                    {str tag="deleteforum" section="interaction.forum"}
                </a> 
            {/if}
        </div>
    </div>
    {/if}

    {if $stickytopics || $regulartopics}
    <form action="" method="post">
        <table id="forumtopicstable" class="table fullwidth">
            <thead>
                <tr>
                    <th class="narrow"></th>
                    <th class="narrow"></th>
                    <th class="topic">{str tag="Topic" section="interaction.forum"}</th>
                    <th class="posterth">{str tag="Poster" section="interaction.forum"}</th>
                    <th class="postscount center">{str tag="Posts" section="interaction.forum"}</th>
                    <th class="lastpost">{str tag="lastpost" section="interaction.forum"}</th>
                    {if $moderator}<th class="right btns2"></th>{/if}
                </tr>
            </thead>
            
            {if $stickytopics}
            {include file="interaction:forum:topics.tpl" topics=$stickytopics moderator=$moderator forum=$forum publicgroup=$publicgroup sticky=true}
            {/if}
            
            {if $regulartopics}
            {include file="interaction:forum:topics.tpl" topics=$regulartopics moderator=$moderator forum=$forum publicgroup=$publicgroup sticky=false}
            {/if}
        </table>
        
        {if $regulartopics}
        <div>
            {$pagination|safe}
        </div>
        {/if}
        
        {if $membership && (!$forum->subscribed || $moderator)}
        <div class="forumselectwrap form-inline ptl">
            <select name="type" id="action">
                <option value="default" selected="selected">
                    {str tag="chooseanaction" section="interaction.forum"}
                </option>
                
                {if !$forum->subscribed}
                <option value="subscribe">
                    {str tag="Subscribe" section="interaction.forum"}
                </option>
                
                <option value="unsubscribe">
                    {str tag="Unsubscribe" section="interaction.forum"}
                </option>
                {/if}
                
                {if $moderator}
                <option value="sticky">
                    {str tag="Sticky" section="interaction.forum"}
                </option>
                
                <option value="unsticky">
                    {str tag="Unsticky" section="interaction.forum"}
                </option>
                
                <option value="closed">
                    {str tag="Close" section="interaction.forum"}
                </option>
                
                <option value="open">
                    {str tag="Open" section="interaction.forum"}
                </option>
            {/if}
            
            {if $moderator && $otherforums && (count($otherforums) > 0)}
                <option value="moveto">
                    {str tag="Moveto" section="interaction.forum"}
                </option>
            {/if}
            </select>
        
            {if $moderator && $otherforums && (count($otherforums) > 0)}
            <select name="newforum" id="otherforums" class="hidden">
                {foreach from=$otherforums item=otherforum}
                <option value="{$otherforum->id}">
                    {$otherforum->title}
                </option>
                {/foreach}
            </select>
            {/if}
            
            <button type="submit" name="updatetopics" class="btn btn-success">
                {str tag="updateselectedtopics" section="interaction.forum"}
            </button>
            {if $moderator}
            {contextualhelp plugintype='interaction' pluginname='forum' section='updatemod'}
            
            {else}
            
            {contextualhelp plugintype='interaction' pluginname='forum' section='update'}
            {/if}
        </div>  
        {/if}
        <input type="hidden" name="sesskey" value="{$SESSKEY}">
    </form>
</div>

<div class="forumfooter ptl pbl">
    <p class="lead small-text">
        {str tag="groupadminlist" section="interaction.forum"}
    </p>
    
    {foreach from=$groupadmins item=groupadmin}
        <a href="{profile_url($groupadmin)}" class="label label-default">
            <img src="{profile_icon_url user=$groupadmin maxwidth=20 maxheight=20}" alt="{str tag=profileimagetext arg1=$groupadmin|display_default_name}" class="user-icon-alt">
            {$groupadmin|display_name}
        </a>
    {/foreach}

    {if $moderators}
        <p class="lead small-text">
            {str tag="moderatorslist" section="interaction.forum"}
        </p>
        
        {foreach from=$moderators item=mod}
            <a href="{profile_url($mod)}" class="label label-default">
                <img src="{profile_icon_url user=$mod maxwidth=20 maxheight=20}" alt="{str tag=profileimagetext arg1=$mod|display_default_name}" class="user-icon-alt">
                {$mod|display_name}
            </a>
        {/foreach}
    {/if}
</div>

{else}
<div class="no-result pbl">
    {str tag="notopics" section="interaction.forum"}
</div>
</div>
{/if}

{include file="footer.tpl"}