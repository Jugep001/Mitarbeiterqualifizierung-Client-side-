# coding: utf-8

import sys
import os
import cherrypy
from app import application


class Generator_cl():
    def __init__(self, currDir):
        self.app = application.Application_cl(currDir)


if __name__ == '__main__':
    conf = {
        '/': {
            'tools.sessions.on': True,
            'tools.staticdir.root': os.path.abspath(os.getcwd()),
            'tools.staticdir.on': True,
            'tools.staticdir.dir': './content',
            'tools.staticdir.index': 'index.html'
        },
        '/Mitarbeiter': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Weiterbildung': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Mitarbeiteruebersicht': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Weiterbildunguebersicht': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Mitarbeiterqualifikation': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Auswertungmitarbeiter': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Auswertungweiterbildungen': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/Auswertungzertifikate': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
        '/template': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher()
        },
    }
    # Mount static content handler
    currDir = os.path.abspath(os.getcwd())  # Aktuellen Dateipfad ziehen
    webapp = Generator_cl(currDir)  # Erstellen der Webapp

    # Zuweisen der Dispatcherklassen
    webapp.template = webapp.app.template_obj
    webapp.Auswertungmitarbeiter = webapp.app.Auswertungmitarbeiter_obj
    webapp.Auswertungweiterbildungen = webapp.app.Auswertungweiterbildungen_obj
    webapp.Auswertungzertifikate = webapp.app.Auswertungzertifikate_obj
    webapp.Mitarbeiter = webapp.app.Mitarbeiter_obj
    webapp.Weiterbildung = webapp.app.Weiterbildung_obj
    webapp.Mitarbeiterqualifikation = webapp.app.Mitarbeiterqualifikation_obj
    webapp.Mitarbeiteruebersicht = webapp.app.Mitarbeiteruebersicht_obj
    webapp.Weiterbildunguebersicht = webapp.app.Weiterbildunguebersicht_obj

    cherrypy.quickstart(webapp, '/', conf)  # Server starten
