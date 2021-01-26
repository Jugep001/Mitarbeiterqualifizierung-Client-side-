<div class="item7">

    <ul>
        @for key_s in context@


        <div>
            <a href="/edit?id_spl=${key_s}">bearbeiten</a>
            <a href="/delete/${key_s}" class='clDelete'> löschen</a>

                    <ul class="">

                            <li>Name:#context[key_s]["name"]#</li>
                            <li>Vorname:#context[key_s]["vorname"]#</li>
                            <li>Akademischer Grad:#context[key_s]["akademischer_grad"]#</li>
                            <li>Tätigkeit:#context[key_s]["taetigkeit"]#</li>
                            @for key_weiter in context[key_s]["Weiterbildung"]@

                                @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil" || context[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@

                                    <li><b>Weiterbildung</b>:#context[key_s]["Weiterbildung"][key_weiter]["bezeichnung"]#</li>
                                    <li>Weiterbildung(status):#context[key_s]["Weiterbildung"][key_weiter]["status"]#</li>
                                    @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@
                                        <li><b>Zertifikat:</b></li>
                                        <li>Bezeichnung:#context[key_s]["Weiterbildung"][key_weiter]["bezeichnung_zerti"]#</li>
                                        <li><b>Qualifikation:</b></li>
                                            @for Quali_elem in context[key_s]["Weiterbildung"][key_weiter]["Qualifikation"]@
                                                <li>
                                                    Bezeichnung:#context[key_s]["Weiterbildung"][key_weiter]["Qualifikation"][Quali_elem]["bezeichnung"]#
                                                </li>
                                            @endfor@
                                    @endif@
                                @endif@
                            @endfor@
                    </ul>


        </div>
        @endfor@
    </ul>
            <div>
                <a href="/add" role="button">erfassen</a>
                <a href="##" data-action="PflegeMit" role="button">zurück</a>
            </div>
        </div>
