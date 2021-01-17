import json

import cherrypy
from . import database


@cherrypy.expose
class Mitarbeiterqualifikation_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self, mitarbeiter_id="None", qualifikations_id="None"):
        if mitarbeiter_id == "None":
            Qualifikation_o = self.database_obj.data_o_Quali[qualifikations_id]
            Qualifikation_o = json.dumps(Qualifikation_o)
            return Qualifikation_o
        elif mitarbeiter_id == "None" and qualifikations_id == "None":
            data_mit_quali_o = {}
            for key_mit_s in self.database_obj.data_o_Mit:
                for key_quali_s in self.database_obj.data_o_Mit[key_mit_s]["Weiterbildung"]["Qualifikation"]:
                    data_mit_quali_o[str(key_quali_s)] = \
                        self.database_obj.data_o_Mit[key_mit_s]["Weiterbildung"]["Qualifikation"][key_quali_s]
            data_mit_quali_o = json.dumps(data_mit_quali_o)
            return data_mit_quali_o

        elif mitarbeiter_id and qualifikations_id:
            Qualifikation_o = json.dumps(self.database_obj.data_o_Mit[mitarbeiter_id]["Weiterbildung"]["Qualifikation"]
                                         [qualifikations_id])
            return Qualifikation_o

    @cherrypy.expose
    def delete_quali(self, id_mitarbeiter, id_weiterbildung, id_quali):
        # -------------------------------------------------------

        if len(self.db_o.data_o_Mit[id_mitarbeiter]["Weiterbildung"][id_weiterbildung]["Qualifikation"][id_quali]) != 1:
            self.db_o.data_o_Weiter[id_weiterbildung]["Qualifikation"].pop(id_quali, None)

        self.db_o.saveData_p()
        return self.edit(id_weiterbildung)