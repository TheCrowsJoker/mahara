{include file="header.tpl"}
<div class="ptl pbl">
{$form|safe}
</div>
{if $groups}
<div class="panel panel-default mtl">
    <h2 class="panel-heading">{str tag=Results}</h2>
    <div id="findgroups" class="list-group">
        {foreach from=$groups item=group}
            {include file="group/group.tpl" group=$group returnto='mygroups'}
        {/foreach}
    </div>
</div>
{$pagination|safe}
{else}
<div class="no-result ptxl mtxl">
    <p class="lead text-center">{str tag="nogroupsfound" section="group"}</p>
</div>
{/if}
{include file="footer.tpl"}