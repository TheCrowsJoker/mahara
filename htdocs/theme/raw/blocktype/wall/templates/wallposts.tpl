{include file="header.tpl"}

    <h1>{$displayname}: {str tag='wall' section='blocktype.wall'}</h1>
    
    <a href="{profile_url($owner)}" class="btn btn-default">
        <span class="icon icon-arrow-left prs"></span>
        {str tag='backtoprofile' section='blocktype.wall'}
    </a>

    <div class="row mtl">
        <div class="col-md-8">
            {include file="blocktype:wall:inlineposts.tpl"}
        </div>
    </div>

{include file="footer.tpl"}
