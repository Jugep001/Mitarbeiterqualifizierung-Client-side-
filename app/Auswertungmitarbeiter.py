import cherrypy
from . import database


@cherrypy.expose
class Auswertungmitarbeiter_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Mitarbeiter.json")

    def GET(self):
        data_o_mit = self.database_obj.data_o_Mit
        data_o_mit_sorted = {}
        for w in sorted(data_o_mit, key=data_o_mit.get("name"), reverse=True):
            data_o_mit_sorted[w] = data_o_mit[w]
        return data_o_mit_sorted
