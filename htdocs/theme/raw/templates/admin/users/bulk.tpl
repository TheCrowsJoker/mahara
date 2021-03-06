{include file="header.tpl"}
<div class="panel panel-default">
    <div id="edit-users" class="panel-body admin-edit-users">
        <p class="lead">{str tag=editselectedusersdescription1 section=admin}</p>
        <ul class="nav nav-tabs list-unstyled" role="tablist">
            <li id="suspend-user-tab" class="active" role="presentation">
                <a href="#suspend-form" aria-controls="suspend-form" role="tab" data-toggle="tab">
                    <span class="icon icon-lg icon-ban left"></span>
                    {str tag=Suspend section=admin}
                </a>
            </li>
            <li id="changeauth-user-tab" class="" role="presentation">
                <a href="#changeauth-form" aria-controls="changeauth-form" role="tab" data-toggle="tab">
                    <span class="icon icon-lg icon-key left"></span>
                    {str tag=changeauthmethod section=admin}
                </a>
            </li>
            {if $probationform}
            <li id="probation-user-tab" class="" role="presentation">
                <a href="#probation-form" aria-controls="probation-form" role="tab" data-toggle="tab">
                    <span class="icon icon-lg icon-exclamation-triangle left"></span>
                    {str tag=probationbulksetspamprobation section=admin}
                </a>
            </li>
            {/if}
            <li id="delete-user-tab" class="" role="presentation">
                <a href="#delete-form" aria-controls="delete-form" role="tab" data-toggle="tab">
                    <span class="icon icon-lg icon-trash left"></span>
                    {str tag=deleteusers section=admin}
                </a>
            </li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane" id="changeauth-form">
                {$changeauthform|safe}
            </div>
            <div role="tabpanel" class="tab-pane" id="probation-form">
                {$probationform|safe}
            </div>
            <div role="tabpanel" class="tab-pane active" id="suspend-form">
                {$suspendform|safe}
            </div>
            <div role="tabpanel" class="tab-pane" id="delete-form">
                {$deleteform|safe}
            </div>
        </div>
        <hr>
        <div class="bulk-action-selected-user">
            <h2>{str tag=selectedusers section=admin} ({count($users)})</h2>
            {include file="admin/users/userlist.tpl" users=$users}
        </div>
    </div>
</div>

{include file="footer.tpl"}
