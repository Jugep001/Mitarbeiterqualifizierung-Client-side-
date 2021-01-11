## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script src='Mitarbeiterqualifizierung.js'></script>
    <style>
        @import "Mitarbeiterqualifizierung.css";
        @import "edit/Mitarbeiterqualifizierung.css";
    </style>
</head>
<body>
<div class="selektor">
    <div class="grid-container">
        <div class="item1">
            <div class="flexbox">
                <div class="box-01">
                    Mitarbeiterqualifizierung<br>
                    Version 1.0
                </div>
                <div class="box-02">
                    Julian Geppert/Benjamin Freukes
                </div>
            </div>
        </div>
        <div class="item2">
            <a href="/switch?listForm=Startseite" role="button">
                Startseite
            </a>
        </div>
        <div class="item3">
            <a href="/switch?listForm=Pflege_Mit" role="button">

                    Pflege Mitarbeiterdaten

            </a>
            <a href="/switch?listForm=Pflege_Weiter" role="button">
                <br>

                    Pflege Weiterbildungen

            </a>
        </div>
        <div class="item4">
             Teilnahme
             <ul class="a">
                <li>
                    <a href="/switch?listForm=Sichtweise_Mit" role="button">

                            Sichtweise Mitarbeiter

                    </a>
                </li>
                <li>
                    <a href="/switch?listForm=Sichtweise_Weiter" role="button">

                            Sichtweise Weiterbildungen

                    </a>
                </li>
             </ul>
        </div>
        <div class="item5">
            <div class="text">
            Auswertungen
                <ul>
                    <li>
                        <a href="/switch?listForm=Mitarbeiter" role="button">

                                Mitarbeiter

                        </a>
                    </li>
                    <li>
                        <a href="/switch?listForm=Weiterbildungen" role="button">

                                Weiterbildungen

                        </a>
                    </li>
                    <li>
                        <a href="/switch?listForm=Zertifikate" role="button">

                                Zertifikate

                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="item6">

        </div>
        <div class="item7">

                <ul class="">
                    <li>Weiterbildung: ${data_weiter[key_weiter_s]["bezeichnung"]} </li>
                    <li>von: ${data_weiter[key_weiter_s]["von"]}</li>
                    <li>bis: ${data_weiter[key_weiter_s]["bis"]}</li>
                    <li>beschreibung: ${data_weiter[key_weiter_s]["beschreibung"]}</li>
                    <li>max_teilnehmer: ${data_weiter[key_weiter_s]["max_teilnehmer"]}</li>
                    <li>min_teilnehmer: ${data_weiter[key_weiter_s]["min_teilnehmer"]}</li>
                    <li>bezeichnung: ${data_weiter[key_weiter_s]["bezeichnung_zerti"]}</li>
                    <li>beschreibung: ${data_weiter[key_weiter_s]["beschreibung_zerti"]}</li>
                    <li>berechtigt zu: ${data_weiter[key_weiter_s]["berechtigt_zu"]}</li>
                    <li><b>Teilnehmer:</b></li>

                % for key_s in data_o:
                    % if data_o[key_s]["Weiterbildung"]:
                        % for key_weiter in data_o[key_s]["Weiterbildung"]:

                            % if data_o[key_s]["Weiterbildung"][key_weiter]["status"] == "angemeldet" or data_o[key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil":
                                % if data_weiter[key_weiter_s]["bezeichnung"] == data_o[key_s]["Weiterbildung"][key_weiter]["bezeichnung"]:

                                    <li>Name:${data_o[key_s]["name"]}</li>
                                    <li>Weiterbildung:${data_o[key_s]["Weiterbildung"][key_weiter_s]["status"]}</li>
                                        <form id="idWTForm" action="/save_Mitarbeiter" method="POST">
                                            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
                                            <input type="hidden" value="${key_weiter}" id="id_weiter_spa" name="id_weiter_spa" />
                                            <input type="hidden" value="${data_o[key_s]["Weiterbildung"][key_weiter_s]["bezeichnung"]}" id="bezeichnung_spa" name="bezeichnung_spa" />
                                            <input type="hidden" value="${data_o[key_s]["name"]}" id="name_spa" name="name_spa"/>
                                            <input type="hidden" value="${data_o[key_s]["vorname"]}" id="vorname_spa" name="vorname_spa"/>
                                            <input type="hidden" value="${data_o[key_s]["akademischer_grad"]}" id="ak_grad_spa" name="ak_grad_spa"/>
                                            <input type="hidden" value="${data_o[key_s]["taetigkeit"]}" id="taetigkeit_spa" name="taetigkeit_spa"/>
                                    <label for="status_spa">Wähle Status:</label>

                                    <select name="status_spa" id="status_spa">
                                        <option value="nimmt teil">nimmt teil</option>
                                        % if data_o[key_s]["Weiterbildung"][key_weiter_s]["status"] == "nimmt teil":

                                            <option value="abgebrochen">abgebrochen</option>
                                            <option value="nicht erfolgreich beendet">nicht erfolgreich beendet</option>
                                            <option value="erfolgreich beendet">erfolgreich beendet</option>
                                        % endif
                                    </select>
                                <div>

                                    <input type="submit" value="Speichern" class=""/>

                                </div>
                                        </form>
                                % endif
                            % endif
                        % endfor
                    % endif


                % endfor
                </ul>



        </div>
    </div>

</div>
</body>
 </html>