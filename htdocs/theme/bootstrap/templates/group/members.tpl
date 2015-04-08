{include file="header.tpl"}

<p class="lead">
    {$instructions|clean_html|safe}
</p>

<div class="memberswrap">
    <div class="memberssearch">
        
        {if $membershiptypes}
        <div class="membershiptypes pbl">
            {foreach from=$membershiptypes item=item implode="&nbsp;|&nbsp;"}
            {if $item.link}
            <a href="{$item.link}">{$item.name}</a>
            {else}
            <strong>{$item.name}</strong>
            {/if}
            {/foreach}
        </div>
        {/if}
        
        <div class="panel panel-default pll pbm">
            {$form|safe}
        </div>
    </div>

    <div class="panel panel-default">
        {if $membershiptype}
        <h2 id="searchresultsheading" class="panel-heading">
            <span class="sr-only">{str tag=Results}: </span>
            {str tag=pendingmembers section=group}
        </h2>
        {else}
        <h2 id="searchresultsheading" class="panel-heading">
            {str tag=Results}
        </h2>
        {/if}
        
        <div id="results">
            <div id="membersearchresults" class="tablerenderer fullwidth listing twocolumn">
                {$results|safe}
            </div>
        </div>
    </div>

    {$pagination|safe}

</div>

{include file="footer.tpl"}
