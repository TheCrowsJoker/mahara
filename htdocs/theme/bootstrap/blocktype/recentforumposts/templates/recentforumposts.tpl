<div id="recentforumpostsblock" class="recentforumpostsblock">
	{if $foruminfo}
		<ul class="list-unstyled list-group">
			{foreach from=$foruminfo item=postinfo}
			<li class="list-group-item {cycle values='r0,r1'} pl0">


						<a href="{profile_url($postinfo->author)}" class="mts user-icon small-icon left">
							<img src="{profile_icon_url user=$postinfo->author maxheight=40 maxwidth=40}" alt="{str tag=profileimagetext arg1=$postinfo->author|display_default_name}" class="pull-left">
						</a>

						<h4 class="title list-group-heading mts mlxl">
							<a class="pll" href="{$WWWROOT}interaction/forum/topic.php?id={$postinfo->topic}&post={$postinfo->id}">
								{$postinfo->topicname} 
								<span class="metadata small-text">
									- {$postinfo->author|display_name}</span>
							</a>
						</h4>
						<div class="ptl detail">
							<p class=" small-text">{$postinfo->body|str_shorten_html:100:true|safe}</p>
						</div>

			</li>
		{/foreach}
		<ul>
	{else}
	<div class="panel-body">
		<p class="lead small-text">
			{str tag=noforumpostsyet section=interaction.forum}
		</p>
	</div>
	{/if}


</div>
<a class="morelink panel-footer" href="{$WWWROOT}interaction/forum/index.php?group={$group->id}">
	{str tag=gotoforums section=interaction.forum}
	<span class="fa fa-arrow-circle-right mls  pull-right"></span>
</a>