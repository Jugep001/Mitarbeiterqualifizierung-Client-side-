## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Web-Teams</title>
    <meta charset="UTF-8" />
    <link href="Mitarbeiterqualifizierung.css" rel="stylesheet" type="text/css"/>
    <!--<style>
    @import "/webteams.css";
    </style>-->
</head>
<body>
    <form id="idWTForm" action="/save_Weiterbildung" method="POST">
            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
    <div class="">
        <div class="">
            <label for="bezeichnung_spa">Name</label>
            <input type="text"
                value="${data_o["bezeichnung"]}"
                id="bezeichnung_spa"
                name="bezeichnung_spa" required />
        </div>
        <div class="">
            <label for="von_spa">Vorname</label>
            <input type="date"
                value="${data_o["von"]}"
                id="von_spa"
                name="von_spa" required />
        </div>
        <div class="">
            <label for="bis_spa">Akademischer Grad</label>
            <input type="date"
                value="${data_o["bis"]}"
                id="bis_spa"
                name="bis_spa" required />
        </div>
        <div class="">
            <label for="beschreibung_spa">Tätigkeit</label>
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

        <div>

            <input type="submit" value="Speichern" class=""/>
        </div>
    </div>

    </form>
        <div>

            <a href="/switch?listForm=${listForm}"> <button class="">Abbrechen</button></a>

        </div>
 </body>
 </html>