<div class="item7">
        <table>
                <tr>
                    <th>Weiterbildung(bezeichnung)</th>
                    <th>Name(Teilnehmer)</th>
                    <th>Status(Teilnehmer)</th>
                    <th>Wähle Status</th>

                </tr>




                @for key_s in context[1]@
                <tr id="#key_s#" onclick="getTableID(this.id, 'Mitarbeiter')">



                    @if context[1][key_s]["Weiterbildung"]@
                        @for key_weiter in context[1][key_s]["Weiterbildung"]@

                            @if context[1][key_s]["Weiterbildung"][key_weiter]["status"] == "angemeldet" || context[1][key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil"@
                                @if context[0]["bezeichnung"] == context[1][key_s]["Weiterbildung"][key_weiter]["bezeichnung"]@
                                    <td>#context[0]["bezeichnung"]# </td>
                                    <td>#context[1][key_s]["name"]#</td>
                                    <td>#context[1][key_s]["Weiterbildung"][key_weiter]["status"]#</td>
                                    <td>
                                            <select name="status_spa" id="#key_s#_status">
                                            <option value="nimmt teil">nimmt teil</option>

                                                        @if context[0]["bezeichnung"] == context[1][key_s]["Weiterbildung"][key_weiter]["bezeichnung"]@
                                                            @if context[1][key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil"@

                                                                <option value="abgebrochen">abgebrochen</option>
                                                                <option value="nicht erfolgreich beendet">nicht erfolgreich beendet</option>
                                                                <option value="erfolgreich beendet">erfolgreich beendet</option>

                                                            @endif@
                                                        @endif@

                                            </select>
                                    </td>
                                    <td>
                                        <form id="#key_s#_form">

                                            <input type="hidden" value="" id="id_spa" name="id_spa" />
                                            <input type="hidden" value="#key_weiter#" id="id_weiter_spa" name="id_weiter_spa" />
                                            <input type="hidden" value="#context[1][key_s]['Weiterbildung'][key_weiter]['bezeichnung']#" id="bezeichnung_spa" name="bezeichnung_spa" />
                                            <input type="hidden" value="#context[1][key_s]['name']#" id="name_spa" name="name_spa"/>
                                            <input type="hidden" value="#context[1][key_s]['vorname']#" id="vorname_spa" name="vorname_spa"/>
                                            <input type="hidden" value="#context[1][key_s]['akademischer_grad']#" id="ak_grad_spa" name="ak_grad_spa"/>
                                            <input type="hidden" value="#context[1][key_s]['taetigkeit']#" id="taetigkeit_spa" name="taetigkeit_spa"/>

                                        </form>
                                    </td>
                                @endif@
                            @endif@
                        @endfor@
                    @endif@


                @endfor@
            </tr>
        </table>
        <div class="abbrechenDiv">

            <a href=## id="StatusSpeichern" data-action="SichtWeiterForm" role="button">Speichern</a>
            <a href=## data-action="SichtWeiter" role="button">Abbrechen</a>

        </div>

</div>


