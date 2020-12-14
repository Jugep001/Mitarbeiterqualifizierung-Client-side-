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

                <ul class="">
                    <li> ${data_weiter[key_weiter_s]["bezeichnung"]} </li>
                    <li>von:${data_weiter[key_weiter_s]["von"]}</li>
                    <li>bis:${data_weiter[key_weiter_s]["bis"]}</li>
                    <li>beschreibung:${data_weiter[key_weiter_s]["beschreibung"]}</li>
                    <li>max_teilnehmer:${data_weiter[key_weiter_s]["max_teilnehmer"]}</li>
                    <li>min_teilnehmer:${data_weiter[key_weiter_s]["min_teilnehmer"]}</li>
                    <li>bezeichnung:${data_weiter[key_weiter_s]["bezeichnung_zerti"]}</li>
                    <li>beschreibung:${data_weiter[key_weiter_s]["beschreibung_zerti"]}</li>
                    <li>berechtigt zu:${data_weiter[key_weiter_s]["berechtigt_zu"]}</li>
                    <li>bezeichnung:${data_weiter[key_weiter_s]["bezeichnung_quali"]}</li>
                    <li>beschreibung:${data_weiter[key_weiter_s]["beschreibung_quali"]}</li>
                    Teilnehmer:
                % for key_s in data_o:
                    % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is dict:
                        % if data_o[key_s]["Weiterbildung"]["bezeichnung"] == data_weiter[key_weiter_s]["bezeichnung"] and data_o[key_s]["Weiterbildung"]["status"] == "angemeldet" or data_o[key_s]["Weiterbildung"]["status"] == "nimmt teil":

                            <li>Name:${data_o[key_s]["name"]}</li>
                            <li>Status:${data_o[key_s]["Weiterbildung"]["status"]}</li>
                            <form id="idWTForm" action="/save_Mitarbeiter" method="POST">
                                <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
                                <input type="hidden" value="dict" id="typeForm" name="typeForm" />
                                <input type="hidden" value="${data_o[key_s]["name"]}" id="name_spa" name="name_spa" required />
                                <input type="hidden" value="${data_o[key_s]["vorname"]}" id="vorname_spa" name="vorname_spa" required />
                                <input type="hidden" value="${data_o[key_s]["akademischer_grad"]}" id="ak_grad_spa" name="ak_grad_spa" required />
                                <input type="hidden" value="${data_o[key_s]["taetigkeit"]}" id="taetigkeit_spa" name="taetigkeit_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Weiterbildung"]}" id="Weiterbildung_spa" name="Weiterbildung_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Qualifikation"]}" id="Qualifikation_spa" name="Qualifikation_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Zertifikat"]}" id="Zertifikat_spa" name="Zertifikat_spa" required />
                                    <label for="status_spa">Wähle Status:</label>

                                    <select name="status_spa" id="status_spa">
                                        <option value="nimmt teil">nimmt teil</option>
                                        % if data_o[key_s]["Weiterbildung"]["status"] == "nimmt teil":

                                            <option value="abgebrochen">abgebrochen</option>
                                            <option value="nicht erfolgreich beendet">nicht erfolgreich beendet</option>
                                            <option value="erfolgreich beendet">erfolgreich beendet</option>
                                        % endif
                                    </select>
                            <div>

                                <input type="submit" value="Speichern" class=""/>

                            </div>
                            </form>
                        % endif
                    % endif

                % if data_o[key_s]["Weiterbildung"] and type(data_o[key_s]["Weiterbildung"]) is list:



                    % for i in range(len(data_o[key_s]["Weiterbildung"])):
                         % if data_o[key_s]["Weiterbildung"][i]["bezeichnung"] == data_weiter[key_weiter_s]["bezeichnung"]:
                            % if data_o[key_s]["Weiterbildung"][i]["status"] == "angemeldet" or data_o[key_s]["Weiterbildung"][i]["status"] == "nimmt teil":
                            <li>Name:${data_o[key_s]["name"]}</li>
                            <li>Weiterbildung:${data_o[key_s]["Weiterbildung"][i]["status"]}</li>
                             <form id="idWTForm" action="/save_Mitarbeiter" method="POST">
                                <input type="hidden" value="${key_s}" id="id_spa" name="id_spa" />
                                <input type="hidden" value="${data_o[key_s]["Weiterbildung"][i]["bezeichnung"]}" id="bezeichnung_spa" name="bezeichnung_spa" />
                                <input type="hidden" value="list" id="typeForm" name="typeForm" />
                                <input type="hidden" value="${data_o[key_s]["name"]}" id="name_spa" name="name_spa" required />
                                <input type="hidden" value="${data_o[key_s]["vorname"]}" id="vorname_spa" name="vorname_spa" required />
                                <input type="hidden" value="${data_o[key_s]["akademischer_grad"]}" id="ak_grad_spa" name="ak_grad_spa" required />
                                <input type="hidden" value="${data_o[key_s]["taetigkeit"]}" id="taetigkeit_spa" name="taetigkeit_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Weiterbildung"][i]}" id="Weiterbildung_spa" name="Weiterbildung_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Qualifikation"]}" id="Qualifikation_spa" name="Qualifikation_spa" required />
                                <input type="hidden" value="${data_o[key_s]["Zertifikat"]}" id="Zertifikat_spa" name="Zertifikat_spa" required />
                                    <label for="status_spa">Wähle Status:</label>

                                    <select name="status_spa" id="status_spa">
                                        <option value="nimmt teil">nimmt teil</option>
                                        % if data_o[key_s]["Weiterbildung"][i]["status"] == "nimmt teil":

                                            <option value="abgebrochen">abgebrochen</option>
                                            <option value="nicht erfolgreich beendet">nicht erfolgreich beendet</option>
                                            <option value="erfolgreich beendet">erfolgreich beendet</option>
                                        % endif
                                    </select>
                            <div>

                                <input type="submit" value="Speichern" class=""/>

                            </div>
                            </form>
                            % endif
                         % endif
                    % endfor

                % endif

                % endfor
                </ul>



        </div>
    </div>
</body>
 </html>