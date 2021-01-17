import json

import cherrypy
from . import database


@cherrypy.expose
class Mitarbeiteruebersicht_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Mitarbeiter.json")

    def GET(self, mitarbeiter_id=None):
        if mitarbeiter_id is None:
            Mitarbeiter_o = json.dumps(self.database_obj.read_px("Mitarbeiter"))
            return Mitarbeiter_o
        else:
            Mitarbeiter_o = json.dumps(self.database_obj.read_px("Mitarbeiter", mitarbeiter_id))
            return Mitarbeiter_o
