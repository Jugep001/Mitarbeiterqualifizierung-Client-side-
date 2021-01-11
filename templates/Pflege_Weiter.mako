## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script src='Mitarbeiterqualifizierung.js'></script>
    <link rel="stylesheet" href="/Mitarbeiterqualifizierung.css">
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
                    <div>
                        <a href="/edit?id_spl=${key_s}" role="button"> bearbeiten </a>
                        <a href="/delete/${key_s}" class='clDelete' role="button"> löschen</a>
                    </div>

                    <ul class="">

                            <li>bezeichnung:${data_o[key_s]["bezeichnung"]}</li>
                            <li>von:${data_o[key_s]["von"]}</li>
                            <li>bis:${data_o[key_s]["bis"]}</li>
                            <li>beschreibung:${data_o[key_s]["beschreibung"]}</li>
                            <li>max_teilnehmer:${data_o[key_s]["max_teilnehmer"]}</li>
                            <li>min_teilnehmer:${data_o[key_s]["min_teilnehmer"]}</li>

                    </ul>


        </div>
        % endfor
    </ul>
            <div>
                <a href="/add" role="button">erfassen</a>
                <a href="/switch?listForm=Pflege_Weiter_Detail" role="button">anzeigen</a>
            </div>
        </div>

    </div>
</body>
 </html>