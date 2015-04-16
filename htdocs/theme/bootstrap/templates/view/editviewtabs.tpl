
<div class="btn-group btn-toolbar">
	<a class="btn btn-default {if $selected == 'content'}active{/if}" href="{$WWWROOT}view/blocks.php?id={$viewid}{if $new}&new=1{/if}">
		<span class="fa fa-lg fa-pencil prs"></span>
		{str tag=editcontent section=view}
	</a>



	<a class="btn btn-default {if $selected == 'layout'}active{/if}" href="{$WWWROOT}view/layout.php?id={$viewid}{if $new}&new=1{/if}">
		<span class="fa fa-lg fa-columns prs"></span>
		{str tag=editlayout section=view}
	
	</a>

	{if !$issitetemplate && can_use_skins(null, false, $issiteview)}
		<a class="btn btn-default" class="btn btn-default" href="{$WWWROOT}view/skin.php?id={$viewid}{if $new}&new=1{/if}">
			<span class="fa fa-lg fa-paint-brush prs"></span>
			{str tag=chooseskin section=skin}
		</a>
	{/if}

	{if $edittitle}
		<a class="btn btn-default {if $selected == 'title'}active{/if}" href="{$WWWROOT}view/edit.php?id={$viewid}{if $new}&new=1{/if}">
			<span class="fa fa-lg fa-cogs prs"></span>
			{str tag=edittitleanddescription section=view}

		</a>
	{/if}
	
</div>

{if !$issitetemplate}
	<a class="plm small-text" href="{$displaylink}">
		{str tag=displayview section=view}
	</a>
	{if $edittitle || $viewtype == 'profile'}
		<a class="plm small-text" href="{$WWWROOT}view/access.php?id={$viewid}{if $new}&new=1{/if}">
			<span class="fa fa-unlock-alt"></span> 
			{str tag=shareview section=view}
		</a>
	{/if}
{/if}


<h2 class="mtxl mbxl pbm ">
	{if $selected == 'title'}
		{str tag=edittitleanddescription section=view}
	{elseif $selected == 'layout'}
		{str tag=editlayout section=view}
	{elseif $selected == 'content'}
		{str tag=editcontent section=view}
	{/if}
</h2>