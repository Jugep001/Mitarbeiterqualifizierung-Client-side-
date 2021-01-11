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
            <br>
            <br>
            <a href="/switch?listForm=Pflege_Weiter" role="button">

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

    <ul>
        % for key_s in data_o:


        <div>
            <a href="/edit?id_spl=${key_s}">bearbeiten</a>
            <a href="/delete/${key_s}" class='clDelete'> löschen</a>

                    <ul class="">

                            <li>Name:${data_o[key_s]["name"]}</li>
                            <li>Vorname:${data_o[key_s]["vorname"]}</li>
                            <li>Akademischer Grad:${data_o[key_s]["akademischer_grad"]}</li>
                            <li>Tätigkeit:${data_o[key_s]["taetigkeit"]}</li>
                            % for key_weiter in data_o[key_s]["Weiterbildung"]:

                                % if data_o[key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil" or data_o[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet":

                                    <li><b>Weiterbildung</b>:${data_o[key_s]["Weiterbildung"][key_weiter]["bezeichnung"]}</li>
                                    <li>Weiterbildung(status):${data_o[key_s]["Weiterbildung"][key_weiter]["status"]}</li>
                                    % if data_o[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet":
                                        <li><b>Zertifikat:</b></li>
                                        <li>Bezeichnung:${data_o[key_s]["Weiterbildung"][key_weiter]["bezeichnung_zerti"]}</li>
                                        <li><b>Qualifikation:</b></li>
                                            % for Quali_elem in data_o[key_s]["Weiterbildung"][key_weiter]["Qualifikation"]:
                                                <li>
                                                    Bezeichnung:${data_o[key_s]["Weiterbildung"][key_weiter]["Qualifikation"][Quali_elem]["bezeichnung"]}
                                                </li>
                                            % endfor
                                    % endif
                                % endif
                            % endfor
                    </ul>


        </div>
        % endfor
    </ul>
            <div>
                <a href="/add" role="button">erfassen</a>
                <a href="/switch?listForm=Pflege_Mit" role="button">anzeigen</a>
            </div>
        </div>

    </div>
</body>
 </html>