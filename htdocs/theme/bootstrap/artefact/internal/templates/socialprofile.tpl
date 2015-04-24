{include file="header.tpl"}
{if $message}
    <div class="deletemessage">
        <h2>{$subheading}</h2>
        <p class="lead small-text">{$message}</p>
        <div>{$form|safe}</div>
    </div>
{else}
    <h2>{$subheading}</h2>
    <div>{$form|safe}</div>
{/if}
{include file="footer.tpl"}