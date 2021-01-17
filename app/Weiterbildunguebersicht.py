import json

import cherrypy
from . import database


@cherrypy.expose
class Weiterbildunguebersicht_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self, weiterbildung_id=None):
        if weiterbildung_id is None:
            Weiterbildung_o = json.dumps(self.database_obj.read_px("Weiterbildung"))
            return Weiterbildung_o
        else:
            Weiterbildung_o = json.dumps(self.database_obj.read_px("Weiterbildung", weiterbildung_id))
            return Weiterbildung_o