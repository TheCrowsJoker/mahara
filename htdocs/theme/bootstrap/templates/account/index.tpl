{include file="header.tpl"}
{if $candeleteself}
<div class="text-right btn-top-right">
    <a href="{$WWWROOT}account/delete.php" class="btn btn-default  delete">
    	<span class="fa fa-trash fa-lg text-danger prs"></span>
        <span class="text-danger">{str tag=deleteaccount section=account}</span>
    </a>
</div>
{/if}
    {$form|safe}
{include file="footer.tpl"}