<div class="checkbox fullwidth">
    {$formcontrols|safe}
    <label for="{$elementname}_{$artefact->id}" title="{$artefact->title|strip_tags|str_shorten_text:60:true|safe}">{str tag=$artefact->artefacttype section=artefact.resume}</label>
    <div class="text-small with-label">{$artefact->description|str_shorten_html:100:true|strip_tags|safe}</div>
</div>