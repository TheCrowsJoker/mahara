{foreach from=$items item=item}
    <p class="listrow">
        <a href="{$item.url}">
            {$item.name|str_shorten_text:60:true}
        </a>
        
        <span class="owner">
            {str tag=by section=view}
            <a href="{$item.ownerurl}">
            {$item.ownername}
            </a>
        </span>
        
        {* submittedstatus == '2' is equivalent to PENDING_RELEASE *}
        <small class="detail mts">
            {str tag=timeofsubmission section=view}: 
            {$item.submittedtime|format_date} 
            
            {if $item.submittedstatus == '2'}-
            {str tag=submittedpendingrelease section=view}
            {/if}
        </small>
    </p>
{/foreach}
