<div class="panel-body">
{if $groupviews}
    <div  class="groupviewsection">
        <div id="groupviewlist" class="listing blocktype">
            {$groupviews.tablerows|safe}
        </div>
    </div>
    {if $groupviews.pagination}
    <div id="groupviews_page_container" class="hidden center">
        {$groupviews.pagination|safe}
    </div>
    {/if}
    
    {if $groupviews.pagination_js}
    <script>
        addLoadEvent(function() {literal}{{/literal}
            {$groupviews.pagination_js|safe}
            removeElementClass('groupviews_page_container', 'hidden');
        {literal}}{/literal});
    </script>
    {/if}
{/if}

{if $sharedviews}
    <div class="groupviewsection">
        <h4 class="title">
            {str tag="viewssharedtogroup" section="view"}
        </h4>
        <div id="sharedviewlist" class="listing blocktype">
            {$sharedviews.tablerows|safe}
        </div>
    </div>
    
    {if $sharedviews.pagination}
        <div id="sharedviews_page_container" class="hidden center">{$sharedviews.pagination|safe}
        </div>
    {/if}
    
    {if $sharedviews.pagination_js}
    <script>
        addLoadEvent(function() {literal}{{/literal}
            {$sharedviews.pagination_js|safe}
            removeElementClass('sharedviews_page_container', 'hidden');
        {literal}}{/literal});
    </script>
    {/if}
{/if}


{if $sharedcollections}
    <div class="groupviewsection">
        <h4 class="title">
            {str tag="collectionssharedtogroup" section="collection"}
        </h4>
        <div id="sharedcollectionlist" class="listing blocktype">
            {$sharedcollections.tablerows|safe}
        </div>
    </div>
    
    {if $sharedcollections.pagination}
        <div id="sharedcollections_page_container" class="hidden center">
        {$sharedcollections.pagination|safe}
        </div>
    {/if}
    
    {if $sharedcollections.pagination_js}
    <script>
        addLoadEvent(function() {literal}{{/literal}
            {$sharedcollections.pagination_js|safe}
            removeElementClass('sharedcollections_page_container', 'hidden');
        {literal}}{/literal});
    </script>
    {/if}
{/if}


{if $mysubmitted || $group_view_submission_form}
    <div class="groupviewsection">
    {if $group_view_submission_form}
        <h4 class="title">
            {str tag="submittogroup" section="view"}
        </h4>
    {/if}
        <div class="listing blocktype">
        {if $mysubmitted}
            {foreach from=$mysubmitted item=item}
                <div class="submittedform listrow">
                {if $item.submittedtime}
                    {str tag=youhavesubmittedon section=view arg1=$item.url arg2=$item.name arg3=$item.submittedtime|format_date}
                {else}
                    {str tag=youhavesubmitted section=view arg1=$item.url arg2=$item.name}
                {/if}
                {* submittedstatus == '2' is equivalent to PENDING_RELEASE *}
                {if $item.submittedstatus == '2'}- 
                {str tag=submittedpendingrelease section=view}
                {/if}
                </div>
            {/foreach}
        {/if}
        
        {if $group_view_submission_form}
            <div class="submissionform listrow">{$group_view_submission_form|safe}
            </div>
        {/if}
        
        </div>
    </div>
{/if}

{if $allsubmitted}
    <div class="groupviewsection">
        <h4 class="title">
            {str tag="submissionstogroup" section="view"}
        </h4>
        <div id="allsubmissionlist" class="listing blocktype">
            {$allsubmitted.tablerows|safe}
        </div>
    </div>
    {if $allsubmitted.pagination}
        <div id="allsubmitted_page_container" class="hidden center">{$allsubmitted.pagination|safe}</div>
    {/if}
    {if $allsubmitted.pagination_js}
    <script>
        addLoadEvent(function() {literal}{{/literal}
            {$allsubmitted.pagination_js|safe}
            removeElementClass('allsubmitted_page_container', 'hidden');
        {literal}}{/literal});
    </script>
    {/if}
{/if}
</div>