{include file="header.tpl"}
<form class="form-inline pieform form with-heading" action="{$WWWROOT}admin/groups/archive.php" method="post">
    {if $search->sortby}
    <input type="hidden" name="sortby" id="sortby" value="{$search->sortby}">
    {/if}
    {if $search->sortdir}
    <input type="hidden" name="sortdir" id="sortdir" value="{$search->sortdir}">
    {/if}
    {if $limit}
    <input type="hidden" name="limit" id="limit" value="{$limit}">
    {/if}

    <div class="dropdown-group js-dropdown-group form-group">
        <fieldset class="pieform-fieldset dropdown-group js-dropdown-group">
            <div class="usersearchform with-dropdown js-with-dropdown text form-group">
                <label for="query">{str tag='usersearch' section='admin'}: </label>
                <input  class="form-control with-dropdown js-with-dropdown text" type="text" name="query" id="query"{if $search->query} value="{$search->query}"{/if}>
            </div>
            {if count($institutions) > 1}
            <div class="dropdown-connect js-dropdown-connect select form-group">
                    <label for="institution">{str tag='Institution' section='admin'}:</label>
                    <span class="picker">
                        <select class="form-control dropdown-connect js-dropdown-connect select" name="institution" id="institution">
                            <option value="all"{if !$.request.institution} selected="selected"{/if}>{str tag=Allinstitutions}</option>
                            {foreach from=$institutions item=i}
                            <option value="{$i->name}"{if $i->name == $.request.institution}" selected="selected"{/if}>{$i->displayname}</option>
                            {/foreach}
                        </select>
                    </span>
            </div>
            {/if}
        </fieldset>
    </div>
    <div class="no-label text-inline form-group">
        <button id="query-button" class="btn-search btn btn-primary" type="submit">{str tag="search"}</button>
    </div>

    <script type="application/javascript">
    jQuery(function($) {
        var csvlink = '{$WWWROOT}admin/groups/archivescsvdownload.php';
        $('#institution').on('change', function() {
            if ($(this).val() != 'all') {
                $('#csvlink').attr('href', csvlink + '?institution=' + $j(this).val());
            }
            else {
                $('#csvlink').attr('href', csvlink);
            }
        });
    });
    </script>
</form>


<div class="panel panel-default mtxl" id="results" >
    <h2 class="panel-heading" id="resultsheading">{str tag="Results"}</h2>
        {if $results}
        <table id="searchresults" class="tablerenderer fullwidth table">
            <thead>
                <tr>
                    {foreach from=$columns key=f item=c}
                    <th class="{if $c.sort}search-results-sort-column{if $f == $sortby} {$sortdir}{/if}{/if}{if $c.class} {$c.class}{/if}">
                        {if $c.sort}
                            <a href="{$searchurl}&sortby={$f}&sortdir={if $f == $sortby && $sortdir == 'asc'}desc{else}asc{/if}">
                                {$c.name}
                                <span class="accessible-hidden sr-only">({str tag=sortby} {if $f == $sortby && $sortdir == 'asc'}{str tag=descending}{else}{str tag=ascending}{/if})</span>
                            </a>
                        {else}
                            {$c.name}
                            {if $c.accessible}
                                <span class="accessible-hidden sr-only">{$c.accessible}</span>
                            {/if}
                        {/if}
                        {if $c.help}
                            {$c.helplink|safe}
                        {/if}
                        {if $c.headhtml}<div class="headhtml">{$c.headhtml|safe}</div>{/if}
                    </th>
                    {/foreach}
                </tr>
            </thead>
            <tbody>
                {$results|safe}
            </tbody>
        </table>
        <div class="panel-body">
            {$pagination|safe}
        </div>

        <a class="panel-footer text-small" id="csvlink" href="{$WWWROOT}admin/groups/archivescsvdownload.php{if $.request.institution}?institution={$.request.institution}{/if}" target="_blank">
        <span class="icon icon-table prs"></span>
        {str tag=exportdataascsv section=admin}
        </a>

        {else}
            <div class="panel-body">
                <p class="no-results"> {str tag="noresultsfound"}</p>
            </div>
        {/if}

    </div>
</div>
{include file="footer.tpl"}
