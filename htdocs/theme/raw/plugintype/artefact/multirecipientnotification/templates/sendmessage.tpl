{include file="header.tpl"}

{if $messages}
<p class="lead">{str tag='labelsubject' section='artefact.multirecipientnotification'} {$messages.[0]->subject}</p>
<div id="messagethread" class="collapsible-group">
{foreach from=$messages item=message name='message'}
    <div class="message-item panel panel-default collapsible collapsible-group {if $dwoo.foreach.message.first}first{/if}">
        <h2 class="message-preview panel-heading">
            <span class="user-icon left">
                <img src="{profile_icon_url user=$message->fromid maxwidth=60 maxheight=60}" alt="{$message->fromusrname}">
            </span>
            <a class="has-user-icon {if $dwoo.foreach.message.last}{else}collapsed{/if}" href="#message-{$message->id}" data-toggle="collapse" aria-expanded="1" aria-controls="#message-{$message->id}">

                {if ($message->fromusrlink != 0)}
                <a href="{$message->fromusrlink}">
                    <span class="accessible-hidden sr-only">
                        {str tag='From' section='mahara'}
                    </span>
                    {$message->fromusrname}
                </a>
                {else}
                    {$message->fromusrname}
                {/if}
                <span class="metadata">
                    - {$message->ctime|strtotime|format_date}
                </span>
                <span class="icon icon-chevron-down pls collapse-indicator pull-right"></span>
                <span class="content-preview mts">
                    <p class="content">{$message->message}</p>
                </span>
            </a>
        </h2>

        <div id="message-{$message->id}" class=" message-wrap collapse {if $dwoo.foreach.message.last}in{/if}">
            <div class="message-content panel-body">
                <p class="recipients">
                    <strong>
                        {str tag='labelrecipients' section='artefact.multirecipientnotification'}
                    </strong>
                    {foreach from=$message->tousrs item=recipient key="index"}
                    {if $recipient['link']}<a href="{$recipient['link']}">{/if}
                        <span class="prs">
                        {$recipient['display']}
                        {if ($index + 1) < count($message->tousrs)}; {/if}
                        </span>
                    {if $recipient['link']}</a>{/if}
                    {/foreach}
                </p>
                <p class="date">
                    <strong>
                        {str section='activity' tag='date'}:
                    </strong>
                    {$message->ctime|strtotime|format_date}
                </p>
                <p class="subject">
                    <strong>
                        {str tag='labelsubject' section='artefact.multirecipientnotification'}
                    </strong>
                    {$message->subject}
                    </a>
                </p>

                <p class="messagebody">
                    {$message->message}
                </p>

            </div>
            {if $dwoo.foreach.message.last == 0}
            <div class="panel-footer mbl">
                <a href="{$link}?replyto={$message->id}&returnto={$returnto}">
                    <span class="icon icon-reply"></span>
                    {str tag=reply section=artefact.multirecipientnotification}
                </a>
            </div>
            {/if}
        </div>
    </div>
{/foreach}
</div>
<div class="form-sendmessage panel panel-default collapsible">
    <div class="panel-footer ptl">
        {$form|safe}
    </div>
</div>
{else}
    {$form|safe}
{/if}

{include file="footer.tpl"}
