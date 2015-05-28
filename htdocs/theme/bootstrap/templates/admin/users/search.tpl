{include file="header.tpl"}
<div class="row">
    <div class="col-md-12">
        <p class="lead">{str tag="usersearchinstructions" section="admin"}</p>
    </div>
</div>
<div class="row">
    <div class="col-md-3 prs-md">

        <div class="panel panel-default">
            <h3 class="panel-heading" tabindex="0">{str tag="filterresultsby"}</h3>
            <div class="panel-body">
                  <div id="initials" class="initials">
                    <div id="firstnamelist">
                        <p class="pseudolabel" id="firstname">{str tag="firstname"}:</p>
                        <br/>

                        <a class="label first-initial{if !$search->f} label-primary active{else} label-default{/if} all" aria-labelledby="firstname" aria-label="{str tag="firstnameall"}" href="{$WWWROOT}admin/users/search.php?query={$search->query}{if $search->l}&amp;l={$search->l}{/if}{if $search->sortby}&amp;sortby={$search->sortby}{/if}{if $search->sortdir}&amp;sortdir={$search->sortdir}{/if}{if $limit}&amp;limit={$limit}{/if}">{str tag="All"}</a>

                       {foreach from=$alphabet item=a}
                            <a class="label first-initial{if $a == $search->f} label-primary active{else} label-default{/if}" aria-labelledby="firstname" aria-label="{str tag="firstname"}" href="{$WWWROOT}admin/users/search.php?query={$search->query}&amp;f={$a}{if $search->l}&amp;l={$search->l}{/if}{if $search->sortby}&amp;sortby={$search->sortby}{/if}{if $search->sortdir}&amp;sortdir={$search->sortdir}{/if}{if $limit}&amp;limit={$limit}{/if}">{$a}</a>
                       {/foreach}
                    </div>
                    <div class="mtl" id="lastnamelist">
                      <p class="pseudolabel" id="lastname">{str tag="lastname"}:</p>
                        <br/>

                        <a class="label last-initial{if !$search->l} label-primary active{else} label-default{/if} all" aria-labelledby="lastname" aria-label="{str tag="lastnameall"}" href="{$WWWROOT}admin/users/search.php?query={$search->query}{if $search->f}&amp;f={$search->f}{/if}{if $search->sortby}&amp;sortby={$search->sortby}{/if}{if $search->sortdir}&amp;sortdir={$search->sortdir}{/if}{if $limit}&amp;limit={$limit}{/if}">{str tag="All"}</a>

                       {foreach from=$alphabet item=a}
                            <a class="label last-initial{if $a == $search->l} label-primary active{else} label-default{/if}" aria-labelledby="lastname" aria-label="{str tag="lastname"}" href="{$WWWROOT}admin/users/search.php?query={$search->query}&amp;l={$a}{if $search->f}&amp;f={$search->f}{/if}{if $search->sortby}&amp;sortby={$search->sortby}{/if}{if $search->sortdir}&amp;sortdir={$search->sortdir}{/if}{if $limit}&amp;limit={$limit}{/if}">{$a}</a>
                       {/foreach}
                    </div>
                </div>

                <form class="mtm" action="{$WWWROOT}admin/users/search.php" method="post">
                    {if $search->f}
                    <input type="hidden" name="f" id="f" value="{$search->f}">
                    {/if}
                    {if $search->l}
                    <input type="hidden" name="l" id="l" value="{$search->l}">
                    {/if}
                    {if $search->sortby}
                    <input type="hidden" name="sortby" id="sortby" value="{$search->sortby}">
                    {/if}
                    {if $search->sortdir}
                    <input type="hidden" name="sortdir" id="sortdir" value="{$search->sortdir}">
                    {/if}
                    {if $limit}
                    <input type="hidden" name="limit" id="limit" value="{$limit}">
                    {/if}
                    <hr />
                    <div class="loggedin-filter mtl">
                        <label for="loggedin">{str tag="lastlogin" section="admin"}</label>
                        <select name="loggedin" id="loggedin">
                        {foreach from=$loggedintypes item=t}
                            <option value="{$t['name']}"{if $search->loggedin === $t['name']} selected="selected"{/if}>{$t['string']}</option>
                        {/foreach}
                        </select>
                        <span id="loggedindate_container"{if !($search->loggedin == 'since' || $search->loggedin == 'notsince')} class="js-hidden"{/if}>
                            {$loggedindate|safe}
                        </span>
                    </div>
                    <div class="duplicateemail-filter mtm">
                        <label for="duplicateemail">
                            <input type="checkbox" name="duplicateemail" id="duplicateemail" value="1"{if $search->duplicateemail} checked{/if}>
                            {str tag="duplicateemailfilter" section="admin"}
                        </label>
                    </div>
                </div>
            </div>

               
        </form>
    </div>
    <div class="col-md-9 pls-md">
         <div class="panel panel-default mbm">
                <h3 class="sr-only panel-heading">{str tag='Search' section='admin'}</h3>
                <div class="panel-body">
                    <div class="usersearchform inline">
                        <label class="pull-left" for="query">{str tag='Search' section='admin'}:</label>
                        <input class="pull-left" type="text" name="query" id="query"{if $search->query} value="{$search->query}"{/if}>
                    </div>
                    {if count($institutions) > 1}
                    <div class="institutions inline">
                        <label class="pull-left mlm" for="institution">{str tag='Institution' section='admin'}:</label>
                        <select class="pull-left" name="institution" id="institution">
                            <option value="all"{if !$.request.institution} selected="selected"{/if}>{str tag=All}</option>
                            {foreach from=$institutions item=i}
                            <option value="{$i->name}"{if $i->name == $.request.institution}" selected="selected"{/if}>{$i->displayname}</option>
                            {/foreach}
                        </select>
                    </div>
                    {/if}
                    <div class="col-md-2">
                        <button id="query-button" class="btn-search btn btn-success" type="submit">{str tag="go"}</button>
                    </div>
                </div>
            </div>
        <div id="results" class="section panel panel-default">
            <h2 class="panel-heading" id="resultsheading">{str tag="Results"}</h2>
            {if $results}
                <div class="table-responsive">
                    <table id="searchresults" class="table table-striped fullwidth listing table-small">
                        <thead>
                            <tr>
                                {foreach from=$columns key=f item=c}
                                    {if !$c.mergelast}
                                    <th class="{if $c.sort}search-results-sort-column{if $f == $sortby} {$sortdir}{/if}{/if}{if $c.class} {$c.class}{/if}">
                                    {/if}
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
                                    {if !$c.mergefirst}
                                    </th>
                                    {/if}
                                {/foreach}
                            </tr>
                        </thead>
                        <tbody>
                            {$results|safe}
                        </tbody>
                    </table>
                </div>
                <div class="panel-body">
                    {$pagination|safe}
                </div>
            {else}
                <div class="panel-body">{str tag="noresultsfound"}</div>
            {/if}
            {if $USER->get('admin') || $USER->is_institutional_admin() || get_config('staffreports')}
                <div class="panel-footer withselectedusers">
                    {if $USER->get('admin') || $USER->is_institutional_admin()}
                    <form class="nojs-hidden-inline" id="bulkactions" action="{$WWWROOT}admin/users/bulk.php" method="post">
                        <button action="{$WWWROOT}admin/users/bulk.php" type="submit" class="btn btn-default disabled" name="edit" id="editbtn" value="{str tag=edit}">
                            <span class="fa fa-pencil"></span>
                            {str tag=withselectedusersedit section=admin}
                        </button>

                    </form>
                    {/if}
                    <form class="nojs-hidden-inline" action="{$WWWROOT}admin/users/report.php" id="report" method="post">
                       
                        <button action="{$WWWROOT}admin/users/report.php" type="submit" class="btn btn-info disabled" name="reports" id="reportsbtn" value="{str tag=getreports section=admin}">
                            <span class="fa fa-area-chart"></span>
                            {str tag=withselectedusersreports section=admin}
                        </button>

                    </form>
                    <div id="nousersselected" class="mtl hidden error alert alert-danger">{str tag=nousersselected section=admin}</div>
                </div>
            {/if}
        </div>
    </div>

</div>


{include file="footer.tpl"}
