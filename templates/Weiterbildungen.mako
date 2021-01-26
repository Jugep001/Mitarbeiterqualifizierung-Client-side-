<div class="item7">
        <table id="Mitarbeitertabelle">
            <tr>
                            <th><b>bezeichnung </b></th>
                            <th>von </th>
                            <th>bis </th>
                            <th>beschreibung </th>
                            <th>max_teilnehmer </th>
                            <th>min_teilnehmer </th>
                            <th>bezeichnung(Zertifikat) </th>
                            <th>beschreibung(Zertifikat) </th>
                            <th>berechtigt zu(Zertifikat) </th>
                            <th>bezeichnung(Qualifikation) </th>
                            <th>beschreibung(Qualifikation) </th>
                            <th>Teilnehmer(erfolgreich) </th>
            </tr>


         @for key_s in context[1]@
                            <tr>


                                    <td>#context[1][key_s]["bezeichnung"]#</td>
                                    <td>#context[1][key_s]["von"]#</td>
                                    <td>#context[1][key_s]["bis"]#</td>
                                    <td>#context[1][key_s]["beschreibung"]#</td>
                                    <td>#context[1][key_s]["max_teilnehmer"]#</td>
                                    <td>#context[1][key_s]["min_teilnehmer"]#</td>
                                    <td>#context[1][key_s]["bezeichnung_zerti"]#</td>
                                    <td>#context[1][key_s]["beschreibung_zerti"]#</td>
                                    <td>#context[1][key_s]["berechtigt_zu"]#</td>
                                    <td>
                                                @for Quali_elem in context[1][key_s]["Qualifikation"]@
                                                    [#context[1][key_s]["Qualifikation"][Quali_elem]["bezeichnung"]#]
                                                @endfor@
                                    </td>
                                    <td>
                                                @for Quali_elem in context[1][key_s]["Qualifikation"]@
                                                    [#context[1][key_s]["Qualifikation"][Quali_elem]["beschreibung"]#]
                                                @endfor@
                                    </td>


                                    <td>


                                    @for key_mit_s in context[0]@
                                            @if context[0][key_mit_s]["Weiterbildung"]@
                                                @for key_weiter in context[0][key_mit_s]["Weiterbildung"]@
                                                   @if context[0][key_mit_s]["Weiterbildung"][key_weiter]["bezeichnung"] == context[1][key_s]["bezeichnung"]@
                                                        @if context[0][key_mit_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@



                                                                [#context[0][key_mit_s]["name"]#]

                                                        @endif@

                                                   @endif@
                                                @endfor@
                                            @endif@
                                    @endfor@
                                    </td>

                            </tr>



         @endfor@

        </table>
</div>
