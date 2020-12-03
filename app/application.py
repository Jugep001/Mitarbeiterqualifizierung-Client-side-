# coding: utf-8
import cherrypy
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

    @cherrypy.expose
    # -------------------------------------------------------
    def index(self):
        # -------------------------------------------------------
        return self.createList_p(self.listForm)

    @cherrypy.expose
    # -------------------------------------------------------
    def add(self):
        # -------------------------------------------------------
        return self.createForm_p(self.listForm)

    # step 7
    @cherrypy.expose
    def switch(self, listForm):
        Database_cl.listForm = listForm
        self.listForm = listForm
        return self.createList_p(self.listForm)

    # step 7
    @cherrypy.expose
    # -------------------------------------------------------
    def edit(self, id_spl):
        # -------------------------------------------------------
        return self.createForm_p(self.listForm, id_spl)

    # -------------------------------------------------------
    @cherrypy.expose
    def save_Mitarbeiter(self, id_spa, name_spa, vorname_spa, ak_grad_spa, taetigkeit_spa, listForm="Mitarbeiter"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "name": name_spa,
            "vorname": vorname_spa,
            "akademischer_grad": ak_grad_spa,
            "taetigkeit": taetigkeit_spa

        }
        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a, listForm)

        return self.createList_p(self.listForm)

        # -------------------------------------------------------

    @cherrypy.expose
    def save_Weiterbildung(self, id_spa, bezeichnung_spa, von_spa, bis_spa, beschreibung_spa, max_teilnehmer_spa,
                           min_teilnehmer_spa, listForm="Weiterbildung"):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        id_s = id_spa
        data_a = {

            "bezeichnung": bezeichnung_spa,
            "von": von_spa,
            "bis": bis_spa,
            "beschreibung": beschreibung_spa,
            "max_teilnehmer": max_teilnehmer_spa,
            "min_teilnehmer": min_teilnehmer_spa

        }

        if id_s != "None":
            self.db_o.update_px(id_s, data_a, listForm)
        else:
            self.db_o.create_px(data_a, listForm)

        return self.createList_p(self.listForm)

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
            self.db_o.create_px(data_a, listForm)

        return self.createList_p(self.listForm)

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
            self.db_o.create_px(data_a, listForm)

        return self.createList_p(self.listForm)

    @cherrypy.expose
    def delete(self, id, listForm):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        self.db_o.delete_px(id, listForm)

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
    def createList_p(self, listForm):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        data_o = self.db_o.read_px()
        return self.view_o.createList_px(data_o, listForm)

    # -------------------------------------------------------
    def createForm_p(self, listForm, id_spl=None):
        # -------------------------------------------------------
        Database_cl.listForm = listForm
        if id_spl != None:
            data_o = self.db_o.read_px(id_spl)
        else:
            data_o = self.db_o.getDefault_px()

        return self.view_o.createForm_px(id_spl, data_o, listForm)
