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
                <th>Zerti(bezeichnung)</th>
                <th>Zerti(beschreibung)</th>
                <th>Zerti(berechtigt zu)</th>
                <th>Quali(bezeichnung)</th>
                <th>Quali(beschreibung)</th>
                <th>Teilnehmer</th>


            </tr>
        </thead>

        @for key_s in context[0]@

        <tbody>

                    <tr id="#key_s#" onclick="getTableID(this.id, 'Weiterbildung')">


                                    <td>#context[0][key_s]["bezeichnung"]#</td>
                                    <td>#context[0][key_s]["von"]#</td>
                                    <td>#context[0][key_s]["bis"]#</td>
                                    <td>#context[0][key_s]["beschreibung"]#</td>
                                    <td>#context[0][key_s]["min_teilnehmer"]#</td>
                                    <td>#context[0][key_s]["max_teilnehmer"]#</td>
                                    <td>#context[0][key_s]["bezeichnung_zerti"]#</td>
                                    <td>#context[0][key_s]["beschreibung_zerti"]#</td>
                                    <td>#context[0][key_s]["berechtigt_zu"]#</td>
                                    <td>
                                    @for Quali_elem in context[0][key_s]["Qualifikation"]@
                                                    [#context[0][key_s]["Qualifikation"][Quali_elem]["bezeichnung"]#]
                                    @endfor@
                                    </td>
                                    <td>
                                    @for Quali_elem in context[0][key_s]["Qualifikation"]@
                                                    [#context[0][key_s]["Qualifikation"][Quali_elem]["beschreibung"]#]
                                    @endfor@
                                    </td>
                                    @for key_mit_s in context[1]@
                                        @if context[1][key_mit_s]["Weiterbildung"]@
                                            @for key_weiter in context[1][key_mit_s]["Weiterbildung"]@

                                                @if context[1][key_mit_s]["Weiterbildung"][key_weiter]["bezeichnung"] == context[0][key_s]["bezeichnung"]@

                                                    @if context[1][key_mit_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil"@

                                                        <td>#context[1][key_mit_s]["name"]#</td>


                                                    @endif@
                                                @endif@
                                            @endfor@

                                        @endif@
                                    @endfor@

                    </tr>

        </tbody>


        @endfor@
    </table>
            <div>
                <a href="##" data-action=WeiterbildungFormEdit >bearbeiten</a>
                <a href="##" data-action=WeiterbildungDetailFormDelete class="clDelete" >löschen</a>
                <a href=## data-action="WeiterbildungForm"  role="button">erfassen</a>
                <a href="##" data-action="PflegeWeiter" role="button">anzeigen</a>
            </div>
</div>
