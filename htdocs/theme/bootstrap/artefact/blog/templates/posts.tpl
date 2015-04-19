{foreach from=$posts item=post}
    <div id="posttitle_{$post->id}" class="{if $post->published}published{else}draft{/if} post">
        <div class="post-heading">
            <h2>{$post->title}</h2>
            <div class="post-menu">
                <span id="poststatus{$post->id}" class="poststatus">
                    {if $post->published}
                        {str tag=published section=artefact.blog}
                    {else}
                        {str tag=draft section=artefact.blog}
                    {/if}
                </span>
                <span id="changepoststatus{$post->id}" class="changepoststatus">
                    {if !$post->locked}
                        {$post->changepoststatus|safe}
                    {/if}
                </span>
                <span class="controls btn-group btn-toolbar">
                    {if $post->locked}
                        {str tag=submittedforassessment section=view}
                    {else}
                        <form name="edit_{$post->id}" action="{$WWWROOT}artefact/blog/post.php">
                            <input type="hidden" name="id" value="{$post->id}">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="fa fa-pencil"></span>
                                {str(tag=edit)|escape:html|safe}
                            </button>
                        </form>
                        {$post->delete|safe}
                    {/if}
                </span>
            </div>
            <div id="postdetails_{$post->id}" class="postdetails">
                <span class="postdate">
                    <span class="fa fa-calendar mrs"></span>
                    <strong>{str tag=postedon section=artefact.blog}: </strong> {$post->ctime}
                </span>
                {if $post->tags}
                <span id="posttags_{$post->id}" class="tags mrs">
                    <span class="fa fa-tags"></span>
                    <strong>{str tag=tags}:</strong> 
                    {list_tags owner=$post->author tags=$post->tags}
                </span>
                {/if}
            </div>
        </div>
        
        <div id="postdescription_{$post->id}" class="postdescription mtl ptl pbl">
            {$post->description|clean_html|safe}
        </div>
        {if $post->files}

            <div class="panel panel-default" id="postfiles_{$post->id}">
                <a class="panel-heading collapsible collapsed" data-toggle="collapse" href="#attach_{$post->id}" aria-expanded="false">
                    <span class="fa fa-lg prm fa-paperclip"></span>
                    <span class="label label-info mrs">
                        {$post->files|count}
                    </span>
                    <span class="small-text"> {str tag=attachedfiles section=artefact.blog}</span>
                    <span class="fa fa-chevron-down collapse-indicator pull-right"></span>
                </a>
                <div class="collapse" id="attach_{$post->id}">
                    <ul class="list-group list-unstyled mbs">
                    {foreach from=$post->files item=file}
                        <li class="list-group-item-text list-group-item-link">
                            <a href="{$WWWROOT}artefact/file/download.php?file={$file->attachment}" {if $file->description} title="{$file->description}" data-toggle="tooltip"{/if}>
                                <div class="file-icon mrs">
                                    <img src="{$file->icon}" alt="">
                                </div>
                                <span class="file-title">{$file->title|truncate:40}</span>
                                <span class="file-size pls">
                                ({$file->size|display_size})
                                </span>
                            </a>
                        </li>
                    {/foreach}
                    </ul>
                </div>
            </div>

        {/if}
    </div>
{/foreach}
