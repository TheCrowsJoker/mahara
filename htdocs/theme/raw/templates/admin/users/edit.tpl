{include file="header.tpl"}
<div class="panel panel-body">
    <div id="edituser">
        {if $suspended}
            <div class="suspendederror">
                <h3 class="title">{$suspendedby}</h3>
                {if $user->get('suspendedreason')}
                    <div class="detail">
                        <strong>{str tag="suspendedreason" section="admin"}:</strong> {$user->suspendedreason}
                    </div>
                {/if}
                {$suspendform2|safe}
           </div>
        {/if}

        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">
          Launch demo modal
        </button>

    <div class="fullwidth" id="useraccountsettings">
        <div id="useraccountsettingsleft">
            <div id="profilepict">
                <a href="{profile_url($user)}"><img src="{profile_icon_url user=$user maxheight=100 maxwidth=100}" alt="{str tag=profileimagetext arg1=$user|display_default_name}"></a>
                <div id="profilename"><a href="{profile_url($user)}">{$user|display_name}</a></div>
                {if $loginas}
                   <div id="loginas"><a class="btn" href="{$WWWROOT}admin/users/changeuser.php?id={$user->id}">{str tag=loginas section=admin}</a></div>
                {/if}
            </div>
            <h2>{str tag="siteaccountsettings" section="admin"}</h2>
            <p>{str tag="usereditdescription" section="admin"}</p>
            <p class="errmsg">{str tag="usereditwarning" section="admin"}</p>
            {$siteform|safe}

        </div>
        <div class="cb"></div>
    </div>
</div>
</div>
{if ($institutions)}
    <div class="has-attachment panel panel-default collapsible">
        <h4 class="panel-heading pts pbs">
            <a class="text-left pts pbm collapsed" data-toggle="collapse" href="#test" aria-expanded="false">
                {str tag="institutionsettings" section="admin"}
                <span class="pts icon icon-chevron-down collapse-indicator pull-right"></span>
            </a>
        </h4>
        <div class="collapse plm" id="test" aria-expanded="false">
        <p>{str tag="institutionsettingsdescription" section="admin"}</p>
        {$institutionform|safe}
    </div>
{/if}

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                {if $suspendable}
                    <div id="suspenddelete">
                        <div id="suspend">
                            <h3>{str tag="suspenduser" section=admin}</h3>
                            <p>{str tag="suspenduserdescription" section=admin}</p>
                            {$suspendform|safe}
                        </div>
                    </div>
                {if $deletable}
                    <div id="delete">
                        <h3>{str tag=deleteuser section=admin}</h3>
                        <p>{str tag=deleteusernote section=admin}</p>
                        {$deleteform|safe}
                    </div>
                {/if}
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}
