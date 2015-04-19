{include file="header.tpl"}
<div class="btn-group btn-group-top">
    <a class="btn btn-default" href="{$WWWROOT}artefact/plans/new.php">
    	<span class="fa fa-plus fa-lg prs text-primary"></span>
    	{str section="artefact.plans" tag="newplan"}</a>
</div>
<div id="planswrap" class="posts-wrapper clearfix">
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
