
<ul class="nav navbar-nav navbar-right top-nav">
    {strip}
        {if $LOGGEDIN}      
        <li class="identity has-icon">
            <a href="{profile_url($USER)}">
                <span class="glyphicon glyphicon-user"></span> 
                <span class="nav-title">{$USER|display_default_name}</span>
            </a>
        </li>
        {/if}
        {if $RIGHTNAV}
            {foreach from=$RIGHTNAV item=item}
                <li class="{$item.path}{if $item.selected}{assign var=MAINNAVSELECTED value=$item} selected{/if}{if $item.class} {$item.class}{/if}  {if $item.iconclass}has-icon{/if}">
                    <a {if $item.accesskey}accesskey="{$item.accesskey}" {/if}{if $item.aria}{foreach $item.aria key=key item=value}aria-{$key}="{$value}" {/foreach}{/if}href="{if $item.wwwroot}{$item.wwwroot}{else}{$WWWROOT}{/if}{$item.url}">
                        {if $item.iconclass}
                            <span class="glyphicon glyphicon-{$item.iconclass}"></span> 
                        {/if}
                        {if $item.title}
                            <span class="nav-title">{$item.title}</span>
                        {/if}
                       
                        {if isset($item.count)}
                         <span class="navcount{if $item.countclass} {$item.countclass}{/if}">{$item.count}</span>
                        {/if}
                    </a>
                </li>
            {/foreach}
            <li class="btn-logout has-icon">
                <a href="{$WWWROOT}?logout" accesskey="l"> 
                    <span class="glyphicon glyphicon-log-in"></span> 
                    <span class="nav-title">{str tag="logout"}</span>
                </a>
            </li>
        {/if}
    {/strip}
    {if !$nosearch && !$LOGGEDIN && $languageform}
        <li id="language">
            {$languageform|safe}
        </li>
    {/if}
    {if !$LOGGEDIN && !$SIDEBARS && !$LOGINPAGE}
        <li id="loginlink" class="has-icon">
            <a href="{$WWWROOT}?login" accesskey="l">
                <span class="glyphicon glyphicon-log-in"></span> 
                <span class="nav-title">{str tag="login"}</span>
            </a>
        </li>
    {/if}
</ul>

<div class="navbar-form navbar-right">
   {if !$nosearch && ($LOGGEDIN || $publicsearchallowed)}
        {header_search_form}
   {/if}
</div>


