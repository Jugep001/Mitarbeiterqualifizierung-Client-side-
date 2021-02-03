<div class="item7">

    <table id="MitarbeiterIdList">
        <thead>
                <tr>
                    <th>Name</th>
                    <th>Vorname</th>
                    <th>Akademischer Grad</th>
                    <th>Tätigkeit</th>
                    <th>Weiterbildung</th>
                    <th>Weiterbildung(status)</th>
                    <th>Zertifikat(bezeichnung)</th>
                    <th>Qualifikation(bezeichnung)</th>


                </tr>
        </thead>
        @for key_s in context@



            <tbody>
                    <tr id="#key_s#" onclick="getTableID(this.id, 'Mitarbeiter')">

                            <td>#context[key_s]["name"]#</td>
                            <td>#context[key_s]["vorname"]#</td>
                            <td>#context[key_s]["akademischer_grad"]#</td>
                            <td>#context[key_s]["taetigkeit"]#</td>
                            @for key_weiter in context[key_s]["Weiterbildung"]@

                                @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil" || context[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@

                                    <td>#context[key_s]["Weiterbildung"][key_weiter]["bezeichnung"]#</td>
                                    <td>#context[key_s]["Weiterbildung"][key_weiter]["status"]#</td>
                                    @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@

                                        <td>#context[key_s]["Weiterbildung"][key_weiter]["bezeichnung_zerti"]#</td>

                                            @for Quali_elem in context[key_s]["Weiterbildung"][key_weiter]["Qualifikation"]@
                                                <td>
                                                    #context[key_s]["Weiterbildung"][key_weiter]["Qualifikation"][Quali_elem]["bezeichnung"]#
                                                </td>
                                            @endfor@
                                    @endif@
                                @endif@
                            @endfor@
                    </tr>
            </tbody>


        @endfor@
    </table>

            <div>
                <a href="##" data-action=MitarbeiterDetailFormEdit >bearbeiten</a>
                <a href="##" data-action=MitarbeiterDetailFormDelete class="clDelete" >löschen</a>
                <a href="##" data-action="MitarbeiterForm" role="button">erfassen</a>
                <a href="##" data-action="PflegeMit" role="button">zurück</a>
            </div>
        </div>
