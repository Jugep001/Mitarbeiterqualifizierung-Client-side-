## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Web-Teams</title>
    <meta charset="UTF-8" />
    <script type='text/javascript' src='webteams.js'></script>
    <link href="./webteams.css" rel="stylesheet" type="text/css"/>
    <!--<style>
    @import "/webteams.css";
    </style>-->

</head>
<body>
    <noscript>
        Javascript ist deaktiviert.
    </noscript>
    <div class="container-2">
    <table>
        <!-- step 2,3 -->
        <tr>
            <th>Name (1)</th><th>Vorname (1)</th><th>Matr.-Nr. (1)</th><th>Semesteranzahl (1)</th>
            <th>Name (2)</th><th>Vorname (2)</th><th>Matr.-Nr. (2)</th><th>Semesteranzahl (2)</th>
            <th>Aktion</th>
        </tr>


    % for key_s in data_o:
        <tr>

            <td>${data_o[key_s][0]}</td>
            <td>${data_o[key_s][1]}</td>
            <td>${data_o[key_s][2]}</td>
            <td>${data_o[key_s][3]}</td>
            <td>${data_o[key_s][4]}</td>
            <td>${data_o[key_s][5]}</td>
            <td>${data_o[key_s][6]}</td>
            <td>${data_o[key_s][7]}</td>
        </div>
            <td>

                <a href="/edit/${key_s}">bearbeiten</a>
                <!-- step 5 -->
                <a href="/delete/${key_s}" class= 'clDelete'> löschen</a>
                <!-- step 5 -->
            </td>

        </tr>
    % endfor
       <!-- step 2,3 -->
    </table>

    <div>
        <a href="/add/"> <button class="refe-2">erfassen</button></a>
        <a href="/switch?listForm=Aufzaehlung"> <button class="refe-2">Als ${listForm} darstellen</button></a> <!-- step 7 -->
    </div>


 </body>
 </html>