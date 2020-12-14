## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script type='text/javascript' src='Mitarbeiterqualifizierung.js'></script>
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
            <a href="/switch?listForm=Startseite">
                <button>
                    Startseite
                </button>
            </a>
        </div>
        <div class="item3">
            <a href="/switch?listForm=Pflege_Mit">
                <button>
                    Pflege Mitarbeiterdaten
                </button>
            </a>
            <a href="/switch?listForm=Pflege_Weiter">
                <br>
                <button>
                    Pflege Weiterbildungen
                </button>
            </a>
        </div>
        <div class="item4">
             Teilnahme
             <ul class="a">
                <li>
                    <a href="/switch?listForm=Sichtweise_Mit">
                        <button>
                            Sichtweise Mitarbeiter
                        </button>
                    </a>
                </li>
                <li>
                    <a href="/switch?listForm=Sichtweise_Weiter">
                        <button>
                            Sichtweise Weiterbildungen
                        </button>
                    </a>
                </li>
             </ul>
        </div>
        <div class="item5">
            <div class="text">
            Auswertungen
                <ul>
                    <li>
                        <a href="/switch?listForm=Mitarbeiter">
                            <button>
                                Mitarbeiter
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="/switch?listForm=Weiterbildungen">
                            <button>
                                Weiterbildungen
                            </button>
                        </a>
                    </li>
                    <li>
                        <a href="/switch?listForm=Zertifikate">
                            <button>
                                Zertifikate
                            </button>
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
                    <th>Name des Mitarbeiters</th>
                    <th>Bezeichnung</th>
                </tr>
             % for key_s in data_o:








                        % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is dict:


                                % if data_o[key_s]["Weiterbildung"]["status"] == "erfolgreich beendet":
                                    <tr>
                                        <td>${data_o[key_s]["name"]}</td>
                                        <td>${data_o[key_s]["Weiterbildung"]["bezeichnung_zerti"]}</td>
                                    </tr>
                                % endif

                         % endif
                         % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is list :


                            % for i in range(len(data_o[key_s]["Weiterbildung"])):

                                    % if data_o[key_s]["Weiterbildung"][i]["status"] == "erfolgreich beendet":
                                        <tr>
                                            <td>${data_o[key_s]["name"]}</td>
                                            <td>${data_o[key_s]["Weiterbildung"][i]["bezeichnung_zerti"]}</td>
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