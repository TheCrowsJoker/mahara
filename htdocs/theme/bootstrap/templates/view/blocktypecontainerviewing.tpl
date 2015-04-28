<div class="bt-{$blocktype} panel panel-secondary {if $retractable}collapsible panel-collapse{/if}" id="blockinstance_{$id}">
    {if $title}
        <h3 class="title panel-heading js-heading">






            {if $retractable}
            <a data-toggle="collapse" href="#blockinstance_{$id}_target" aria-expanded="true" aria-controls="blockinstance_{$id}_target">
            {/if}
            {$title}
             {if $retractable}
            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
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

    <div class="{if !$title}no-heading {/if}block{if $retractable} collapse{if $retractedonload}{else} in{/if}{/if}"  id="blockinstance_{$id}_target" {if $loadbyajax}data-blocktype-ajax="{$id}"{else}data-blocktype-noajax="{$id}"{/if}>{if !$loadbyajax}{$content|safe}{/if}</div>
    
    {if $viewartefacturl} 

        <a href="{$viewartefacturl}" title="{str tag=clickformoreinformation section=view}" class="panel-footer mtl">
            {str tag=detailslinkalt section=view} 
            <span class="fa fa-arrow-circle-right mls  pull-right"></span>
        </a>

    {/if}
</div>
