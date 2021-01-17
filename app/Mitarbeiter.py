import codecs
import json
import os

import cherrypy
from . import database


@cherrypy.expose
class Mitarbeiter_cl():
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

    def POST(self, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa,
             Weiterbildung_spa=None):

        data_a = {

            "name": name_spa,
            "vorname": vorname_spa,
            "akademischer_grad": ak_grad_spa,
            "taetigkeit": taetigkeit_spa,
            "Weiterbildung": Weiterbildung_spa,

        }

        return self.database_obj.create_px(data_a, "Mitarbeiter")

    def PUT(self, id_spa, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa, id_weiter_spa=None,
                         status_spa="None"):
        Weiterbildung_spa = {}
        id_s = id_spa

        if id_weiter_spa is not None:
            if type(id_weiter_spa) is list:
                if status_spa == "None":

                    for id_weiter in id_weiter_spa:
                        id_weiter = id_weiter[1:-1]
                        Weiterbildung_spa[str(id_weiter)] = self.db_o.data_o_Weiter[id_weiter]

            elif type(id_weiter_spa) is not list:
                if status_spa == "None":

                    id_weiter_spa = id_weiter_spa[1:-1]
                    Weiterbildung_spa[str(id_weiter_spa)] = self.db_o.data_o_Weiter[id_weiter_spa]

                elif status_spa != "None":
                    fp_o_mit = codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'r', 'utf-8')
                    data_o_Mit = json.load(fp_o_mit)
                    data_o_Mit[id_spa]["Weiterbildung"][id_weiter_spa]["status"] = status_spa
                    Weiterbildung_spa = data_o_Mit[id_spa]["Weiterbildung"]

        data_a = {

            "name": name_spa,
            "vorname": vorname_spa,
            "akademischer_grad": ak_grad_spa,
            "taetigkeit": taetigkeit_spa,
            "Weiterbildung": Weiterbildung_spa,

        }

        if id_s != "None":
            return self.database_obj.update_px(id_s, data_a)
        else:
            return

    def DELETE(self, mitarbeiter_id):
        self.database_obj.delete_px(mitarbeiter_id, "Mitarbeiter")

        raise cherrypy.HTTPRedirect('/')
