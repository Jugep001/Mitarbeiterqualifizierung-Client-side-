import cherrypy
from . import database


@cherrypy.expose
class Weiterbildung_cl():
    def __init__(self, currDir):
        self.currDir = currDir
        self.database_obj = database.Database_cl(self.currDir, "Weiterbildung.json")

    def GET(self, weiterbildung_id):
        if weiterbildung_id is None:
            return self.database_obj.read_px("Weiterbildung")
        else:
            return self.database_obj.read_px("Weiterbildung", weiterbildung_id)

    def POST(self, status_spa, bezeichnung_spa, von_spa, bis_spa, beschreibung_spa, max_teilnehmer_spa,
             min_teilnehmer_spa, bezeichnung_zerti_spa, beschreibung_zerti_spa, berechtigt_zu_spa,
             bezeichnung_quali_spa, beschreibung_quali_spa):

        Qualifikation_spa = {}
        if type(bezeichnung_quali_spa) == list:
            for Quali_elem in range(len(bezeichnung_quali_spa)):
                id_quali_spa = self.save_Qualifikation("None", bezeichnung_quali_spa[Quali_elem],
                                                       beschreibung_quali_spa[Quali_elem])
                Qualifikation_spa[str(id_quali_spa)] = self.db_o.data_o_Quali[id_quali_spa]
                print(Qualifikation_spa)
        else:
            id_quali_spa = self.save_Qualifikation("None", bezeichnung_quali_spa, beschreibung_quali_spa)
            Qualifikation_spa[str(id_quali_spa)] = self.db_o.data_o_Quali[id_quali_spa]

        data_a = {

            "status": status_spa,
            "bezeichnung": bezeichnung_spa,
            "von": von_spa,
            "bis": bis_spa,
            "beschreibung": beschreibung_spa,
            "max_teilnehmer": max_teilnehmer_spa,
            "min_teilnehmer": min_teilnehmer_spa,
            "bezeichnung_zerti": bezeichnung_zerti_spa,
            "beschreibung_zerti": beschreibung_zerti_spa,
            "berechtigt_zu": berechtigt_zu_spa,
            "Qualifikation": Qualifikation_spa,

        }

        return self.database_obj.create_px(data_a, "Weiterbildung")

    def PUT(self, weiterbildung_id, status_spa, bezeichnung_spa, von_spa, bis_spa, beschreibung_spa,
            max_teilnehmer_spa,
            min_teilnehmer_spa, bezeichnung_zerti_spa, beschreibung_zerti_spa, berechtigt_zu_spa,
            bezeichnung_quali_spa, beschreibung_quali_spa):
        id_s = weiterbildung_id
        Qualifikation_spa = {}
        if type(bezeichnung_quali_spa) == list:
            for Quali_elem in range(len(bezeichnung_quali_spa)):
                id_quali_spa = self.save_Qualifikation("None", bezeichnung_quali_spa[Quali_elem],
                                                       beschreibung_quali_spa[Quali_elem])
                Qualifikation_spa[str(id_quali_spa)] = self.db_o.data_o_Quali[id_quali_spa]
                print(Qualifikation_spa)
        else:
            id_quali_spa = self.save_Qualifikation("None", bezeichnung_quali_spa, beschreibung_quali_spa)
            Qualifikation_spa[str(id_quali_spa)] = self.db_o.data_o_Quali[id_quali_spa]

        data_a = {

            "status": status_spa,
            "bezeichnung": bezeichnung_spa,
            "von": von_spa,
            "bis": bis_spa,
            "beschreibung": beschreibung_spa,
            "max_teilnehmer": max_teilnehmer_spa,
            "min_teilnehmer": min_teilnehmer_spa,
            "bezeichnung_zerti": bezeichnung_zerti_spa,
            "beschreibung_zerti": beschreibung_zerti_spa,
            "berechtigt_zu": berechtigt_zu_spa,
            "Qualifikation": Qualifikation_spa,

        }

        if id_s != "None":
            return self.db_o.update_px(id_s, data_a, "Weiterbildung")
        else:
            return

    def DELETE(self, weiterbildung_id):
        self.database_obj.delete_px(weiterbildung_id, "Weiterbildung")

        raise cherrypy.HTTPRedirect('/')

    @cherrypy.expose
    def save_Qualifikation(self, id_spa, bezeichnung_spa, beschreibung_spa, listForm="Qualifikation"):
        # -------------------------------------------------------
        id_s = id_spa

        data_a = {

            "bezeichnung": bezeichnung_spa,
            "beschreibung": beschreibung_spa,

        }

        if id_s != "None":
            return self.db_o.update_px(id_s, data_a, listForm)
        else:
            return self.db_o.create_px(data_a, listForm)
