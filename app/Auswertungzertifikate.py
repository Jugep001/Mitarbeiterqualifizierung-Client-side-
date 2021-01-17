import json

import cherrypy
from . import database


@cherrypy.expose
class Auswertungzertifikate_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Mitarbeiter.json")

    def GET(self):
        data_o_mit = self.database_obj.data_o_Mit
        Zerti_array = []
        i = 0
        for key_mit_o in data_o_mit:
            for key_weiter_o in data_o_mit[key_mit_o]["Weiterbildung"]:
                if data_o_mit[key_mit_o]["Weiterbildung"][key_weiter_o]["status"] == "erfolgreich beendet":
                    Zerti_array[i] = data_o_mit[key_mit_o]["Weiterbildung"][key_weiter_o]["bezeichnung"]
                    i = i + 1
        Zerti_array = json.dumps(Zerti_array)
        return Zerti_array
