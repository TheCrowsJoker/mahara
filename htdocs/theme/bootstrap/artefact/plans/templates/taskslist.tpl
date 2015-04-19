{foreach from=$tasks.data item=task}
    {if $task->completed == -1}
        <tr class="incomplete">
            <td class="completiondate">{$task->completiondate}</td>
            <td class="plantasktitle">{$task->title}</td>
            <td class="plantaskdescription">{$task->description|clean_html|safe}</td>
            <td class="plantasktags">{if $task->tags}{list_tags owner=$task->owner tags=$task->tags}{/if}</td>
            <td class="incomplete">
                <span class="sr-only">{str tag=overdue section=artefact.plans}</span>
            </td>
    {else}
            <td class="plantaskdescription">{$task->description|clean_html|safe}</td>
            <td class="plantasktags">{if $task->tags}{list_tags owner=$task->owner tags=$task->tags}{/if}</td>
            {if $task->completed == 1}
                <td class="completed">
                    <span class="fa fa-check text-success"></span>
                    <span class="sr-only">{str tag=completed section=artefact.plans}</span>
                </td>
            {else}
                <td><span class="accessible-hidden sr-only">{str tag=incomplete section=artefact.plans}</span></td>
            {/if}

    {/if}
            <td class="planscontrols control-buttons">
                <div class="btn-group">
                    <a href="{$WWWROOT}artefact/plans/edit/task.php?id={$task->task}" title="{str tag=edit}" class="btn btn-default btn-xs">
                        <span class="fa fa-pencil"></span>
                        <span class="sr-only">{str(tag=editspecific arg1=$task->title)|escape:html|safe}</span>
                    </a>
                    <a href="{$WWWROOT}artefact/plans/delete/task.php?id={$task->task}" title="{str tag=delete}" class="btn btn-default btn-xs">
                        <span class="fa fa-trash text-danger"></span>
                        <span class="sr-only">{str(tag=deletespecific arg1=$task->title)|escape:html|safe}</span>
                    </a>
                </div>
            </td>
        </tr>
{/foreach}
