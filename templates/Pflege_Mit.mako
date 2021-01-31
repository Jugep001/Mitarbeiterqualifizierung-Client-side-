
<div id="MitarbeiteridListContent" class="clContent">
        <table id="MitarbeiterIdList">
            <thead>
                <tr class="listheader">
                    <th>Name</th>
                    <th>Vorname</th>
                    <th>Akademischer Grad</th>
                    <th>Tätigkeit</th>
                </tr>
            </thead>
        @for key_s in context@


            <tbody>


                    <tr id="#key_s#" onclick="getTableID(this.id, 'Mitarbeiter')">

                            <td>#context[key_s]["name"]#</td>
                            <td>#context[key_s]["vorname"]#</td>
                            <td>#context[key_s]["akademischer_grad"]#</td>
                            <td>#context[key_s]["taetigkeit"]#</td>

                    </tr>
            </tbody>


        @endfor@
        </table>
            <div>
                <a href="##" data-action=MitarbeiterFormEdit >bearbeiten</a>
                <a href="##" data-action=MitarbeiterFormDelete class="clDelete" >löschen</a>
                <a href="##" data-action="MitarbeiterForm" role="button">erfassen</a>
                <a href="##" data-action="PflegeMitDetail" role="button">anzeigen</a>
            </div>

</div>

