import cherrypy
from . import database


@cherrypy.expose
class Weiterbildunguebersicht_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self, weiterbildung_id):
        if weiterbildung_id is None:
            return self.database_obj.read_px("Weiterbildung")
        else:
            return self.database_obj.read_px("Weiterbildung", weiterbildung_id)