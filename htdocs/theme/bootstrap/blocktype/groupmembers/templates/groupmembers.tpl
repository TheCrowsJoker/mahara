<div class="friends">
    <div class="listing blocktype">
        <div class="listrow">
        {if $groupmembers}
            {$groupmembers.tablerows|safe}
        {/if}
        </div>
        <a class="morelink" href="{$show_all.url}">
            {$show_all.message}
            <span class="fa fa-arrow-circle-right mls pull-right"></span>
        </a>
    </div>
</div>
