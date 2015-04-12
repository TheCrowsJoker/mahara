<div id="wall" class="wall">
    {if $wallmessage}
        <div class="message">{$wallmessage}</div>
    {/if}
    {if $wallposts}

        {foreach from=$wallposts item=wallpost}
            <div class="panel panel-default wallpost{if $wallpost->private} private{/if} {cycle name=rows values='r0,r1'}">
                <a href="{$wallpost->profileurl}" class="userinfo panel-heading">
                         <img class="user-icon small-icon" src="{profile_icon_url user=$wallpost maxheight=25 maxwidth=25}" alt="{str tag=profileimagetext arg1=$wallpost|display_default_name}">
                        {$wallpost->displayname} - <span class="postedon metadata">{$wallpost->postdate|format_date}</span>
                </a> 
                <div class="detail panel-body">{$wallpost->text|parse_bbcode|safe}</div>
                <div class="controls panel-footer">
       {* {if $ownwall}
                    <a href="{$WWWROOT}blocktype/wall/wall.php?instance={$instanceid}&amp;replyto={$wallpost->id}" class="btn btn-default">{str tag='reply' section='blocktype.wall'}</a>
        {/if}*}
                {if $wallpost->deletable}
                    <a href="{$WWWROOT}blocktype/wall/deletepost.php?postid={$wallpost->postid}&return={if $wholewall}wall{else}profile{/if}" class="">
                        <span class="fa fa-trash prs"></span>
                       {str tag='delete' section='blocktype.wall'}
                    </a>
                {/if}
                </div>
            </div>
        {/foreach}

    {/if}
</div>
{if !$wholewall}
    <div class="morelinkwrap"><a class="morelink" href="{$WWWROOT}blocktype/wall/wall.php?id={$instanceid}">{str tag='wholewall' section='blocktype.wall'} &raquo;</a></div>
{/if}
