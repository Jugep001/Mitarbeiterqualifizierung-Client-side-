<div class="item7">
            <table id="MitarbeiterIdList">
                <tr>
                    <th>Name</th>
                </tr>

            @for key_s in context@


                        <tr id="#key_s#" onclick="getTableID(this.id, 'Mitarbeiter')">
                            <td>#context[key_s]["vorname"]#</td>
                        </tr>




            @endfor@
            </table>
            <div>
                <a href="##" data-action="SichtMitForm" role="button">anzeigen</a>
            </div>
</div>
