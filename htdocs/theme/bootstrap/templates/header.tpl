<!doctype html>
<!--[if IE 8 ]><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}" class="ie ie8"><![endif]-->
<!--[if IE 9 ]><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}" class="ie ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if} lang="{$LANGUAGE}"><!--<![endif]-->
{include file="header/head.tpl"}
<body data-usethemedjs="true" class="no-js {if $ADMIN || $INSTITUTIONALADMIN || $STAFF || $INSTITUTIONALSTAFF}admin{/if}">
    <a class="sr-only sr-only-focusable" href="#main">{str tag=skipmenu}</a>

    {if $USERMASQUERADING || !$PRODUCTIONMODE || $SITECLOSED || $SITETOP}
        <div class="site-messages text-center">
    {/if}

        {if $USERMASQUERADING}
            <div class="site-message alert alert-warning" role="alert">
                <span class="fa fa-lg fa-exclamation-triangle prm"></span>
                {$masqueradedetails} {$becomeyouagain|safe}
            </div>
        {/if}
        {if !$PRODUCTIONMODE}
            <div class="site-message alert alert-info" role="alert">
                <span class="fa fa-lg fa-info-circle prm"></span>
                {str tag=notproductionsite section=error}
            </div>
        {/if}
        {if $SITECLOSED}
            <div class="site-message alert alert-danger" role="alert">
                <span class="fa fa-lg fa-lock prm"></span>
                {if $SITECLOSED == 'logindisabled'}{str tag=siteclosedlogindisabled section=mahara arg1="`$WWWROOT`admin/upgrade.php"}{else}{str tag=siteclosed}{/if}
            </div>
        {/if}
        {if $SITETOP}
            <div id="switchwrap">{$SITETOP|safe}</div>
        {/if}

    {if $USERMASQUERADING || !$PRODUCTIONMODE || $SITECLOSED || $SITETOP}
        </div>
    {/if}
    <header class="header navbar navbar-default navbar-fixed-top">
        <div class="container">
            {if $MAINNAV}
             <!-- Brand and toggle get grouped for better mobile display -->
                <button type="button" class="menu-toggle navbar-toggle collapsed" data-toggle="collapse" data-target=".nav-main">
                    <span class="sr-only">{str tag="show"} {str tag="menu"}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            {/if}
            {if !$nosearch && ($LOGGEDIN || $publicsearchallowed)}
            <button type="button" class="navbar-toggle search-toggle collapsed" data-toggle="collapse" data-target=".navbar-form">
                <span class="fa fa-search"></span>
                <span class="nav-title sr-only">{str tag="show"} {str tag="search"}</span>
            </button>
            {/if}
            <span id="site-logo" class="site-logo">
                    <a href="{$WWWROOT}">
                        <img src="{$sitelogo}" alt="{$sitename}">
                    </a>
                    {if $ADMIN || $INSTITUTIONALADMIN || $STAFF || $INSTITUTIONALSTAFF}
                        <div class="admin-title">
                            <a href="{$WWWROOT}admin/" accesskey="a" class="admin-site">{str tag="administration"}</a>
                        </div>
                    {/if}
            </span>
            <div id="loading-box" class="loading-box" style='display:none'></div>
            {include file="header/topright.tpl"}
            
        </div>
    </header>

    {include file="header/navigation.tpl"}

    <div class="container   {if $ADMIN || $INSTITUTIONALADMIN || $STAFF || $INSTITUTIONALSTAFF}{else}ptl{/if}">
        <div class="row">
            <div id="main" class="{if $SIDEBARS}{if $SIDEBLOCKS.right}col-md-9 {else}col-md-9 col-md-push-3{/if}{else}col-md-12{/if} main">
                <div id="content" class="main-column{if $selected == 'content'} editcontent{/if}">
                    <div id="main-column-container">


                        {dynamic}{insert_messages}{/dynamic}
                        {if isset($PAGEHEADING)}
                            <h1 class="{$headingclass}">
                                {if isset($PAGEICON)}
                                <span class="{$PAGEICON}"></span>
                                {/if}
                                {$PAGEHEADING}
                                {if $PAGEHELPNAME}<span class="page-help-icon">{$PAGEHELPICON|safe}</span>{/if}
                            </h1>
                        {/if}

                        {if $SUBPAGETOP}
                            {include file=$SUBPAGETOP}
                        {/if}

                        {if $SUBPAGENAV}
                            {if !$SIDEBARS}
                                <div class="pull-left fullwidth at-top">
                                    {include file="inpagenav.tpl"}
                                </div>
                            {/if}
                            <div class="subpage mtl">
                        {/if}