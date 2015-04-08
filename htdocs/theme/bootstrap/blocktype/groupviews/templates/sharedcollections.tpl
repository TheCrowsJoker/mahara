{foreach from=$items item=collection}
    <p class="listrow">
        <a href="{$collection.fullurl}" class="list-group-item-heading">
            {$collection.name}
        </a>
        {if $collection.sharedby}
        <span class="owner"> 
            {str tag=by section=view}
            
            {if $collection.group}
                <a href="{group_homepage_url($collection.groupdata)}">{$collection.sharedby}</a>
            {elseif $collection.owner}
                <a href="{profile_url($collection.user)}">{$collection.sharedby}</a>
            {else}
                {$collection.sharedby}
            {/if}
        </span>
        {/if}
        {if $collection.description}
        <small class="detail mts">
            {$collection.description|str_shorten_html:100:true|strip_tags|safe}
        </small>
        {/if}
        
        {if $collection.tags}
        <small class="tags mts">
            <strong>{str tag=tags}:</strong>
            {list_tags owner=$collection.owner tags=$collection.tags}
        </small>
         {/if}
    </p>
{/foreach}
