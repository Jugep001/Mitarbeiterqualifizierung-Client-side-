## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <style>
        @import "Mitarbeiterqualifizierung.css";
        @import "edit/Mitarbeiterqualifizierung.css";
    </style>
</head>


<body>
    <div class="selektor">
    <form id="idWTForm" action="/save_Mitarbeiter" method="POST">
            <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
    <div class="">
        <div class="">
            <label for="name_spa">Name</label>
            <input type="text"
                value="${data_o["name"]}"
                id="name_spa"
                name="name_spa" required />
        </div>
        <div class="">
            <label for="vorname_spa">Vorname</label>
            <input type="text"
                value="${data_o["vorname"]}"
                id="vorname_spa"
                name="vorname_spa" required />
        </div>
        <div class="">
            <label for="ak_grad_spa">Akademischer Grad</label>
            <input type="text"
                value="${data_o["akademischer_grad"]}"
                id="ak_grad_spa"
                name="ak_grad_spa" required />
        </div>
        <div class="">
            <label for="taetigkeit_spa">Tätigkeit</label>
            <input type="text"
                value="${data_o["taetigkeit"]}"
                id="taetigkeit_spa"
                name="taetigkeit_spa" required />
        </div>

        <div>

            <input type="submit" value="Speichern" role="button" id="speichern"/>
        </div>
    </div>

    </form>
        <div class="abbrechenDiv">

            <a href="/switch?listForm=${listForm}" role="button">Abbrechen</a>

        </div>

    </div>
 </body>
 </html>