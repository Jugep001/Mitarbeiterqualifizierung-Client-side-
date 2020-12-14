Team: Julian Geppert (Matrikelnummer: 1195206), Benjamin Freukes (Matrikelnummer: 1287970)
Gültigkeitsdatum: 17.12.2020

## Allgemeine Beschreinung der Lösung
Mit dieser Webseite erstellen wir eine Anwendung, welche es ermöglicht
ein Datenmanagement zu betreiben. Man kann Daten erfassen, bearbeiten, löschen und speichern.
Wenn Daten gelöscht werden wird dies durch ein Pop-up Fenster  abgefragt.
Die Eingabe der "Mitarbeiter" Daten erfolgt durch eine Formularseite in der man den Namen, Vorname und spezifisch andere Daten 
eingeben kann. Außerdem gibt es auch einen zurück Button welcher es ermöglicht von Bearbeiten zurück
zu gehen.

### Durchgeführte Ergänzugen
####application.py:
- switch Funktion welche den Parameter listForm an create_List_p übergibt und die aktuelle Form in 
self.listForm speichert
- init hat einen neuen self Wert listForm bekommen der die aktuelle Form speichert.
- add liefert den aktuellen Zustand von der Liste zu create_form_p
- delete Funktion welche einen Eintrag von der Tabelle löscht, ein Pop-up mithilfe von
Javascript erzeugt un einen Pfad zurück geht
- save bekommt jetzt den aktuellen Zustand von listForm mitgeliefert
- create_list_p bekommt listForm mitgeliefert
- create_form_p bekommt listForm mitgeliefert
- index liefert den Zustand von der Liste zu create_list_p
- edit liefert createForm_p(id_spl) zurück
- save_Mitarbeiter prüft zuerst welche listen Ansicht vorhanden ist 
- save_Weiterbildung speichert bezeichnung, von, bis, beschreibung, max_teilnehmer, min_teilnehmer, bezeichung_zertifikat,
beschreibung_zerti, berechtigt_zu, bezeichnung_quali und beschreibung_quali ab.
- save_Qualifikation speichert die bezeichung und die beschreibung ab.
- stornieren leitet einen zurück auf die Startseite
- default ??
####database.py:
- init Werte werden initialisiert (data_o_Weiter,data_o_Zerti,data_o_Quali)
- create_px prüft welche listForm die Aktuelle ist und erstellt dann 
- read_px 
- update_px wird verwendet um bestehende Daten zu bearbeiten und zu "überschreiben"
- delete_px wird verwendet um bestehende Daten zu löschen
- storno_px
- getDefault_px
- readData_p
- saveData_p speichert jeweils die Daten in den Jeweiligen Json Dateien ab
####view.py
- createList_px prüft welche listForm die Aktuelle ist und läd jenachdem die html template Dateien.
- createForm_px prüft welche listForm die Aktuelle ist un läd jenachdem das richtige formular template.
####Mitarbeiter.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Pflege_Mit.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Pflege_Mit_Detail.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Pflege_Weiter.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Pflege_Weiter_Detail.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Sichtweise_Mit.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Sichtweise_Weiter.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Startseite.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Weiterbildungen.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Zertifikate.tpl
- Tabellen design wurde erstellt mit gridbox
- Tabelle wurde mit Werten gefüllt
- Javascript wurde eingebunden
- Css wurde eingebunden
- referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Mitarbeiter_Form.tpl
- Mit Inputs werden Daten geholt
- Tabelle wird mit dort angegebenen Werten gefüllt
- Javascript wurde eingebunden
- Css wird eingebunden
- Referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Sichtweise_Mit_Form.tpl
- Mit Inputs werden Daten geholt
- Tabelle wird mit dort angegebenen Werten gefüllt
- Javascript wurde eingebunden
- Css wird eingebunden
- Referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Sichtweise_Weiter_Form.tpl
- Mit Inputs werden Daten geholt
- Tabelle wird mit dort angegebenen Werten gefüllt
- Javascript wurde eingebunden
- Css wird eingebunden
- Referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Weiterbildungen_Form.tpl
- Mit Inputs werden Daten geholt
- Tabelle wird mit dort angegebenen Werten gefüllt
- Javascript wurde eingebunden
- Css wird eingebunden
- Referenz zur switch funktion wurde hinzugefügt mit der sich auf die Aufzählungsdarstellung 
wechseln lässt
####Mitarbeiterqualifizierung.css
- Farbe geändert
- Schriftgröße geändert
- Breite und höhe angepasst(margin,padding,linehight,...)
- Buttons haben transtion bekommen beim Klicken so das sich die Farbe ändert
- Flexbox wurde für die oberste Zeile hinzugefügt
- Unsortierte Liste wurde gestylt
####Mitarbeiterqualifizierung.js
- confirmDelete_p wird verwendet um das pop up aufzurufen wenn man Sachen löschen möchte(bestätigung)
- select_Weiter 
- sortTable/2 benutzen wir um die Tabellen welche Sortiert sein sollen zu sortieren


