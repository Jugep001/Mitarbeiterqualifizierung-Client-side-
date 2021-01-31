<div id="WeiterbildungidListContent" class="clContent">
        <table id="WeiterbildungIdList">
            <thead>
                <tr>
                    <th>bezeichnung</th>
                    <th>von</th>
                    <th>bis</th>
                    <th>beschreibung</th>
                    <th>min_teilnehmer</th>
                    <th>max_teilnehmer</th>
                </tr>
            </thead>
        @for key_s in context@
            <tbody>

                    <tr id="#key_s#" onclick="getTableID(this.id, 'Weiterbildung')">

                            <td>#context[key_s]["bezeichnung"]#</td>
                            <td>#context[key_s]["von"]#</td>
                            <td>#context[key_s]["bis"]#</td>
                            <td>#context[key_s]["beschreibung"]#</td>
                            <td>#context[key_s]["min_teilnehmer"]#</td>
                            <td>#context[key_s]["max_teilnehmer"]#</td>

                    </tr>


            </tbody>
        @endfor@
        </table>
            <div>
                <a href="##" data-action=WeiterbildungFormEdit >bearbeiten</a>
                <a href="##" data-action=WeiterbildungFormDelete class="clDelete" >löschen</a>
                <a href=## data-action="WeiterbildungForm"  role="button">erfassen</a>
                <a href="##" data-action="PflegeWeiterDetail" role="button">anzeigen</a>
            </div>

</div>
