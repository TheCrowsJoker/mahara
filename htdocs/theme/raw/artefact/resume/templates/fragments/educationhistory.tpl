{if $controls}
<div class="panel panel-default">
    {if !$hidetitle}
    <h3 class="resumeh3 panel-heading">
        {str tag='educationhistory' section='artefact.resume'}
        {contextualhelp plugintype='artefact' pluginname='resume' section='addeducationhistory'}
    </h3>
    {/if}

    <table id="educationhistorylist{$suffix}" class="resumefive resumecomposite fullwidth table">
        <thead>
            <tr>
                <th class="resumecontrols">
                    <span class="accessible-hidden sr-only">{str tag=move}</span>
                </th>
                <th>{str tag='qualification' section='artefact.resume'}</th>
                <th class="resumeattachments text-center">
                    <span class="">{str tag=Attachments section=artefact.resume}</span>
                </th>
                <th class="resumecontrols">
                    <span class="accessible-hidden sr-only">{str tag=edit}</span>
                </th>
            </tr>
        </thead>
    <!-- Table body is rendered by javascript on content-> resume -->
    </table>

    <div class="panel-footer has-form">
        <div id="educationhistoryform" class="collapse mtl mlm" data-action='reset-on-collapse'>
            {$compositeforms.educationhistory|safe}
        </div>

        <button id="addeducationhistorybutton" data-toggle="collapse" data-target="#educationhistoryform" aria-expanded="false" aria-controls="educationhistoryform" class="pull-right btn btn-default btn-sm collapsed expand-add-button">
            <span class="show-form">
                {str tag='add'}
                <span class="icon icon-chevron-down pls"></span>
            </span>
            <span class="hide-form">
                {str tag='cancel'}
                <span class="icon icon-chevron-up pls"></span>
            </span>
        </button>
        {if $license}
        <div class="resumelicense">
        {$license|safe}
        </div>
        {/if}
    </div>
</div>
{/if}

<!-- Render education blockinstance on page view -->
<div id="educationhistorylist{$suffix}" class="list-group list-group-lite">
    {foreach from=$rows item=row}
    <div class="list-group-item">
        <h5 class="mt0 list-group-item-heading">
            {if $row->qualdescription || $row->attachments}
            <a href="#education-content-{$row->id}{if $artefactid}-{$artefactid}{/if}" class="text-left collapsed collapsible" aria-expanded="false" data-toggle="collapse">
                {$row->qualification}
                <span class="icon pts icon-chevron-down pull-right collapse-indicator"></span>
                <br />
                <span class="text-small text-muted">
                    {$row->startdate}
                    {if $row->enddate} - {$row->enddate}{/if}
                </span>
            </a>
            {else}
            <span class="list-group-item-heading">
                {$row->qualification}
                <br />
                <span class="text-small text-muted">
                    {$row->startdate}
                    {if $row->enddate} - {$row->enddate}{/if}
                </span>
            </span>
            {/if}
        </h5>

        <div id="education-content-{$row->id}{if $artefactid}-{$artefactid}{/if}" class="collapse resume-content mtm">
            {if $row->qualdescription}
            <p class="compositedesc">
                {$row->qualdescription}
            </p>
            {/if}
            
            {if $row->attachments}
            <div class="list-group-item-heading plm ptm">
                <span class="icon icon-paperclip prs"></span>
                <span>{str tag='attachedfiles' section='artefact.blog'}</span>
                ({$row->clipcount})
            </div>
            <ul class="list-group list-group-unbordered mb0">
                {foreach from=$row->attachments item=item}
                <li class="list-group-item">
                    <a href="{$item->downloadpath}" class="outer-link icon-on-hover">
                        <span class="sr-only">{str tag=Download section=artefact.file} {$item->title}</span>
                    </a> 
                    
                    {if $item->iconpath}
                    <img src="{$item->iconpath}" alt="">
                    {else}
                    <span class="icon icon-{$item->artefacttype} icon-lg text-default"></span>
                    {/if}

                    <span class="title plm text-inline">
                        <a href="{$item->viewpath}" class="inner-link">
                            {$item->title}
                        </a>
                        <span class="metadata"> -
                            [{$item->size}]
                        </span>
                    </span>

                    <span class="icon icon-download icon-lg pull-right pts text-watermark icon-action inner-link"></span>
                </li>
                {/foreach}
            </ul>
            {/if}
        </div>
    </div>
    {/foreach}
</div>
