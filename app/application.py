# coding: utf-8
import cherrypy
import json
from .database import Database_cl
from .view import View_cl


# ----------------------------------------------------------
class Application_cl(object):
    # ----------------------------------------------------------
    # -------------------------------------------------------
    def __init__(self):
        # -------------------------------------------------------

        self.db_o = Database_cl()
        self.view_o = View_cl()
        self.listForm = "Startseite"
        self.data = None

    @cherrypy.expose
    # -------------------------------------------------------
    def index(self):
        # -------------------------------------------------------
        return self.createList_p()

    @cherrypy.expose
    # -------------------------------------------------------
    def add(self, data=None,listForm=None):
        # -------------------------------------------------------
        if listForm is not None:
            self.listForm = listForm
        return self.createForm_p(None, data)

    # step 7
    @cherrypy.expose
    def switch(self, listForm):
        Database_cl.listForm = listForm
        self.listForm = listForm
        return self.createList_p()

    # step 7
    @cherrypy.expose
    # -------------------------------------------------------
    def edit(self, id_spl):
        # -------------------------------------------------------
        return self.createForm_p(id_spl)

    # -------------------------------------------------------
    @cherrypy.expose
    def save_Mitarbeiter(self, id_spa, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa,
                         Weiterbildung_spa=None, listForm="Pflege_Mit"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "name": name_spa,
            "vorname": vorname_spa,
            "akademischer_grad": ak_grad_spa,
            "taetigkeit": taetigkeit_spa,
            "Weiterbildung": Weiterbildung_spa,

        }

        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a, self.listForm)

        return self.createList_p()

        # -------------------------------------------------------

    @cherrypy.expose
    def save_Weiterbildung(self, id_spa, bezeichnung_spa, von_spa, bis_spa, beschreibung_spa, max_teilnehmer_spa,
                           min_teilnehmer_spa, bezeichnung_zerti_spa, beschreibung_zerti_spa, berechtigt_zu_spa,
                           bezeichnung_quali_spa, beschreibung_quali_spa, listForm="Pflege_Weiter"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "bezeichnung": bezeichnung_spa,
            "von": von_spa,
            "bis": bis_spa,
            "beschreibung": beschreibung_spa,
            "max_teilnehmer": max_teilnehmer_spa,
            "min_teilnehmer": min_teilnehmer_spa,
            "bezeichnung_zerti": bezeichnung_zerti_spa,
            "beschreibung_zerti": beschreibung_zerti_spa,
            "berechtigt_zu": berechtigt_zu_spa,
            "bezeichnung_quali": bezeichnung_quali_spa,
            "beschreibung_quali": beschreibung_quali_spa,

        }

        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a, self.listForm)

        return self.createList_p()

    @cherrypy.expose
    def save_Zertifikat(self, id_spa, bezeichnung_spa, beschreibung_spa, berechtigt_spa, listForm="Zertifikat"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "bezeichnung": bezeichnung_spa,
            "beschreibung": beschreibung_spa,
            "berechtigt": berechtigt_spa,

        }
        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a)

        return self.createList_p()

    @cherrypy.expose
    def save_Qualifikation(self, id_spa, bezeichnung_spa, beschreibung_spa, listForm="Qualifikation"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "bezeichnung": bezeichnung_spa,
            "beschreibung": beschreibung_spa,

        }
        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a, self.listForm)

        return self.createList_p()

    @cherrypy.expose
    def delete(self, id):
        # -------------------------------------------------------
        Database_cl.listForm = self.listForm
        self.db_o.delete_px(id, self.listForm)

        raise cherrypy.HTTPRedirect('/')

    # step 5
    @cherrypy.expose
    # -------------------------------------------------------
    def default(self, *arguments, **kwargs):
        # -------------------------------------------------------
        msg_s = "unbekannte Anforderung: " + \
                str(arguments) + \
                ' ' + \
                str(kwargs)
        raise cherrypy.HTTPError(404, msg_s)

    default.exposed = True

    # -------------------------------------------------------
    def createList_p(self):
        # -------------------------------------------------------
        Database_cl.listForm = self.listForm
        if self.listForm == "Sichtweise_Mit_Form":
            self.listForm = "Sichtweise_Mit"
            data_o = self.db_o.read_px(self.listForm)
            return self.view_o.createList_px(data_o, self.listForm)
        data_o = self.db_o.read_px(self.listForm)
        return self.view_o.createList_px(data_o, self.listForm)

    # -------------------------------------------------------
    def createForm_p(self, id_spl=None, data=None):
        # -------------------------------------------------------
        Database_cl.listForm = self.listForm
        data_weiter = None
        if id_spl != None:
            data_o = self.db_o.read_px(self.listForm, id_spl)
            data_weiter = self.db_o.read_px("Pflege_Weiter")
        else:

            data_o = self.db_o.getDefault_px(self.listForm)
            if self.listForm == "Sichtweise_Mit_Form":
                data_o = self.db_o.read_px(self.listForm)
                data_weiter = self.db_o.data_o_Weiter
                if data_weiter is None:
                    data_weiter = self.db_o.getDefault_px("Pflege_Weiter")
                    return self.view_o.createForm_px(id_spl, data_o, self.listForm, data_weiter, data)
            return self.view_o.createForm_px(id_spl, data_o, self.listForm, data_weiter, data)

        return self.view_o.createForm_px(id_spl, data_o, self.listForm, data_weiter, data)
