{foreach from=$categories key=name item=category name=default}
    <div id="block-category-{$category.name}" class="block-category-title hide-title-collapsed btn btn-success text-left" title="{$category.description}">
        <span class="icon icon-sm icon-chevron-down indicator prs ptm"></span>
        <span class="icon icon-{$category.name} icon"></span>
        
        <span class="title pls">{$category.title}</span>
    </div>
    {if $selectedcategory == $category.name}
        <div id="{$category.name}">
            {$blocktypelist|safe}
        </div>
    {else}
        <div id="{$category.name}">
            <div class="ptm pbm plm metadata hide-title-collapsed">
                <span class="icon icon-spin icon-spinner icon prs"></span>
                <span class="title">{str tag=loading section=mahara}</span>
            </div>
        </div>
    {/if}
{/foreach}

<div class="btn btn-success text-right last collapse-expand" title="{$category.description}" data-trigger="col-collapse">
    <span class="icon icon-angle-double-left"></span>
    <span class="icon icon-angle-double-right"></span>
</div>
