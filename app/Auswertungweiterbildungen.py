import json

import cherrypy
from . import database


@cherrypy.expose
class Auswertungweiterbildungen_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self):
        data_o_weiter = self.database_obj.data_o_Weiter
        data_o_weiter_sorted = {}
        for w in sorted(data_o_weiter, key=data_o_weiter.get("bezeichnung"), reverse=True):
            data_o_weiter_sorted[w] = data_o_weiter[w]
        data_o_weiter_sorted = json.dumps(data_o_weiter_sorted)
        return data_o_weiter_sorted

