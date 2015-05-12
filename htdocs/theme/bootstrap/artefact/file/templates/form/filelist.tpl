{if $filelist}
<div class="{if !$selectable || !$config.selectone}panel-body{/if}">
    <div class="table-responsive">
        <table id="{$prefix}_filelist" class="tablerenderer filelist table">
            <thead>
                <tr>
                    <th></th>
                    <th>{str tag=Name section=artefact.file}</th>
                    <th>{str tag=Description section=artefact.file}</th>
                    
                    <!-- {if !$showtags && !$editmeta}{/if} -->
                    {if !selectable}
                    <th class="filesize">
                        {str tag=Size section=artefact.file}
                    </th>
                    
                    <th class="filedate">
                        {str tag=Date section=artefact.file}
                    </th>
                    {/if}
                    
<!--                     {if $showtags}
                    <th class="filetags">{str tag=tags}</th>
                    {/if} -->
                
                    {if $editmeta}
                    <th class="right"></th>
                    {/if}
                    
                    <th class="right nowrap">
                        <!-- <span class="">{str tag=edit}</span> -->
                    </th>
                </tr>
            </thead>
            
            <tbody>
            {foreach from=$filelist item=file}
                {if !$publishing || !$file->permissions || $file->can_republish}
                    {assign var=publishable value=1}
                {else}
                    {assign var=publishable value=0}
                {/if}
                
                <tr id="file:{$file->id}" class="file-item {if $file->isparent} parentfolder{/if}{if $highlight && $highlight == $file->id} warning{/if}{if $file->artefacttype == 'folder'} folder{else}{if !$publishable } disabled{/if}{if $file->artefacttype == 'profileicon'} profileicon{/if}{/if}{if $edit == $file->id} hidden{/if}{if $selectable && ($file->artefacttype != 'folder' || $selectfolders) && $publishable && !$file->isparent} js-file-select{/if}" {if $selectable && ($file->artefacttype != 'folder' || $selectfolders) && $publishable && !$file->isparent} data-id="{$file->id}" data-select="select-file" {/if} {if !$publishable && $file->artefacttype != 'folder'} title="{str tag=notpublishable section=artefact.file}"{/if}>
                    <td class="icon-container">
                      
                        {if $file->isparent}
                            <span class="pls fa-level-up fa fa-lg "></span>
                        {else}
                            
                            {if $editable}
                            <div class="icon-drag" id="drag:{$file->id}" tabindex="0">
                            {else}
                            <div class="icon-expand-folder">
                            {/if}
                                {if $file->artefacttype == 'folder'}
                                    {if $selectable}
                                    <a href="{$querybase|safe}folder={$file->id}{if $owner}&owner={$owner}{if $ownerid}&ownerid={$ownerid}{/if}{/if}" id="changefolder:{$file->id}" class="changefolder link-unstyled" title="{str tag=folder section=artefact.file} {$displaytitle}">
                                        <span class="fa fa-plus prs"></span>
                                        <span class="pls fa-folder-open fa fa-lg"></span>
                                    </a>
                                    {else}
                                        <span class="pls fa-folder-open fa fa-lg "></span>
                                    {/if} 
                                {else} 
                                    <img src="{$file->icon}" title="{str tag=clickanddragtomovefile section=artefact.file arg1=$file->title}" alt="{$file->title}">
                                {/if}
                            
                            </div>
                        
                        {/if}
                    </td>
                    
                    <td class="filename">
                        {assign var=displaytitle value=$file->title|safe}
                        
                        {if $file->artefacttype == 'folder'}
                            <a href="{$querybase|safe}folder={$file->id}{if $owner}&owner={$owner}{if $ownerid}&ownerid={$ownerid}{/if}{/if}" id="changefolder:{$file->id}" class="inner-link changefolder">
                                <span class="sr-only">{str tag=folder section=artefact.file}:</span>
                                <span class="display-title {if $file->isparent}accessible-hidden{/if}">{$displaytitle}</span>
                            </a>
                        {elseif !$publishable}
                            {$displaytitle}
                        {else}
                            <span class="inner-link">
                                {$displaytitle}
                            </span>
                        {/if}
                    </td>
                <td class="filedescription">
                    {$file->description}
                    {if $showtags}
                        {if $file->tags}
                        <p class="filetags small-text">
                            <strong>{str tag=tags}:</strong>
                            <span>
                                {list_tags tags=$file->tags owner=$showtags}
                            </span>
                        </p>
                        {/if}
                    {/if}
                </td>
                
                {if !$showtags && !$editmeta}
                <td class="filesize">{tif $file->size ?: ''}</td>
                <td class="filedate">{tif $file->mtime ?: ''}</td>
                {/if}
                
                {if $editmeta}
                <td class="right s nowrap">
                    {if $file->locked}
                        <span class="dull text-muted">{str tag=Submitted section=view}</span>
                    {elseif !$file->isparent}
                        {if !isset($file->can_edit) || $file->can_edit !== 0}
                        <button name="{$prefix}_edit[{$file->id}]" class="btn btn-default btn-xs">
                            <span class="fa fa-pencil"></span>
                            <span class="sr-only">{$edittext|escape:html|safe}</span>
                        </button>
                        {/if}
                    {/if}
                    {if $selectable && ($file->artefacttype != 'folder' || $selectfolders) && $publishable && !$file->isparent}
                        <input type="submit" class="sr-only"" name="{$prefix}_select[{$file->id}]" id="{$prefix}_select_{$file->id}" value="{str tag=select}" title="{str tag=select}" />
                    {/if}
                </td>
                {/if}
                <!-- Ensure space for 3 buttons (in the case of a really long single line string in a user input field -->
                {if $editable && !$file->isparent}
                <td class="text-right control-buttons">
                    {if $file->locked}
                        <span class="dull text-muted">
                            {str tag=Submitted section=view}
                        </span>
                    {elseif !isset($file->can_edit) || $file->can_edit != 0}
                        <div class="btn-group">
                            {if $file->artefacttype == 'archive'}
                            <a href="{$WWWROOT}artefact/file/extract.php?file={$file->id}" title="{str tag=Decompress section=artefact.file}" class="btn btn-default btn-xs">
                                <span class="fa fa-file-archive-o "></span>
                                <span class="sr-only">
                                    {str(tag=decompressspecific section=artefact.file arg1=$displaytitle)|escape:html|safe}
                                </span>
                            </a>
                            {/if}
                            
                            {if $file->artefacttype == 'folder'}
                                {assign var=edittext value=str(tag=editfolderspecific section=artefact.file arg1=$displaytitle)}
                                {assign var=deletetext value=str(tag=deletefolderspecific section=artefact.file arg1=$displaytitle)}
                            {else}
                                {assign var=edittext value=str(tag=editspecific arg1=$displaytitle)}
                                {assign var=deletetext value=str(tag=deletespecific arg1=$displaytitle)}
                            {/if}
                            
                            <button name="{$prefix}_edit[{$file->id}]" class="btn btn-default btn-xs">
                                <span class="fa fa-pencil"></span>
                                <span class="sr-only">{$edittext|escape:html|safe}</span>
                            </button>
                            
                            <button name="{$prefix}_delete[{$file->id}]" class="btn btn-default btn-xs">
                                <span class="fa fa-trash text-danger"></span>
                                <span class="sr-only">{$deletetext|escape:html|safe}</span>
                            </button>
                        </div>
                    {/if}
                </td>
                {/if}
            </tr> 
            {if $edit == $file->id}
                {include file="artefact:file:form/editfile.tpl" prefix=$prefix fileinfo=$file groupinfo=$groupinfo}
            {/if}
            
            {/foreach}
            </tbody>
        </table>
    </div>
</div>
{if !$selectable}
    <a id="downloadfolder" class="panel-footer" href="{$WWWROOT}artefact/file/downloadfolder.php?{$folderparams|safe}">
        <span class="fa fa-download"></span>
        <span>{str tag=downloadfolderziplink section=artefact.file}</span>
    </a>
{/if}

{else}
<div class="panel-body">
    <p class="lead ptm pbm text-center">
        {str tag=nofilesfound section=artefact.file}
    </p>
</div>
{/if}



