{include file="header.tpl"}

<a class="btn btn-lg btn-default btn-with-heading" href="{$WWWROOT}skin/index.php">
    <span class="fa fa-magic fa-flip-horizontal fa-lg pls"></span>
    {str tag=manageskins section=skin}
</a>

{include file="view/editviewtabs.tpl" selected='skin' new=$new issiteview=$issiteview}

<div class="subpage">
    {if !$saved}
    <div class="alert alert-warning">
        <span class="fa fa-lg fa-exclamation-triangle prs"></span>
        {str tag=notsavedyet section=skin}
    </div>
    {/if}

    {if $incompatible}
    <div class="alert alert-danger pbm">
        <span class="fa fa-ban"></span>
        {$incompatible}
    </div>
    {/if}


    <div class="row ptm">
        <div class="col-md-3">
            <div class="panel panel-default">
                <h2 class="mt0 panel-heading">
                    {str tag=currentskin section=skin}
                </h2>

                <div class="panel-body">
                    <img class="thumbnail mb0" src="{$WWWROOT}skin/thumb.php?id={$currentskin}" alt="{$currenttitle}">
                    <ul class="metadata unstyled">
                        <li class="title">
                            <h3 class="h4 text-light mbs">{$currenttitle|safe}</h3>
                        </li>
                        {if $currentmetadata}
                            <li class="metadisplayname">
                                <strong>{str tag=displayname section=skin}: </strong> {$currentmetadata.displayname|clean_html|safe}
                            </li>
                            {if $currentmetadata.description}
                            <li class="metadescription">
                                <strong>{str tag=description section=skin}: </strong>{$currentmetadata.description|clean_html|safe}
                            </li>
                            {/if}
                            <li class="metacreationdate">
                                <strong>{str tag=creationdate section=skin}: </strong> {$currentmetadata.ctime}
                            </li>
                            <li class="metamodifieddate">
                                <strong>{str tag=modifieddate section=skin}: </strong> {$currentmetadata.mtime}
                            </li>
                         {/if}
                    </ul>
                </div>

                <div class="panel-footer has-form ">
                    <div class="pull-left">
                        {$form|safe}
                    </div>

                    {if $defaultskin->id != $currentskin}
                    <span class="defaultskin pull-right">
                        <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$defaultskin->id}" class="btn btn-default btn-sm">
                            <span class="fa fa-ban text-danger prs"></span>
                            {$defaultskin->title|safe}
                        </a>
                    </span>
                    {/if}
                </div>
            </div>



        </div>
        <div class="col-md-9">
            <div class="collapsible-group">
                <div class="panel panel-default collapsible collapsible-group first">
                    <h3 class="panel-heading">
                        <a href="#userskins" data-toggle="collapse" aria-expanded="false" aria-controls="#userskins" class="">
                            {str tag=userskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="userskins" class="panel-body collapse in">
                        {foreach from=$userskins item=skin}
                            <div class="pull-left mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" class="thumbnail mbs" width="180" alt="{$skin->title}"/>
                                     <div class="lead text-center mbs text-small">
                                    {$skin->title|safe}
                                    </div>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
                {if $favourskins}
               <div class="panel panel-default collapsible collapsible-group first">
                    <h3 class="panel-heading">
                        <a href="#favorskins" data-toggle="collapse" aria-expanded="false" aria-controls="#favorskins" class="collapsed">
                            {str tag=favoriteskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="favorskins" class="panel-body collapse">
                        {foreach from=$favorskins item=skin}
                            <div class="pull-left mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" class="thumbnail mbs" width="180" alt="{$skin->title}"/>
                                     <div class="lead text-center mbs text-small">
                                    {$skin->title|safe}
                                    </div>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
                {/if}
               <div class="panel panel-default collapsible collapsible-group last">
                    <h3 class="panel-heading">
                        <a href="#siteskins" data-toggle="collapse" aria-expanded="false" aria-controls="#siteskins" class="collapsed">
                            {str tag=siteskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="siteskins" class="panel-body no-footer collapse">
                        {foreach from=$siteskins item=skin}
                            <div class="pull-left mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" class="thumbnail mbs" width="180" alt="{$skin->title}"/>
                                     <div class="lead text-center mbs text-small">
                                    {$skin->title|safe}
                                    </div>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>

{if $microheaders}{include file="microfooter.tpl"}{else}{include file="footer.tpl"}{/if}
