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
            return self.database_obj.read_px("Mitarbeiter")
        else:
            return self.database_obj.read_px("Mitarbeiter", mitarbeiter_id)

    def POST(self, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa,
             Weiterbildung_spa=None, Qualifikation_spa=None, Zertifikat_spa=None):

        data_a = {

            "name": name_spa,
            "vorname": vorname_spa,
            "akademischer_grad": ak_grad_spa,
            "taetigkeit": taetigkeit_spa,
            "Weiterbildung": Weiterbildung_spa,
            "Qualifikation": Qualifikation_spa,
            "Zertifikat": Zertifikat_spa,

        }

        return self.database_obj.create_px(data_a, "Mitarbeiter")

    def PUT(self, id_spa, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa,
            Weiterbildung_spa=None, status_spa=None, bezeichnung_spa=None, typeForm=None, Qualifikation_spa=None,
            Zertifikat_spa=None):
        if Weiterbildung_spa is not None:

            if typeForm == "list":
                if status_spa is not None:
                    fp_o_mit = codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'r', 'utf-8')
                    data_o_Mit = json.load(fp_o_mit)
                    for i in range(len(data_o_Mit[id_spa]["Weiterbildung"])):

                        if data_o_Mit[id_spa]["Weiterbildung"][i]["bezeichnung"] == bezeichnung_spa:
                            data_o_Mit[id_spa]["Weiterbildung"][i]["status"] = status_spa
                            Weiterbildung_spa = data_o_Mit[id_spa]["Weiterbildung"]

            if type(Weiterbildung_spa) is list:

                for i in range(len(Weiterbildung_spa)):

                    Weiterbildung_spa[i] = json.loads(Weiterbildung_spa[i])
                    if i == len(Weiterbildung_spa) - 1:
                        Weiterbildung_spa = json.dumps(Weiterbildung_spa)
                        Weiterbildung_spa = json.loads(Weiterbildung_spa)

            else:
                if status_spa is not None and typeForm == "dict":

                    fp_o_mit = codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'r', 'utf-8')
                    data_o_Mit = json.load(fp_o_mit)
                    data_o_Mit[id_spa]["Weiterbildung"]["status"] = status_spa
                    Weiterbildung_spa = data_o_Mit[id_spa]["Weiterbildung"]
                    id_s = id_spa

                    data_a = {

                        "name": name_spa,
                        "vorname": vorname_spa,
                        "akademischer_grad": ak_grad_spa,
                        "taetigkeit": taetigkeit_spa,
                        "Weiterbildung": Weiterbildung_spa,
                        "Qualifikation": Qualifikation_spa,
                        "Zertifikat": Zertifikat_spa,

                    }

                    if id_s != "None":
                        return self.database_obj.update_px(id_s, data_a)
                    else:
                        return


                else:
                    Weiterbildung_spa = json.loads(Weiterbildung_spa)

            id_s = id_spa

            data_a = {

                "name": name_spa,
                "vorname": vorname_spa,
                "akademischer_grad": ak_grad_spa,
                "taetigkeit": taetigkeit_spa,
                "Weiterbildung": Weiterbildung_spa,
                "Qualifikation": Qualifikation_spa,
                "Zertifikat": Zertifikat_spa,

            }

            if id_s != "None":
                return self.database_obj.update_px(id_s, data_a)
            else:
                return

    def DELETE(self, mitarbeiter_id):
        self.database_obj.delete_px(mitarbeiter_id, "Mitarbeiter")

        raise cherrypy.HTTPRedirect('/')
