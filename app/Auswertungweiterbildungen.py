import cherrypy
from . import database


@cherrypy.expose
class Auswertungweiterbildungen_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self):

    def POST(self):

    def PUT(self):

    def DELETE(self):