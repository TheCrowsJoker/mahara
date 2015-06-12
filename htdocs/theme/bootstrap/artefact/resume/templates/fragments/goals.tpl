<div class="goals-wrapper">
    {if !$hidetitle}
    <h3 class="resumeh3">
        {str tag='mygoals' section='artefact.resume'}
        {if $controls}
        {contextualhelp plugintype='artefact' pluginname='resume' section='mygoals'}
        {/if}
    </h3>{/if}
    <div id="goalslist{$suffix}" class="panel-items js-masonry" data-masonry-options='{ "itemSelector": ".panel" }'>
        {foreach from=$goals item=n, name='default'}
        <div class="panel panel-default">
            <h4 class="panel-heading has-link">
                {if $n->exists}
                    <a id="goals_edit_{$n->artefacttype}" href="{$WWWROOT}artefact/resume/editgoalsandskills.php?id={$n->id}" title="{str tag=edit$n->artefacttype section=artefact.resume}">
                    {str tag=$n->artefacttype section='artefact.resume'}
                    <span class="fa fa-pencil pull-right pls"></span>
                    <span class="sr-only">{str tag=edit}</span>
                    </a>
                {else}
                    <a id="goals_edit_{$n->artefacttype}" href="{$WWWROOT}artefact/resume/editgoalsandskills.php?type={$n->artefacttype}" title="{str tag=edit$n->artefacttype section=artefact.resume}">
                          {str tag=$n->artefacttype section='artefact.resume'}
                    <span class="fa fa-pencil pull-right pls"></span>
                    <span class="sr-only">{str tag=edit}</span>
                    </a>
                {/if}
            </h4>
            <div class="panel-body">
                {if $n->description != ''}
                {$n->description|clean_html|safe}
                {else}
                {str tag=nodescription section=artefact.resume}
                {/if}
            </div>
            {if $n->files}
            <div id="resume_{$n->id}" class="has-attachment">
                <a class="collapsible collapsed in-panel panel-footer" aria-expanded="false" href="#attach_goal_{$.foreach.default.index}" data-toggle="collapse">
                    <p class="text-left mbs">
                        <span class="fa fa-lg prm fa-paperclip"></span>

                        <span class="text-small">{str tag=attachedfiles section=artefact.blog}</span>
                         <span class="metadata">({$n->count})</span>
                        <span class="fa fa-chevron-down pull-right collapse-indicator"></span>
                    </p>
                </a>


                <div id="attach_goal_{$.foreach.default.index}" class="collapse">
                    <ul class="list-unstyled list-group mbs">
                    {foreach from=$n->files item=file}
                        <li class="list-group-item-text list-group-item-link">
                            <a href="{$WWWROOT}artefact/file/download.php?file={$file->attachment}" '{if $file->description}' title="{$file->description}" data-toggle="tooltip" '{/if}' >
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
