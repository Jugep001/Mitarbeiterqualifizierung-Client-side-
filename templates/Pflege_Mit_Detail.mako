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
            <a href="/">
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

    <ul>
        % for key_s in data_o:


        <li>:
            <a href="/edit/${key_s}">bearbeiten</a>
            <a href="/delete/${key_s}" class='clDelete'> löschen</a>

                    <ul class="">

                            <li>Name:${data_o[key_s]["name"]}</li>
                            <li>Vorname:${data_o[key_s]["vorname"]}</li>
                            <li>Akademischer Grad:${data_o[key_s]["akademischer_grad"]}</li>
                            <li>Tätigkeit:${data_o[key_s]["taetigkeit"]}</li>
                        % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is dict:

                                <li>Weiterbildung:${data_o[key_s]["Weiterbildung"]["bezeichnung"]}</li>
                                <li>Weiterbildung(status):${data_o[key_s]["Weiterbildung"]["status"]}</li>

                         % endif
                         % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is list :


                            % for i in range(len(data_o[key_s]["Weiterbildung"])):
                                <li>Weiterbildung:${data_o[key_s]["Weiterbildung"][i]["bezeichnung"]}</li>
                                <li>Weiterbildung(status):${data_o[key_s]["Weiterbildung"][i]["status"]}</li>
                            % endfor

                         % endif
                            <li>Qualifikation:${data_o[key_s]["Qualifikation"]}</li>
                            <li>Zertifikat:${data_o[key_s]["Zertifikat"]}</li>

                    </ul>


        </li>
        % endfor
    </ul>
            <div>
                <a href="/add"><button class="">erfassen</button></a>
                <a href="/switch?listForm=Pflege_Mit"><button>anzeigen</button></a>
            </div>
        </div>
    </div>
</body>
 </html>