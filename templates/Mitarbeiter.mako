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
                            <th><b>Name</b></th>
                            <th>Vorname</th>
                            <th>Akademischer Grad</th>
                            <th>Tätigkeit</th>
                            <th>Weiterbildung(bezeichnung)</th>
                            <th>von</th>
                            <th>bis</th>
                            <th>Weiterbildung(status)</th>
            </tr>
        % for key_s in data_o:

                        % if not data_o[key_s]["Weiterbildung"]:

                        <tr>

                        <td>${data_o[key_s]["name"]}</td>
                        <td>${data_o[key_s]["vorname"]}</td>
                        <td>${data_o[key_s]["akademischer_grad"]}</td>
                        <td>${data_o[key_s]["taetigkeit"]}</td>

                        </tr>
                        % endif

                         % if data_o[key_s]["Weiterbildung"]:

                                % for key_weiter_s in data_o[key_s]["Weiterbildung"]:
                                  % if data_o[key_s]["Weiterbildung"][key_weiter_s]["bezeichnung"] == data_weiter_o[key_weiter_s]["bezeichnung"]:
                                        <tr>
                                            <td>${data_o[key_s]["name"]}</td>
                                            <td>${data_o[key_s]["vorname"]}</td>
                                            <td>${data_o[key_s]["akademischer_grad"]}</td>
                                            <td>${data_o[key_s]["taetigkeit"]}</td>
                                            <td>${data_o[key_s]["Weiterbildung"][key_weiter_s]["bezeichnung"]}</td>
                                            <td>${data_o[key_s]["Weiterbildung"][key_weiter_s]["von"]}</td>
                                            <td>${data_o[key_s]["Weiterbildung"][key_weiter_s]["bis"]}</td>
                                            <td>${data_o[key_s]["Weiterbildung"][key_weiter_s]["status"]}</td>
                                        </tr>
                                  % endif

                                % endfor

                         % endif



        % endfor

        </table>

        </div>

    </div>
</body>
 </html>