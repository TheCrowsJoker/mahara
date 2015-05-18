<div id="thumbnails{$instanceid}" class="thumbnails ptl js-masonry" data-masonry='{ "itemSelector": ".thumb" }'>
    {foreach from=$images item=image}
        <div style="width: {$width * 2}px;" class="thumb">
        <a rel="{$image.slimbox2}" href="{$image.link}" title="{$image.title}" target="_blank">
            <img src="{$image.source}" {if $image.height}height="{$image.height}"{/if} alt="{$image.title}" title="{$image.title}" {if $frame}class="frame"{/if} />
        </a>
        {if $showdescription && $image.title}
            <div class="small-text">
                {$image.title|truncate:60|safe}
            </div>
        {/if}
        </div>
    {/foreach}
</div>

{if isset($copyright)}
<div id="lbBottom">
    {$copyright|safe}
</div>
{/if}

{if $commentcount || $commentcount === 0}
{$comments|safe}
{/if}
