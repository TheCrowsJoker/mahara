{include file="header.tpl"}

<div class="row">
    <div class="col-md-9">
        <p class='lead'>{str tag=sitelicensesdescription section=admin}</p>
        {if !$enabled}
        <p class="alert alert-warning">{str tag=sitelicensesdisablednote section=admin args=$WWWROOT}</p>
        {/if}
    </div>
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <form id="sitelicenses" action="" method="post" name="sitelicenses">
                {if $errors}
                    {foreach from=$errors item=e}
                        <div class="errmsg">{$e}</div>
                    {/foreach}
                {/if}
                <table class="fullwidth table table-striped">
                    <thead>
                    <tr>
                        <th>{str tag=licenseiconlabel section=admin}</th>
                        <th>{str tag=licensedisplaynamelabel section=admin}</th>
                        <th>{str tag=licenseshortnamelabel section=admin}</th>
                        <th>{str tag=licensenamelabel section=admin}</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach from=$licenses key=i item=l}
                        <tr class="{cycle values='r0,r1'}">
                            <td>{if $l->icon}<img src="{license_icon_url($l->icon)}" alt="{$l->displayname}">{/if}</td>
                            <td><a href="{$l->name}">{$l->displayname}</a></td>
                            <td>{$l->shortname}</td>
                            <td><a href="{$l->name}">{$l->name}</a></td>
                            <td class="control-buttons">
                                <a href="license-edit.php?edit={$l->name|escape:url}" title="{str tag=edit}" class="btn btn-default btn-xs">
                                    <span class="icon icon-pencil"></span>
                                    <span class="sr-only">{str(tag=editspecific arg1=$l->shortname)|escape:html|safe}</span>
                                </a>
                                <span class="input-as-icon icon-trash">
                                    <input class="input-as-icon icon-trash submit" type="submit" title="{str tag=delete}" value="{str tag=delete}" name="license_delete[{$l->name}]" alt="{str(tag=deletespecific arg1=$l->shortname)|escape:html|safe}">
                                </span>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
                <a href="license-edit.php?add=add" class="btn">{str tag=addsitelicense section=admin}</a>
                {if $extralicenses}
                    <p>{str tag=extralicensesdescription section=admin}</p>
                    <ul>
                    {foreach from=$extralicenses item=l}
                        <li>{$l}</li>
                    {/foreach}
                    </ul>
                {/if}
                </form>
            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}
