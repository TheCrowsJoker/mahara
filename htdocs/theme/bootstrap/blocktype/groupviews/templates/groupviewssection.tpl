{foreach from=$items item=view}
    <p class="listrow">
        {if $view.template}
        <div class="">
            {$view.form|safe}
        </div>
        {/if}
        
        <a href="{$view.fullurl}">
            {$view.title}
        </a>
        
        {if $view.description}
        <small class="detail mts">
            {$view.description|str_shorten_html:100:true|strip_tags|safe}
        </small>
        {/if}
        
        {if $view.tags}
        <small class="tags mts">
            <strong>{str tag=tags}:</strong> 
            {list_tags owner=$view.owner tags=$view.tags}
        </small>
        {/if}
    </p>
{/foreach}
