<div id="home-info-container" class="dashboard-widget-container">

    <div class="home-info-boxes{if $USER->is_logged_in()} loggedin{/if} fullwidth">

        {if $USER->is_logged_in()}
        <a href="{$url.views}" title="{str tag=create}" class="logged-in thumbnail-widget first">
        {else}
        <span class="logged-out thumbnail-widget first">
        {/if}
            <div id="home-info-create" class="widget">
                <div class="widget-heading">
                    <div class="circle-bg mrm">
                        <span class="fa fa-plus"></span>
                    </div>
                    <h2 class="title">
                        {str tag=create}
                    </h2>
                    <p>{str tag=createsubtitle}</p>
                </div>
                <div class="widget-detail">
                    <p>{str tag=createdetail}</p>
                </div>
            </div>
        {if $USER->is_logged_in()}
        </a>
        {else}
        </span>
        {/if}

        {if $USER->is_logged_in()}
        <a href="{$url.share}" class="logged-in thumbnail-widget">
        {else}
        <span class="logged-out thumbnail-widget">
        {/if}
            <div id="home-info-share" class="home-info-box">
                <div class="widget-heading">
                    <div class="circle-bg mrm">
                        <span class="fa fa-unlock-alt"></span>
                    </div>
                    <h2 class="title">
                        {str tag=share}
                    </h2>
                    <p>{str tag=sharesubtitle}</p>
                </div>
                <div class="widget-detail">
                    <p>{str tag=sharedetail}</p>
                </div>
        </div>
        {if $USER->is_logged_in()}
        </a>
        {else}
        </span>
        {/if}

        {if $USER->is_logged_in()}
        <a href="{$url.groups}" class="logged-in thumbnail-widget last">
        {else}
        <span class="logged-out thumbnail-widget last">
        {/if}
            <div id="home-info-engage" class="home-info-box">
                <div class="widget-heading">
                    <div class="circle-bg mrm">
                        <span class="fa fa-users"></span>
                    </div>
                    <h2 class="title">
                        {str tag=engage}
                    </h2>
                    <p>{str tag=engagesubtitle}</p>
                </div>
                <div class="widget-detail">
                    <p>{str tag=engagedetail}</p>
                </div>
            </div>
        {if $USER->is_logged_in()}
        </a>
        {else}
        </span>
        {/if}
        
        {if $USER->is_logged_in()}
        <div id="hideinfo" class="nojs-hidden-block text-right hide-info">
            <a href="#" title="{str tag=Hide2}" class="remove-widgets">
                <span class="fa fa-remove"></span>
                <span class="">{str tag=Hide2}</span>
            </a>
        </div>
        {/if}
    </div>
</div>
