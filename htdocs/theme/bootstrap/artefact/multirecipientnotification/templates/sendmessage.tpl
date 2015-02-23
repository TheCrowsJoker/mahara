{include file="header.tpl"}

{if $messages}
<div id="messagethread" class="fullwidth fixwidth message-thread">
    {foreach from=$messages item=message}
    <div class="{cycle values='r0,r1'} message-item">
        <div data-toggle="collapse" data-target="#message-{$message->id}" aria-expanded="false" aria-controls="#message-{$message->id}" class="message-preview clearfix">
            <div class="from-user pull-left">
                <img src="{profile_icon_url user=$message->fromid maxwidth=20 maxheight=20}" alt="{$message->fromusrname}" class="user-icon-image">
                <h5 class="username">
                    {if ($message->fromusrlink)}
                    <a href="{$message->fromusrlink}">
                    {/if}
                        <span class="accessible-hidden sr-only">{str tag='From' section='mahara'}
                        </span>
                        {$message->fromusrname}
                        {if ($message->fromusrlink)}
                    </a>
                    {/if}
                </h5>
            </div>
            <p class="postedon">
                {$message->ctime|strtotime|format_date}
            </p>
            <div class="content-preview">
                <p class="content">{$message->message}</p>
            </div>
        </div>

        <div id="message-{$message->id}" class="message-content">
            <div class="message-recipients">
                <label>
                    {str tag='labelrecipients' section='artefact.multirecipientnotification'}
                </label>
                {foreach from=$message->tousrs item=recipient key="index"}
                {if $recipient['link']}
                <a href="{$recipient['link']}">
                    {/if}
                    <span class="accessible-hidden sr-only">
                        {str tag='labelrecipients' section='artefact.multirecipientnotification'}
                    </span>
                    {$recipient['display']}
                        {if ($index + 1) < count($message->tousrs)}; {/if}
                    {if $recipient['link']}
                </a>
                    {/if}
                {/foreach}
            </div>
            <div class="subjectdiv">
                <label>
                    {str tag='labelsubject' section='artefact.multirecipientnotification'}
                </label>
                <a href="{$link}?replyto={$message->id}&returnto={$returnto}">
                    <span class="accessible-hidden sr-only">
                        {str tag='labelsubject' section='artefact.multirecipientnotification'}
                    </span>
                    {$message->subject}
                </a>
            </div>
            <div class="messagebody">
                {$message->message}
            </div>
        </div>
    </div>
{/foreach}
</div>
{/if}
{$form|safe}

{include file="footer.tpl"}
