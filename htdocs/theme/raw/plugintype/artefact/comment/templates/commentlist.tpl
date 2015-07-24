<div class="list-group list-group-lite">
{foreach from=$data item=item}
    <div class="comment-item list-group-item {if $item->pubmessage}list-group-item-warning{elseif $item->deletedmessage}deleted {/if} {cycle name=rows values='r0,r1'} {if !$item->deletedmessage && $item->attachments}has-attachment{/if}">
        <div class="comment-heading clearfix">
            <span class="user-icon small-icon pull-left mls mts mrm">
                {if $item->author}
                    <img src="{profile_icon_url user=$item->author maxheight=40 maxwidth=40}" valign="middle" alt="{str tag=profileimagetext arg1=$item->author|display_default_name}"/>
                {else}
                    <img src="{profile_icon_url user=null maxheight=40 maxwidth=40}" valign="middle" alt="{str tag=profileimagetextanonymous}"/>
                {/if}
            </span>
            <h5 class="pull-left">
                {if $item->author}
                <a href="{$item->author->profileurl}">
                {/if}
                    {if $item->author}
                    <span>{$item->author|display_name}</span>
                    {/if}
                {if $item->author}
                </a>
                {/if}
                <br />

                <span class="postedon text-small">
                {$item->date}
                {if $item->updated}
                    [{str tag=Updated}: {$item->updated}]
                {/if}
                </span>
                {if $item->ratingdata}

                <span class="star-comment-rating ptm plm">
                    {for i $item->ratingdata->min_rating $item->ratingdata->max_rating}
                        {if !$item->ratingdata->export}
                            <input name="star{$item->id}" type="radio" class="star" {if $i === $item->ratingdata->value} checked="checked" {/if} disabled="disabled" />
                        {else}
                            <div class="star-rating star star-rating-applied star-rating-readonly{if $i <= $item->ratingdata->value} star-rating-on{/if}"><a>&nbsp;</a></div>
                        {/if}
                    {/for}
                </span>
                {/if}
            </h5>
            <div class="btn-group btn-group-top">
                {if $item->deleteform}
                    {$item->deleteform|safe}
                {/if}
                {if !$onview}
                    {if $item->canedit}
                    <a href="{$WWWROOT}artefact/comment/edit.php?id={$item->id}&amp;view={$viewid}" class="btn btn-default pull-left">
                        <span class="icon icon-pencil icon-lg"></span>
                        <span class="sr-only">{str tag=edit}</span>
                    </a>
                    {/if}
                {/if}
            </div>
        </div>
        <div class="comment-text">
            <div class="comment-content">
                {if $item->deletedmessage}
                    <span class="metadata">
                        {$item->deletedmessage}
                    </span>
                {else}
                    {$item->description|safe|clean_html}
                {/if}
            </div>

            {if $item->makepublicform || ($item->makepublicrequested && !$item->deletedmessage)}
            <div class="metadata">
                {if $item->pubmessage}
                <em class="privatemessage"> {$item->pubmessage}
                </em> -
                {/if}

                {if $item->makepublicform}
                    {$item->makepublicform|safe}
                {/if}

                {if $item->makepublicrequested && !$item->deletedmessage}
                    <span class="icon icon-lock text-default prs"></span>
                    <span>{str tag=youhaverequestedpublic section=artefact.comment}</span>
                {/if}
            </div>
            {/if}
        </div>

        {if !$item->deletedmessage && $item->attachments}
        <div class="comment-attachment">
            <div class="panel panel-default has-attachment collapsible">
                <h4 class="panel-heading">
                    <a class="collapsible collapsed" aria-expanded="false" href="#attachments_{$item->id}" data-toggle="collapse">
                        <span class="icon prm icon-paperclip"></span>
                        <span class="text-small">{str tag=Attachments section=artefact.comment} ({$item->filescount})</span>
                        <span class="icon icon-chevron-down pull-right collapse-indicator"></span>
                    </a>
                </h4>
                <div id="attachments_{$item->id}" class="collapse" aria-expanded="false">
                    <ul class=" list-group list-group-unbordered mb0">
                    {strip}
                        {foreach $item->attachments item=a name=attachments}
                        <li class="list-group-item">
                            <a href="{$WWWROOT}artefact/file/download.php?file={$a->attachid}&comment={$item->id}&view={$viewid}" class="outer-link icon-on-hover">
                                <span class="sr-only">{$a->attachtitle}</span>
                            </a>
                            <span class="title">
                                {$a->attachtitle}
                                <span class="attachsize metadata pls">
                                    - [{$a->attachsize}]
                                </span>
                            </span>
                            <span class="icon icon-download icon-lg pull-right pts text-watermark icon-action"></span>
                        </li>
                        {/foreach}
                    {/strip}
                    </ul>
                </div>
            </div>
            {if $item->attachmessage}
                <em class="attachmessage metadata">{$item->attachmessage}</em>
            {/if}
        </div>
        {/if}
    </div>
{/foreach}
</div>
