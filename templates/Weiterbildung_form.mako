## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script src='Mitarbeiterqualifizierung.js'></script>
    <link rel="stylesheet" href="/Mitarbeiterqualifizierung.css">
    <style>
        @import "Mitarbeiterqualifizierung.css";
    </style>
</head>
<body>
    <div class="selektor">
    <form id="idWTForm" action="/save_Weiterbildung" method="POST">
            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
    <div class="">
        <h1>Weiterbildung</h1>
        <div class="">

            <input type="hidden"
                value="angemeldet"
                id="status_spa"
                name="status_spa"/>
        </div>
        <div class="">
            <label for="bezeichnung_spa">Name</label>
            <input type="text"
                value="${data_o["bezeichnung"]}"
                id="bezeichnung_spa"
                name="bezeichnung_spa" required />
        </div>
        <div class="">
            <label for="von_spa">von</label>
            <input type="date"
                value="${data_o["von"]}"
                id="von_spa"
                name="von_spa" required />
        </div>
        <div class="">
            <label for="bis_spa">bis</label>
            <input type="date"
                value="${data_o["bis"]}"
                id="bis_spa"
                name="bis_spa" required />
        </div>
        <div class="">
            <label for="beschreibung_spa">Beschreibung</label>
            <input type="text"
                value="${data_o["beschreibung"]}"
                id="beschreibung_spa"
                name="beschreibung_spa" required />
        </div>
        <div class="">
            <label for="max_teilnehmer_spa">max_teilnehmer</label>
            <input type="number"
                value="${data_o["max_teilnehmer"]}"
                id="max_teilnehmer_spa"
                name="max_teilnehmer_spa" required />
        </div>
        <div class="">
            <label for="min_teilnehmer_spa">min_teilnehmer</label>
            <input type="number"
                value="${data_o["min_teilnehmer"]}"
                id="min_teilnehmer_spa"
                name="min_teilnehmer_spa" required />
        </div>
        <h2>Zertifikat</h2>
        <div class="">
            <label for="bezeichnung_zerti_spa">Bezeichnung</label>
            <input type="text"
                value="${data_o["bezeichnung_zerti"]}"
                id="bezeichnung_zerti_spa"
                name="bezeichnung_zerti_spa"/>
        </div>
        <div class="">
            <label for="beschreibung_zerti_spa">Beschreibung</label>
            <input type="text"
                value="${data_o["beschreibung_zerti"]}"
                id="beschreibung_zerti_spa"
                name="beschreibung_zerti_spa"/>
        </div>
        <div class="">
            <label for="berechtigt_zu_spa">berechtigt zu</label>
            <input type="text"
                value="${data_o["berechtigt_zu"]}"
                id="berechtigt_zu_spa"
                name="berechtigt_zu_spa"/>
        </div>

        <h2>Qualifikation</h2>

        % if data_o["Qualifikation"] == "":
          <div id="inputs_container">
            <div id="inputs_div">


                <input type="hidden" value="${key_quali_s}" id="id_quali_spa" name="id_quali_spa" />
                <label for="bezeichnung_quali_spa">Bezeichnung</label>
                <input type="text"
                    value=""
                    id="bezeichnung_quali_spa"
                    name="bezeichnung_quali_spa" required />

                <label for="beschreibung_quali_spa">Beschreibung</label>
                <input type="text"
                    value=""
                    id="beschreibung_quali_spa"
                    name="beschreibung_quali_spa" required />


            </div>
        </div>
        % endif
        % if data_o["Qualifikation"] != "":
            % for Quali_elem in data_o["Qualifikation"]:
            <div id="inputs_container">
                <div id="inputs_div">

                    <a href="/delete_quali?id_weiterbildung=${key_s}&id_quali=${Quali_elem}" class='clDelete' role="button"> löschen</a>
                    <input type="hidden" value="${key_quali_s}" id="id_quali_spa" name="id_quali_spa" />
                    <label for="bezeichnung_quali_spa">Bezeichnung</label>
                    <input type="text"
                        value="${data_o["Qualifikation"][Quali_elem]["bezeichnung"]}"
                        id="bezeichnung_quali_spa"
                        name="bezeichnung_quali_spa" required />

                    <label for="beschreibung_quali_spa">Beschreibung</label>
                    <input type="text"
                        value="${data_o["Qualifikation"][Quali_elem]["beschreibung"]}"
                        id="beschreibung_quali_spa"
                        name="beschreibung_quali_spa" required />


                </div>
            </div>
            % endfor
        % endif
        <div>
            <input type="button" value="Qualifikation hinzufügen" onclick="addInput()">
            <input type="submit" value="Speichern" class=""/>
        </div>
    </div>

    </form>
        <div>

            <a href="/switch?listForm=${listForm}" role="button">Abbrechen</a>

        </div>

    </div>
 </body>
 </html>