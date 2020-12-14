## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script src='Mitarbeiterqualifizierung.js'></script>
    <style>
        @import "Mitarbeiterqualifizierung.css";
    </style>
</head>
<body>
    <div class="grid-container">
        <div class="item1">
            <div class="flexbox">
                <div class="box-01">
                    Mitarbeiterqualifizierung<br>
                    Version XX.XXXX
                </div>
                <div class="box-02">
                    Gruppe / Team angeben
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
            Leer?
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


                        % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is dict:


                                <tr>
                                <td>${data_o[key_s]["name"]}</td>
                                <td>${data_o[key_s]["vorname"]}</td>
                                <td>${data_o[key_s]["akademischer_grad"]}</td>
                                <td>${data_o[key_s]["taetigkeit"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"]["bezeichnung"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"]["von"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"]["bis"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"]["status"]}</td>
                                </tr>

                         % endif
                         % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is list :


                            % for i in range(len(data_o[key_s]["Weiterbildung"])):
                                <tr>

                                <td>${data_o[key_s]["name"]}</td>
                                <td>${data_o[key_s]["vorname"]}</td>
                                <td>${data_o[key_s]["akademischer_grad"]}</td>
                                <td>${data_o[key_s]["taetigkeit"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"][i]["bezeichnung"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"][i]["von"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"][i]["bis"]}</td>
                                <td>${data_o[key_s]["Weiterbildung"][i]["status"]}</td>
                                </tr>
                            % endfor

                         % endif


        % endfor

        </table>

        </div>
    </div>
</body>
 </html>