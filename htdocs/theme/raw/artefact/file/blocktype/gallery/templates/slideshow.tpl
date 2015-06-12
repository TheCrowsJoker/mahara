<div class="panel-body">
    {if $images}
    <div id="slideshow{$instanceid}" class="carousel slide" data-ride="carousel" data-interval="false">
        <div class="carousel-inner" role="listbox">
            {foreach from=$images item=image key=k name=images}
            
            <div class="{if $dwoo.foreach.images.first}item active{else}item{/if}">
                <img src="{$image.source}" alt="{$image.title}" title="{$image.title}" class="center-block">
                
                {if $showdescription && $image.title}
                <div class="carousel-caption prm plm pbm ptm" id="description_{$instanceid}_{$k}">
                    {$image.title}
                </div>
                {/if}
            </div>
            {/foreach}
        </div>

        <a class="left carousel-control" href="#slideshow{$instanceid}" role="button" data-slide="prev">
            <span class="fa fa-chevron-left fa-lg" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#slideshow{$instanceid}" role="button" data-slide="next">
            <span class="fa fa-chevron-right fa-lg" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    {else}
      {str tag=noimagesfound section=artefact.file}
    {/if}
</div>

{$comments|safe}
