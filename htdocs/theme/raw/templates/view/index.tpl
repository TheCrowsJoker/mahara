{include file="header.tpl"}

    <div class="text-right btn-top-right btn-group btn-group-top {if $GROUP} pagetabs{/if}">
        {$createviewform|safe}
        <form method="post" class="form-as-button pull-left" action="{$WWWROOT}view/choosetemplate.php">
            <button class="submit btn btn-default">
                <span class="fa fa-lg text-success prs fa-files-o"></span>
                {str tag="copyaview" section="view"}
            </button>
            {if $GROUP}
                <input type="hidden" name="group" value="{$GROUP->id}" />
            {elseif $institution}
                <input type="hidden" name="institution" value="{$institution}">
            {/if}
        </form>
    </div>
    {$searchform|safe}
    {if $institution}
    <div class="ptxl">
        <div class="mtxl">
            {$institutionselector|safe}
        </div>
    </div>
    {/if}
    <div class="grouppageswrap mtxl">
        <div class="panel panel-default">
            <h2 id="searchresultsheading" class="panel-heading">{str tag=Results}</h2>
            {if $views}
                <div id="myviews" class="list-group">
                {foreach from=$views item=view}
                    <div class="list-group-item {cycle values='r0,r1'} {if $view.submittedto} list-group-item-warning {/if}">
                        {if $view.issitetemplate}
                            {$view.displaytitle}
                        {else}
                            <a href="{$view.fullurl}" class="outer-link"><span class="sr-only">{$view.displaytitle}</span></a>
                        {/if}
                        <div class="row">
                            <div class="col-md-9">
                                <h3 class="title list-group-item-heading">
                                    {$view.displaytitle}
                                </h3>

                                {if $view.submittedto}
                                    <div class="detail submitted-viewitem">{$view.submittedto|clean_html|safe}</div>
                                {elseif $view.type == 'profile'}
                                    <div class="detail">{str tag=profiledescription}</div>
                                {elseif $view.type == 'dashboard'}
                                    <div class="detail">{str tag=dashboarddescription}</div>
                                {elseif $view.type == 'grouphomepage'}
                                    <div class="detail">{str tag=grouphomepagedescription section=view}</div>
                                {elseif $view.description}
                                    <div class="detail">{$view.description|str_shorten_html:110:true|strip_tags|safe}</div>
                                {/if}
                            </div>
                            <div class="col-md-3">
                                <div class="inner-link btn-action-list">
                                    <div class="text-right btn-top-right btn-group btn-group-top">
                                        {if !$view.submittedto && (!$view.locked || $editlocked)}
                                            <a href="{$WWWROOT}view/blocks.php?id={$view.id}&{$querystring}" title="{str tag ="editcontentandlayout" section="view"}" class="btn btn-default btn-xs">
                                                <span class="fa fa-pencil"></span>
                                                <span class="sr-only">{str(tag=editspecific arg1=$view.displaytitle)|escape:html|safe}</span>
                                            </a>
                                        {/if}
                                        {if !$view.submittedto && $view.removable && (!$view.locked || $editlocked)}
                                            <a href="{$WWWROOT}view/delete.php?id={$view.id}&{$querystring}" title="{str tag=deletethisview section=view}" class="btn btn-default btn-xs">
                                                <span class="fa fa-lg fa-trash text-danger"></span>
                                                <span class="sr-only">{str(tag=deletespecific arg1=$view.displaytitle)|escape:html|safe}</span>
                                            </a>
                                        {/if}
                                    </div>
                                </div>{* rbuttons *}
                            </div>
                        </div>
                    </div>
                {/foreach}
                </div>
            {else}
                <div class="lead text-center ptxl pbxl">
                    {if $GROUP}
                        {str tag="noviewstosee" section="group"}
                    {elseif $institution}{str tag="noviews" section="view"}
                    {else}{str tag="youhavenoviews" section="view"}{/if}
                </div>
            {/if}
        </div>
    </div>
    <div>
        {$pagination|safe}
    </div>
{include file="footer.tpl"}
