<div class="friends">
{if $friends}
    <div id="userfriendstable" class="fullwidth">
      {$friends.tablerows|safe}
    </div>
    <div id="myfriends_page_container" class="hidden">{$friends.pagination|safe}</div>

    <script>
    addLoadEvent(function() {literal}{{/literal}
        {$friends.pagination_js|safe}
        removeElementClass('myfriends_page_container', 'hidden');
    {literal}}{/literal});
    </script>
{else}
    {if $lookingatownpage}
        <div class="message panel-body">{str tag="trysearchingforfriends" section=group args=$searchingforfriends}</div>
    {elseif $loggedin}
        {if $relationship == 'none' && $friendscontrol == 'auto'}
            <div class="message panel-body">{$newfriendform|safe}</div>
        {elseif $relationship == 'none' && $friendscontrol == 'auth'}
            <div class="message panel-body"><a href="{$WWWROOT}user/requestfriendship.php?id={$USERID}&amp;returnto=view">{str tag='requestfriendship' section='group'}</a></div>
        {elseif $relationship == 'requestedfriendship'}
            <div class="message panel-body">{str tag=friendshiprequested section=group}</div>
        {/if}
        {* Case not covered here: friendscontrol disallows new users. The block will appear empty. *}
    {/if}
{/if}
</div>
