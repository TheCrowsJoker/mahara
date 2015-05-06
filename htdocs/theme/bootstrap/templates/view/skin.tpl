{include file="header.tpl"}

{include file="view/editviewtabs.tpl" selected='skin' new=$new issiteview=$issiteview}

<div class="subpage">
    <div class="skinsbtns pbl text-right">
        <a class="btn btn-lg btn-default" href="{$WWWROOT}skin/index.php">
            <span class="fa fa-pencil fa-lg"></span>
            {str tag=manageskins section=skin}
        </a>
    </div>
    <div class="row ptm">
        <div class="col-md-3">
            {if !$saved}
            <div class="alert alert-warning pbm">
                <span class="fa fa-exclamation-circle"></span>
                {str tag=notsavedyet section=skin}
            </div>
            {/if}
            
            {if $incompatible}
            <div class="alert alert-danger pbm">
                <span class="fa fa-ban"></span>
                {$incompatible}
            </div>
            {/if}

            <h2 class="mt0 mbl">
                {str tag=currentskin section=skin}
            </h2>
            
            <div class="panel panel-default">
                <h3 class="title panel-heading">
                    {$currenttitle|safe}
                </h3>
                
                <img src="{$WWWROOT}skin/thumb.php?id={$currentskin}" width="100%" alt="{$currenttitle}">
                
                <div class="panel-footer has-form">
                    <div class="pull-left">
                        {$form|safe}
                    </div>

                    {if $defualtskin->id != $currentskin}
                    <span class="defaultskin pull-right">
                        <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$defaultskin->id}" class="btn btn-default btn-sm">
                            {$defaultskin->title|safe}
                        </a>
                    </span>
                    {/if}
                </div>
            </div>
        
            {if $currentmetadata}
            <div class="skin-metadata">
                <p class="metadisplayname">
                    <strong>{str tag=displayname section=skin}: </strong> {$currentmetadata.displayname|clean_html|safe}
                </p>
                
                <p class="metadescription">
                    <strong>{str tag=description section=skin}: </strong>{$currentmetadata.description|clean_html|safe}
                </p>
                
                <p class="metacreationdate">
                    <strong>{str tag=creationdate section=skin}: </strong> {$currentmetadata.ctime}
                </p>
                
                <p class="metamodifieddate">
                    <strong>{str tag=modifieddate section=skin}: </strong> {$currentmetadata.mtime}
                </p>
            </div>
            {/if}

        </div>
        <div class="col-md-9">
            <div class="collapsible-group">
                <div class="panel panel-default panel-collapse collapsible collapsible-group first">
                    <h3 class="panel-heading">
                        <a href="#userskins" data-toggle="collapse" aria-expanded="false" aria-controls="#userskins" class="">
                            {str tag=userskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="userskins" class="panel-body collapse in">
                        {foreach from=$userskins item=skin}
                            <div class="thumbnail pull-left mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" width="180" height="101" alt="{$skin->title}"/>
                                </a>
                                <div class="caption text-center">
                                    {$skin->title|safe}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
                {if $favourskins}
               <div class="panel panel-default panel-collapse collapsible collapsible-group first">
                    <h3 class="panel-heading">
                        <a href="#favorskins" data-toggle="collapse" aria-expanded="false" aria-controls="#favorskins" class="collapsed">
                            {str tag=favoriteskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="favorskins" class="panel-body collapse">
                        {foreach from=$favorskins item=skin}
                            <div class="thumbnail pull-right mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" width="180" height="101" alt="{$skin->title}"/>
                                    <div class="caption text-center">
                                        {$skin->title|safe}
                                    </div>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
                {/if}
               <div class="panel panel-default panel-collapse collapsible collapsible-group last">
                    <h3 class="panel-heading">
                        <a href="#siteskins" data-toggle="collapse" aria-expanded="false" aria-controls="#siteskins" class="collapsed">
                            {str tag=siteskins section=skin}
                            <span class="fa fa-chevron-down pls collapse-indicator pull-right"></span>
                        </a>
                    </h3>
                    <div id="siteskins" class="panel-body no-footer collapse">
                        {foreach from=$siteskins item=skin}
                            <div class="thumbnail pull-left mrm">
                                <a href="{$WWWROOT}view/skin.php?id={$viewid}&skin={$skin->id}">
                                    <img src="{$WWWROOT}skin/thumb.php?id={$skin->id}" width="180" height="101" alt="{$skin->title}"/>
                                    <div class="caption text-center">
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
