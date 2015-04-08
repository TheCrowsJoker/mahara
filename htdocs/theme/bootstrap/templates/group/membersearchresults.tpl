{if $results.data}
{foreach from=$results.cdata item=row}
{foreach from=$row item=r}
<div class="listrow">
    <div class="membericon media-left">
        <img src="{profile_icon_url user=$r maxwidth=40 maxheight=40}" alt="{str tag=profileimagetext arg1=$r|display_default_name}" class="prm">
    </div>
    
    <div class="memberdetail media-body">
        <h3 class="title">
            <a href="{profile_url($r)}">
                {$r.name}
            </a>
            
            {if $r.role}
            <span class="grouprole"> - 
                {$results.roles[$r.role]->display}
                
                {if $caneditroles && $r.canchangerole} 
                (<a href="{$WWWROOT}group/changerole.php?group={$group}&amp;user={$r.id}">
                {str tag=changerole section=group}
                </a>)
                {/if}
            </span>
            {/if}
        </h3>
        {if $r.role}
        <div class="rel">
            <div class="detail mts">
                {$r.introduction|str_shorten_html:80:true|safe}
            </div>
            
            <div class="jointime detail mts">
                <strong>
                    {str tag="Joined" section="group"}:
                </strong> 
                {$r.jointime}
            </div>
            <div class="removemember mts">
                {$r.removeform|safe}
            </div>
        </div>
        
        {elseif $membershiptype == 'request'}
        <div class="hasrequestedmembership detail mts">
            {str tag=hasrequestedmembership section=group}.
            
            {if $r.reason}
            <p>
                <strong>{str tag=reason}:</strong> 
                {$r.reason|format_whitespace|safe}
            </p>
            {/if}

            <span class="mts">
                {$r.addform|safe}
            </span>
            
            <span class="">
                {$r.denyform|safe}
            </span>
        </div>

        {elseif $membershiptype == 'invite'}
        <div class="detail mts">
            {str tag=hasbeeninvitedtojoin section=group}
        </div>
        
        {/if}
    </div>
</div>
{/foreach}
{/foreach}
{else}
<div>
    {str tag="noresultsfound"}
</div>
{/if}
