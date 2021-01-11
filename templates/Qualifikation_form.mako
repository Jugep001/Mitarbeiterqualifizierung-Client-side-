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
    <form id="idWTForm" action="/save_Qualifikation" method="POST">
            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
            <input type="hidden" value="${key_weiter_s}" id="id_weiter_spa" name="id_weiter_spa" />
    <div class="">

        <h1>Qualifikation</h1>
        <div id="inputs_container">
            <div id="inputs_div">
                <label for="bezeichnung_quali">Bezeichnung</label>
                <input type="text"
                    value="${data_o["bezeichnung_quali"]}"
                    id="bezeichnung_quali"
                    name="bezeichnung_quali" required />

                <label for="beschreibung_quali">Beschreibung</label>
                <input type="text"
                    value="${data_o["beschreibung_quali"]}"
                    id="beschreibung_quali"
                    name="beschreibung_quali" required />
            </div>
        </div>
        <div>
            <input type="submit" value="Speichern" class=""/>
        </div>
    </div>

    </form>
        <div>

            <a href="/add?listForm=Pflege_Weiter&Quali_Check=False&Weiterbildung_id=${key_weiter_s}" role="button">Abbrechen</a>

        </div>

    </div>
 </body>
 </html>