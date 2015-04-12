<div class="friendcell">
    <div class="row">
        {foreach from=$groupmembers item=groupmember}
        <div class="col-xs-6 col-md-3 ">
        <a href="{profile_url($groupmember)}" class="metadata text-center" height="130px">
            <span class="user-icon">
                <img src="{profile_icon_url user=$groupmember maxwidth=60 maxheight=60}" alt="{str tag=profileimagetext arg1=$groupmember|display_default_name}" title="{$groupmember|display_default_name|escape}">
                 <p>{$groupmember|display_default_name|escape}</p>
            </span>
           
        </a>
        </div>
        {/foreach}
    </div>
</div>
