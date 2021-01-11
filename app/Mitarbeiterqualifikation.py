import cherrypy
from . import database


@cherrypy.expose
class Mitarbeiterqualifikation_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self, mitarbeiter_id, qualifikations_id):
        if mitarbeiter_id == "None":
            return self.database_obj.data_o_Quali[qualifikations_id]
        elif mitarbeiter_id == "None" and qualifikations_id == "None":
            data_mit_quali_o = {}
            for key_mit_s in self.database_obj.data_o_Mit:
                for key_quali_s in self.database_obj.data_o_Mit[key_mit_s]["Weiterbildung"]["Qualifikation"]:
                    data_mit_quali_o[str(key_quali_s)] = \
                        self.database_obj.data_o_Mit[key_mit_s]["Weiterbildung"]["Qualifikation"][key_quali_s]
            return data_mit_quali_o

        elif mitarbeiter_id and qualifikations_id:
            return self.database_obj.data_o_Mit[mitarbeiter_id]["Weiterbildung"]["Qualifikation"][qualifikations_id]

    @cherrypy.expose
    def delete_quali(self, id_mitarbeiter, id_weiterbildung, id_quali):
        # -------------------------------------------------------

        if len(self.db_o.data_o_Mit[id_mitarbeiter]["Weiterbildung"][id_weiterbildung]["Qualifikation"][id_quali]) != 1:
            self.db_o.data_o_Weiter[id_weiterbildung]["Qualifikation"].pop(id_quali, None)

        self.db_o.saveData_p()
        return self.edit(id_weiterbildung)