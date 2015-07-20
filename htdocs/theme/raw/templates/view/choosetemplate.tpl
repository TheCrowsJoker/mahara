{include file="header.tpl"}
<form class="pieform form searchquery with-heading form-inline" action="{$WWWROOT}view/choosetemplate.php" method="post">

    <div class="input-group form-group" id="searchpages">
        <fieldset class="pieform-fieldset input-group">
            <div class="form-group text">
                <label class="sr-only" for="viewquery">{str tag="Search" section="view"}:</label>
                <input type="text" name="viewquery" id="viewquery" class="query form-control text" value="{$views->query}">
            </div>

            <div class="form-group input-group-btn">
                <button class="query-button btn btn-primary" type="submit">{str tag="Search" section="view"}</button>
            </div>
        </fieldset>
    </div>

    <input type="hidden" name="viewlimit" value="{$views->limit}">
    <input type="hidden" name="viewoffset" value="0">
    {if $views->group}<input type="hidden" name="group" value="{$views->group}">{/if}
    {if $views->institution}<input type="hidden" name="institution" value="{$views->institution}">{/if}
    {if $views->collection}<input type="hidden" name="searchcollection" value="{$views->collection}">{/if}
    {if $views->collection}<input type="hidden" name="searchcollection" value="{$views->collection}">{/if}
</form>

{if $GROUP}
    <h2>{$PAGESUBHEADING}</h2>
{/if}

<div class="lead mtl">{$helptext|safe}</div>
<div id="copyview">
 <div id="templatesearch" class="searchlist mtxl">
  <div id="templatesearch_table" class="mtxl panel panel-default">
    {$views->html|safe}
  </div>
  {$views->pagination.html|safe}
 </div>

</div>
{include file="pagemodal.tpl"}
{include file="footer.tpl"}
