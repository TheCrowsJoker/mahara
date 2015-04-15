<div class="bt-{$blocktype} panel panel-secondary" id="blockinstance_{$id}">
    {if $title}
        <h3 class="title panel-heading">
            {if $retractable}
            <a data-toggle="collapse" href="#blockinstance_{$id}_target" aria-expanded="true" aria-controls="blockinstance_{$id}_target">
            {/if}
            
            {$title}
            
            {if $retractable}
            </a>
            {/if}

            {if $viewartefacturl} 
            <a href="{$viewartefacturl}" title="{str tag=clickformoreinformation section=view}" class="detail-link pull-right pls">
                <span class="fa fa-list-alt"></span><span class="sr-only">{str tag=detailslinkalt section=view}</span>
            </a>
            {/if}
            {if $feedlink}
            <a href="{$feedlink}" class="secondary-link pull-right pls">
                <span class="fa-rss fa"></span>
                <span class="sr-only">RSS</span>
            </a>
            {/if}
        </h3>
    {/if}

    <div class="block{if $retractable} collapse{if $retractedonload}{else} in{/if}{/if}"  id="blockinstance_{$id}_target">
        {$content|safe}
    </div>
</div>
