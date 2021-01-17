# coding:utf-8

# Demonstrator es/te/tm

import sys
import os.path
import cherrypy
from app import Mitarbeiter, Weiterbildung, Auswertungzertifikate, Auswertungweiterbildungen, Auswertungmitarbeiter, \
    Weiterbildunguebersicht, Mitarbeiterqualifikation, Mitarbeiteruebersicht

from app import template


# ----------------------------------------------------------
def main(currDir):
    # ----------------------------------------------------------

    # aktuelles Verzeichnis ermitteln, damit es in der Konfigurationsdatei als
    # Bezugspunkt verwendet werden kann
    try:  # aktuelles Verzeichnis als absoluter Pfad
        currentDir_s = os.path.dirname(os.path.abspath(__file__))
    except:
        currentDir_s = os.path.dirname(os.path.abspath(sys.executable))
    cherrypy.Application.currentDir_s = currentDir_s

    configFileName_s = os.path.join(currentDir_s, 'server.conf')  # im aktuellen Verzeichnis
    if os.path.exists(configFileName_s) == False:
        # Datei gibt es nicht
        configFileName_s = None

    # autoreload-Monitor hier abschalten
    cherrypy.engine.autoreload.unsubscribe()

    # 1. Eintrag: Standardverhalten, Berücksichtigung der Konfigurationsangaben im configFile
    cherrypy.tree.mount(
        None, '/', configFileName_s
    )

    # 2. Eintrag: Method-Dispatcher für die "Applikation" "app" vereinbaren
    cherrypy.tree.mount(
        Mitarbeiter.Mitarbeiter_cl(currDir),
        '/Mitarbeiter',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Weiterbildung.Weiterbildung_cl(currDir),
        '/Weiterbildung',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Mitarbeiteruebersicht.Mitarbeiteruebersicht_cl(currDir),
        '/Mitarbeiteruebersicht',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Weiterbildunguebersicht.Weiterbildunguebersicht_cl(currDir),
        '/Weiterbildunguebersicht',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Mitarbeiterqualifikation.Mitarbeiterqualifikation_cl(currDir),
        '/Mitarbeiterqualifikation',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Auswertungmitarbeiter.Auswertungmitarbeiter_cl(currDir),
        '/Auswertungmitarbeiter',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Auswertungweiterbildungen.Auswertungweiterbildungen_cl(currDir),
        '/Auswertungweiterbildungen',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.tree.mount(
        Auswertungzertifikate.Auswertungzertifikate_cl(currDir),
        '/Auswertungzertifikate',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    # 2. Eintrag: Method-Dispatcher für die "Applikation" "templates" vereinbaren
    cherrypy.tree.mount(
        template.Template_cl(currDir),
        '/templates',
        {'/': {'request.dispatch': cherrypy.dispatch.MethodDispatcher()}}
    )

    cherrypy.engine.start()
    cherrypy.engine.block()


# ----------------------------------------------------------
if __name__ == '__main__':
    # ----------------------------------------------------------
    main(os.path.abspath(os.getcwd()))
