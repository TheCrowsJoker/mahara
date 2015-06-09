{include file="header.tpl"}
    {$settingsformtag|safe}
    <div class="table-responsive">
        <table id="profileicons" class="hidden fullwidth table table-striped">
            <thead>
                <tr>
                    <th class="profileiconcell">{str tag="image"}</th>
                    <th>{str tag="imagetitle" section=artefact.file}</th>
                    <th class="text-center">{str tag="Default" section=artefact.file}</th>
                    <th class="text-center">{str tag="delete"}</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" class="text-right">
                        <button id="settings_default" type="submit" class="submit btn btn-default" name="default">
                            <span class="icon icon-check icon-lg text-success prs"></span>
                            {str tag="setdefault" section=artefact.file}
                        </button>
                        <button id="settings_delete" type="submit" class="delete btn btn-default" name="delete">
                             <span class="icon icon-trash icon-lg text-danger prs"></span>
                             {str tag="deleteselectedicons" section=artefact.file}
                         </button>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <input type="hidden" name="pieform_settings" value="">
    <input type="hidden" name="sesskey" value="{$USER->get('sesskey')}">
    </form>

    <h3>{str tag="uploadprofileicon" section="artefact.file"}</h3>
    <p class="lead ptl pbl">
        {str tag="profileiconsiconsizenotice" section="artefact.file" args=$imagemaxdimensions}
    </p>

    {$uploadform|safe}
{include file="footer.tpl"}
