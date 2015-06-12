{include file="header.tpl"}

{if $GROUP}
    <h2>{$PAGESUBHEADING}</h2>
{/if}
{if $institution}{$institutionselector|safe}{/if}
<p class="lead ptxl mtxl">{str tag=collectiondescription section=collection}</p>
{if !$canedit}<p>{str tag=canteditgroupcollections section=collection}</p>{/if}
{if $collections}
<div class="panel panel-default">
    <div id="mycollections" class="list-group">
        {foreach from=$collections item=collection}
            <div class="list-group-item {cycle values='r0,r1'}">
                {if $collection->views[0]->view}
                   <a href="{$collection->views[0]->fullurl}" class="outer-link"><span class="sr-only">{$collection->name}</span></a>
                {/if}
                 <div class="row">
                    <div class="col-md-9">

                        <h3 class="title list-group-item-heading" title="{str tag=emptycollection section=collection}">
                            {$collection->name}
                        </h3>
                        <div class="detail">{$collection->description}</div>

                        <div class="detail">
                            <span class="lead text-small">{str tag=Views section=view}:</span>
                            {if $collection->views}
                                {foreach from=$collection->views item=view name=cviews}
                                    <a href="{$view->fullurl}" class="inner-link">{$view->title}</a>{if !$.foreach.cviews.last}, {/if}
                                {/foreach}
                            {else}
                                {str tag=none}
                            {/if}
                        </div>

                        {if $collection->submitinfo}
                            <div class="detail submitted-viewitem">{str tag=collectionsubmittedtogroupon section=view arg1=$collection->submitinfo->url arg2=$collection->submitinfo->name arg3=$collection->submitinfo->time|format_date}</div>
                        {/if}
                    </div>
                     <div class="col-md-3">
                        <div class="inner-link btn-action-list">
                            {if !$collection->submitinfo && $canedit}
                                <div class="text-right btn-top-right btn-group btn-group-top">
                                    <a href="{$WWWROOT}collection/views.php?id={$collection->id}" title="{str tag=manageviews section=collection}" class="btn btn-default btn-xs">
                                        <span class="fa fa-cog fa-lg text-default"></span>
                                        <span class="sr-only">{str(tag=manageviewsspecific section=collection arg1=$collection->name)|escape:html|safe}</span>
                                    </a>
                                    <a href="{$WWWROOT}collection/edit.php?id={$collection->id}" title="{str tag=edittitleanddescription section=view}" class="btn btn-default btn-xs">
                                        <span class="fa fa-pencil fa-lg text-default"></span>
                                        <span class="sr-only">{str(tag=editspecific arg1=$collection->name)|escape:html|safe}</span>
                                    </a>
                                    <a href="{$WWWROOT}collection/delete.php?id={$collection->id}" title="{str tag=deletecollection section=collection}" class="btn btn-default btn-xs">
                                        <span class="fa fa-trash fa-lg text-danger"></span>
                                        <span class="sr-only">{str(tag=deletespecific arg1=$collection->name)|escape:html|safe}</span>
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
</div>
       {$pagination|safe}
{else}
    <div class="mtxl ptxl">
        <p class="lead mtxl ptxl text-center ">
            {str tag=nocollections section=collection}{if $addonelink} <a href={$addonelink}>{str tag=addone}</a>{/if}
        </p>
    </div>
{/if}
{include file="footer.tpl"}
