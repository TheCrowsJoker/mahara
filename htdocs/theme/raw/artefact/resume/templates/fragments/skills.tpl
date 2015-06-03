<div class="skills">
    {if !$hidetitle}
    <h3 class="resumeh3">
        {str tag='myskills' section='artefact.resume'}
        {if $controls}
        {contextualhelp plugintype='artefact' pluginname='resume' section='myskills'}
        {/if}
    </h3>{/if}
    <div id="skillslist{$suffix}" class="panel-items js-masonry" data-masonry-options='{ "itemSelector": ".panel" }'>
        {foreach from=$skills item=n}
        <div class="panel panel-default">
                <h3 class="panel-heading has-link">
                    {if $n->exists}
                    <a id="skills_edit_{$n->artefacttype}" href="{$WWWROOT}artefact/resume/editgoalsandskills.php?id={$n->id}" title="{str tag=edit$n->artefacttype section=artefact.resume}">
                    {str tag=$n->artefacttype section='artefact.resume'}
                    <span class="fa fa-pencil pull-right pls"></span>
                    <span class="sr-only">{str tag=edit}</span>
                    </a>
                    {else}
                    <a id="skills_edit_{$n->artefacttype}" href="{$WWWROOT}artefact/resume/editgoalsandskills.php?type={$n->artefacttype}" title="{str tag=edit$n->artefacttype section=artefact.resume}">
                    {str tag=$n->artefacttype section='artefact.resume'}
                    <span class="fa fa-pencil pull-right pls"></span>
                    <span class="sr-only">{str tag=edit}</span>
                    </a>
                    {/if}
                </h3>
                {if $n->exists}
                <div id="n{$n->id}_desc" class="panel-body">
                    {if $n->description != ''}
                    {$n->description|clean_html|safe}
                    {else}
                    {str tag=nodescription section=artefact.resume}
                    {/if}
                </div>
                {/if}
                {if $n->files}
                <div id="resume_{$n->id}" class="has-attachment">
                    <a class="panel-footer collapsed" aria-expanded="false" href="#attach_skill_{$n->id}" data-toggle="collapse">
                        <p class="text-left mbs">
                            <span class="fa fa-lg prm fa-paperclip"></span>
                           
                            <span class="text-small">{str tag=attachedfiles section=artefact.blog}</span>
                            <span class="metadata">({$n->count})</span>
                            <span class="fa fa-chevron-down collapse-indicator pull-right"></span>
                        </p>
                        
                    </a>
                    <div id="attach_skill_{$n->id}" class="collapse">
                        <ul class="list-unstyled list-group mbs">
                            {foreach from=$n->files item=file}
                            <li class="list-group-item-text list-group-item-link">
                                <a href="{$WWWROOT}artefact/file/download.php?file={$file->attachment}" '{if $file->description}' title="{$file->description}" data-toggle="tooltip" '{/if}'>
                                    <div class="file-icon mrs">
                                        {if $file->icon}
                                        <img src="{$file->icon}" alt="">
                                        {else}
                                        <span class="fa fa-{$file->artefacttype} fa-lg text-default"></span>
                                        {/if}
                                    </div>
                                    {$file->title|truncate:40}
                                </a>
                            </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                {/if}
            </div>
        {/foreach}
    </div>
        {if $license}
        <div class="resumelicense">
            {$license|safe}
        </div>
        {/if}
</div>
