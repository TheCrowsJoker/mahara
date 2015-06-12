<div class="checkbox">
    {$formcontrols|safe}
    <label class="pll" for="{$elementname}_{$artefact->id}" title="{$artefact->title|strip_tags|str_shorten_text:60:true|safe}">
        {if $artefact->description}
        {$artefact->description} 
        <span class="metadata">({str tag=$artefact->artefacttype section=artefact.internal})</span>
        {else}
        {str tag=$artefact->artefacttype section=artefact.internal}
        {/if}
    </label>
</div>