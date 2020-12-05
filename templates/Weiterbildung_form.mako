## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <script type='text/javascript' src='Mitarbeiterqualifizierung.js'></script>
    <link href="Mitarbeiterqualifizierung.css" rel="stylesheet" type="text/css"/>


</head>
<body>
    <form id="idWTForm" action="/save_Weiterbildung" method="POST">
            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
    <div class="">
        <h1>Weiterbildung</h1>
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
                name="bezeichnung_zerti_spa" required />
        </div>
        <div class="">
            <label for="beschreibung_zerti_spa">Beschreibung</label>
            <input type="text"
                value="${data_o["beschreibung_zerti"]}"
                id="beschreibung_zerti_spa"
                name="beschreibung_zerti_spa" required />
        </div>
        <div class="">
            <label for="berechtigt_zu_spa">berechtigt zu</label>
            <input type="text"
                value="${data_o["berechtigt_zu"]}"
                id="berechtigt_zu_spa"
                name="berechtigt_zu_spa" required />
        </div>
        <h2>Qualifikation</h2>
        <div class="">
            <label for="bezeichnung_quali_spa">Bezeichnung</label>
            <input type="text"
                value="${data_o["bezeichnung_quali"]}"
                id="bezeichnung_quali_spa"
                name="bezeichnung_quali_spa" required />
        </div>
        <div class="">
            <label for="beschreibung_quali_spa">Beschreibung</label>
            <input type="text"
                value="${data_o["beschreibung_quali"]}"
                id="beschreibung_quali_spa"
                name="beschreibung_quali_spa" required />
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