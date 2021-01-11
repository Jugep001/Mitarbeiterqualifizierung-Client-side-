import cherrypy
from . import database


@cherrypy.expose
class Mitarbeiteruebersicht_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Mitarbeiter.json")

    def GET(self, mitarbeiter_id):
        if mitarbeiter_id is None:
            return self.database_obj.read_px("Mitarbeiter")
        else:
            return self.database_obj.read_px("Mitarbeiter", mitarbeiter_id)
