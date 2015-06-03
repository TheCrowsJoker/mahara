{include file="header.tpl"}

{include file="view/editviewtabs.tpl" selected='content' new=$new issiteview=$issiteview}
<div id="blocksinstruction" class="lead ">
        {str tag='blocksintructionnoajax' section='view'}
</div>
<div class="row" selected='content' data-target="col-collapse">

    {if $columns}
        <form action="{$formurl}" method="post">
            <input type="submit" name="{$action_name}" id="action-dummy" class="hidden">
            <input type="hidden" id="viewid" name="id" value="{$view}">
            <input type="hidden" name="change" value="1">
            <input type="hidden" id="category" name="c" value="{$category}">
            <input type="hidden" name="sesskey" value="{$SESSKEY}">
            {if $new}<input type="hidden" name="new" value="1">{/if}

            <div id="editcontent-sidebar-wrapper" class="col-collapse">
                <div id="editcontent-sidebar" data-spy="affix" data-offset-top="420" data-offset-top="100" class="toolbar-affix">
                {include file="view/contenteditor.tpl" selected='content' new=$new}
                {if $viewthemes}
                    <div id="select-theme">
                        <div id="select-theme-header">{str tag=theme section=view}</div>
                        <select id="viewtheme-select" name="viewtheme">
                        {foreach from=$viewthemes key=themeid item=themename}
                            <option value="{$themeid}"{if $themeid == $viewtheme} selected="selected"{/if}>{$themename}</option>
                        {/foreach}
                        </select>
                    </div>
                {/if}
                </div>
            </div>
            <div class="col-with-collapse">
                <div id="bottom-pane" data-role="workspace">
                    <div id="column-container">
                        {$columns|safe}
                    </div>
                </div>
            </div>
        </form>

        <div id="view-wizard-controls" class="col-collapse-offset col-with-collapse">
<!--             {if $issitetemplate}
                <form action="{$WWWROOT}admin/site/views.php" method="GET">
                    <input class="submit btn btn-success" type="submit" value="{str tag=displayview section=view}">
                </form>
            {else}
                <form action="{$WWWROOT}{if $groupid}{if $viewtype == 'grouphomepage'}{$groupurl}{else}view/groupviews.php{/if}{elseif $institution}view/institutionviews.php{elseif $viewtype == 'dashboard'}index.php{else}view/index.php{/if}" method="GET">
                    {if $groupid}
                        {if $viewtype == 'grouphomepage'}
                        <input type="hidden" name="id" value="{$groupid}">
                        {else}
                        <input type="hidden" name="group" value="{$groupid}">
                        {/if}
                    {elseif $institution}
                        <input type="hidden" name="institution" value="{$institution}">
                    {/if}
                    <input class="submit btn btn-success" type="submit" value="{str tag=displayview section=view}">
                </form>
            {/if} -->
            
            {if !$issitetemplate}
            <a class="btn btn-success" href="{$displaylink}">
                {str tag=displayview section=view}
            </a>
            {/if}
        </div>

    {elseif $block}
        <form action="{$formurl}" method="post">
            <input type="submit" name="{$action_name}" id="action-dummy" class="hidden">
            <input type="hidden" id="viewid" name="id" value="{$view}">
            <input type="hidden" name="change" value="1">
            <input type="hidden" id="category" name="c" value="{$category}">
            <input type="hidden" name="sesskey" value="{$SESSKEY}">
            {if $new}<input type="hidden" name="new" value="1">{/if}

            <div id="editcontent-sidebar-wrapper" class="col-collapse">
                <div id="editcontent-sidebar" >
                    {include file="view/contenteditor.tpl" selected='content' new=$new}
                    {if $viewthemes}
                        <div id="select-theme">
                            <div id="select-theme-header">{str tag=theme section=view}</div>
                            <select id="viewtheme-select" name="viewtheme">
                            {foreach from=$viewthemes key=themeid item=themename}
                                    <option value="{$themeid}"{if $themeid == $viewtheme} selected="selected" style="font-weight: bold;"{/if}>{$themename}</option>
                            {/foreach}
                            </select>
                        </div>
                    {/if}
                </div>
            </div>
            <div class="blockconfig-background">
                <div class="blockconfig-container">
                        {$block.html|safe}
                </div>
            </div>
            {if $block.javascript}
            <script type="text/javascript">
                    {$block.javascript|safe}
            </script>
            {/if}
        </form>
    {/if}

</div>


<div class="modal modal-shown modal-docked-right blockinstance configure modal-docked closed" id="addblock" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" data-height=".modal-body">
            <div class="modal-header">
                <button class="deletebutton close" name="action_removeblockinstance_id_{$id}">
                    <span class="times">&times;</span>
                    <span class="sr-only">{str tag=Close}</span>
                </button>
                <h4 class="modal-title blockinstance-header inline" id="addblock-heading"></h4>
                <span class="fa fa-cogs fa-2x pull-right"></span>
            </div>
            <div class="modal-body blockinstance-content pt0 pb0">
                <div class="block-inner">{$addform|safe}</div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-shown modal-docked-right blockinstance configure modal-docked closed" id="configureblock" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" data-height=".modal-body">
            <div class="modal-header">
                <button class="deletebutton close" name="close_configuration">
                    <span class="times">&times;</span>
                    <span class="sr-only">{str tag=closeconfiguration section=view}</span>
                </button>

                <h4 class="modal-title blockinstance-header inline"></h4>
                <span class="fa fa-cogs fa-2x pull-right"></span>
            </div>
            <div class="modal-body blockinstance-content pt0 pb0">
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}
