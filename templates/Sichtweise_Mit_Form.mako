<div class="item7" >


        <table>

            <tr>
                <th>Name</th>
                <th>Vorname</th>
                <th>Akademischer Grad</th>
                <th>Tätigkeit</th>
                <th>Weiterbildung(bezeichnung)</th>
                <th>Weiterbildung(status)</th>
                <th>stornieren</th>

            </tr>
            @for key_weiter in context[0]["Weiterbildung"]@
            @if context[0]["Weiterbildung"][key_weiter]["status"] == "angemeldet"@
            <tr id="#key_weiter#" onclick="getTableID(this.id, 'Weiterbildung')">
                        <td>#context[0]["name"]#</td>
                        <td>#context[0]["vorname"]#</td>
                        <td>#context[0]["akademischer_grad"]#</td>
                        <td>#context[0]["taetigkeit"]#</td>







                                <td>#context[0]["Weiterbildung"][key_weiter]["bezeichnung"]#</td>
                                <td>#context[0]["Weiterbildung"][key_weiter]["status"]#</td>


                                    @if context[0]["Weiterbildung"][key_weiter]["bezeichnung"] == context[1][key_weiter]["bezeichnung"]@

                                        <td>
                                        <form id="#key_weiter#_form">
                                                <input type="hidden" value="" id="id_spa" name="id_spa" />
                                                <input type="hidden" value="#context[0]['Weiterbildung'][key_weiter]['bezeichnung']#" id="bezeichnung_spa" name="bezeichnung_spa" />
                                                <input type="hidden" value="#key_weiter#" id="id_weiter_spa" name="id_weiter_spa"/>
                                                <input type="hidden" value="storniert" id="status_spa" name="status_spa" />
                                                <input type="hidden" value="#context[0]['name']#" id="name_spa" name="name_spa"/>
                                                <input type="hidden" value="#context[0]['vorname']#" id="vorname_spa" name="vorname_spa"/>
                                                <input type="hidden" value="#context[0]['akademischer_grad']#" id="ak_grad_spa" name="ak_grad_spa"/>
                                                <input type="hidden" value="#context[0]['taetigkeit']#" id="taetigkeit_spa" name="taetigkeit_spa"/>
                                        </form>
                                        </td>

                                    @endif@





            </tr>
            @endif@
            @endfor@
        </table>
        <form id="idForm3">
            <input type="hidden" value="" id="id_spa" name="id_spa" />
        <div>
            <div class="">
            <input type="hidden"
                value="#context[0]['name']#"
                id="name_spa"
                name="name_spa"/>
        </div>
        <div class="">
            <input type="hidden"
                value="#context[0]['vorname']#"
                id="vorname_spa"
                name="vorname_spa"/>
        </div>
        <div class="">
            <input type="hidden"
                value="#context[0]['akademischer_grad']#"
                id="ak_grad_spa"
                name="ak_grad_spa"/>
        </div>
        <div class="">
            <input type="hidden"
                value="#context[0]['taetigkeit']#"
                id="taetigkeit_spa"
                name="taetigkeit_spa"/>
        </div>
        <div id="create_check">

        </div>


        </div>
        </form>
        <div class="abbrechenDiv">
            <a href=## id="SpeichernWeiter" data-action="SichtMitForm" role="button">Speichern</a>
            <a href=## id="StornierenWeiter" data-action="SichtMitForm" role="button">Stornieren</a>
            <a href=## data-action="SichtMit" role="button">Abbrechen</a>

        </div>
</div>
