{include file="header.tpl"}
<div class="text-right btn-top-right">
    <a class="btn btn-success" href="{$WWWROOT}artefact/plans/new.php">{str section="artefact.plans" tag="newplan"}</a>
</div>
<div id="planswrap" class="posts-wrapper">
{if !$plans.data}
    <div class="lead">{$strnoplansaddone|safe}</div>
{else}
    <div id="planslist">
        {$plans.tablerows|safe}
    </div>
   {$plans.pagination|safe}
{/if}
</div>
{include file="footer.tpl"}