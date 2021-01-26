<div class="item7">
    <ul>
        @for key_s in context@
        <div>
            <a href="/edit?id_spl=${key_s}" role="button">bearbeiten</a>
            <a href="/delete/${key_s}" class='clDelete' role="button"> löschen</a>

                    <ul class="">

                                @if(context[key_s].hasOwnProperty("bezeichnung"))@
                                    <li>bezeichnung:#context[key_s]["bezeichnung"]#</li>
                                    <li>von:#context[key_s]["von"]#</li>
                                    <li>bis:#context[key_s]["bis"]#</li>
                                    <li>beschreibung:#context[key_s]["beschreibung"]#</li>
                                    <li>max_teilnehmer:#context[key_s]["max_teilnehmer"]#</li>
                                    <li>min_teilnehmer:#context[key_s]["min_teilnehmer"]#</li>
                                @endif@

                            <li>Teilnehmer:</li>

                                    @if(context[key_s].hasOwnProperty("Weiterbildung"))@
                                    @if context[key_s]["Weiterbildung"]@
                                        @for key_weiter in context[key_s]["Weiterbildung"]@
                                            @if context[key_s]["Weiterbildung"][key_weiter]["bezeichnung"] == context[key_s]["bezeichnung"]@
                                                @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil"@

                                                    <ul>Name:#context[key_s]["name"]#</ul>


                                                @endif@
                                            @endif@
                                        @endfor@

                                    @endif@
                                    @endif@

                            <li>Zertifikat:</li>
                                    @if(context[key_s].hasOwnProperty("bezeichnung"))@
                                                    <ul>bezeichnung:#context[key_s]["bezeichnung_zerti"]#</ul>
                                                    <ul>beschreibung:#context[key_s]["beschreibung_zerti"]#</ul>
                                                    <ul>berechtigt zu:#context[key_s]["berechtigt_zu"]#</ul>
                                    @endif@
                            <li>Qualifikation:</li>
                                    @for Quali_elem in context[key_s]["Qualifikation"]@
                                                    <ul>Bezeichnung:#context[key_s]["Qualifikation"][Quali_elem]["bezeichnung"]#</ul>
                                                    <ul>Beschreibung:#context[key_s]["Qualifikation"][Quali_elem]["beschreibung"]#</ul>
                                    @endfor@

                    </ul>


        </div>

        @endfor@
    </ul>
            <div>
                <a href="/add" role="button">erfassen</a>
                <a href="##" data-action="PflegeWeiter" role="button">anzeigen</a>
            </div>
</div>
