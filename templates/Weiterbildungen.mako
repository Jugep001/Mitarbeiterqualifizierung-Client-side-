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
         % for key_weiter_s in data_weiter_o:
                                <tr>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["von"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bis"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["max_teilnehmer"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["min_teilnehmer"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung_zerti"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung_zerti"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["berechtigt_zu"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung_quali"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung_quali"]}</td>
                                </tr>


         % for key_s in data_o:
                         % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is dict:

                             % if data_o[key_s]["Weiterbildung"]["bezeichnung"] == data_weiter_o[key_weiter_s]["bezeichnung"] and data_o[key_s]["Weiterbildung"]["status"] == "erfolgreich beendet":
                                <tr>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["von"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bis"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["max_teilnehmer"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["min_teilnehmer"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung_zerti"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung_zerti"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["berechtigt_zu"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["bezeichnung_quali"]}</td>
                                    <td>${data_weiter_o[key_weiter_s]["beschreibung_quali"]}</td>
                                    <td>${data_o[key_s]["name"]}</td>
                                </tr>


                             % endif
                         % endif
                         % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is list :


                            % for i in range(len(data_o[key_s]["Weiterbildung"])):

                                % if data_o[key_s]["Weiterbildung"][i]["bezeichnung"] == data_weiter_o[key_weiter_s]["bezeichnung"]:

                                    % if data_o[key_s]["Weiterbildung"][i]["status"] == "erfolgreich beendet":
                                    <tr>
                                        <td>${data_weiter_o[key_weiter_s]["bezeichnung"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["von"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["bis"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["beschreibung"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["max_teilnehmer"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["min_teilnehmer"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["bezeichnung_zerti"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["beschreibung_zerti"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["berechtigt_zu"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["bezeichnung_quali"]}</td>
                                        <td>${data_weiter_o[key_weiter_s]["beschreibung_quali"]}</td>
                                        <td>${data_o[key_s]["name"]}</td>
                                    </tr>


                                    % endif
                                % endif

                            % endfor

                         % endif
         % endfor
         % endfor

        </table>
        </div>

    </div>
</body>
 </html>