<div class="blockinstance-header">
    <div class="blockinstance-controls">
        <button class="deletebutton" name="action_removeimagebrowser">
            {str tag=Close}
        </button>
    </div>
    <h2 class="title">{$title|default:"[$strnotitle]"}</h2>
    <p class="description">{$description|default:""}</p>
</div>
<div class="blockinstance-content">
    {$content|safe}
</div>
<div id="filebrowserupdatetarget"></div>