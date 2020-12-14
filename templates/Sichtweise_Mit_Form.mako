## coding: utf-8
<!DOCTYPE html>
<html lang="">
<head>
    <title>Mitarbeiterqualifizierung</title>
    <meta charset="UTF-8" />
    <style>
        @import "edit/Mitarbeiterqualifizierung.css";
    </style>
</head>

  <%
    i = 0
%>




<body onload="select_Weiter(${data_weiter})">


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
        <form id="idWTForm" action="/save_Mitarbeiter" method="POST">
            <input type="hidden" value="${data_key}" id="id_spa" name="id_spa" />
            <ul class="">

                        <li>Name:${data_o[data_key]["name"]}</li>
                        <li>Vorname:${data_o[data_key]["vorname"]}</li>
                        <li>Akademischer Grad:${data_o[data_key]["akademischer_grad"]}</li>
                        <li>Tätigkeit:${data_o[data_key]["taetigkeit"]}</li>
                    % if data_o[data_key]["Weiterbildung"] and type(data_o[data_key]["Weiterbildung"]) is dict and data_o[data_key]["Weiterbildung"]["status"] == "angemeldet":
                                <li>Weiterbildung:${data_o[data_key]["Weiterbildung"]["bezeichnung"]}</li>
                                <li>Weiterbildung(status):${data_o[data_key]["Weiterbildung"]["status"]}</li>
                                <a href="/stornieren/${data_key}/${i}" class='clDelete'> stornieren</a>

                    % endif

                    % if data_o[data_key]["Weiterbildung"] and type(data_o[data_key]["Weiterbildung"]) is list and data_o[data_key]["Weiterbildung"][i]["status"] == "angemeldet" :


                            % for i in range(len(data_o[data_key]["Weiterbildung"])):
                                <li>Weiterbildung:${data_o[data_key]["Weiterbildung"][i]["bezeichnung"]}</li>
                                <li>Weiterbildung:${data_o[data_key]["Weiterbildung"][i]["status"]}</li>
                                <a href="/stornieren/${data_key}/${i}" class='clDelete'> stornieren</a>
                            % endfor

                    % endif
                </ul>
        <div>
            <div class="">
            <input type="hidden"
                value="${data_o[data_key]["name"]}"
                id="name_spa"
                name="name_spa" required />
        </div>
        <div class="">
            <input type="hidden"
                value="${data_o[data_key]["vorname"]}"
                id="vorname_spa"
                name="vorname_spa" required />
        </div>
        <div class="">
            <input type="hidden"
                value="${data_o[data_key]["akademischer_grad"]}"
                id="ak_grad_spa"
                name="ak_grad_spa" required />
        </div>
        <div class="">
            <input type="hidden"
                value="${data_o[data_key]["taetigkeit"]}"
                id="taetigkeit_spa"
                name="taetigkeit_spa" required />
        </div>
        <div id="create_check">

        </div>

            <input type="submit" value="Speichern" class=""/>


        </div>
        </form>
        </div>

        </div>


            
</body>
 </html>