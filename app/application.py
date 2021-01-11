from . import template
from . import Auswertungmitarbeiter
from . import Auswertungweiterbildungen
from . import Auswertungzertifikate
from . import Mitarbeiter
from . import Mitarbeiterqualifikation
from . import Mitarbeiteruebersicht
from . import Weiterbildung
from . import Weiterbildunguebersicht

class Application_cl():
    def __init__(self, currDir):
        self.currDir = currDir # Current filepath

        # Erstellen der Dispatcherklassen
        self.template_obj = template.Template_cl(self.currDir)
        self.Auswertungmitarbeiter_obj = Auswertungmitarbeiter.Auswertungmitarbeiter_cl(self.currDir)
        self.Auswertungweiterbildungen_obj = Auswertungweiterbildungen.Auswertungweiterbildungen_cl(self.currDir)
        self.Auswertungzertifikate_obj = Auswertungzertifikate.Auswertungzertifikate_cl(self.currDir)
        self.Mitarbeiter_obj = Mitarbeiter.Mitarbeiter_cl(self.currDir)
        self.Mitarbeiterqualifikation_obj = Mitarbeiterqualifikation.Mitarbeiterqualifikation_cl(self.currDir)
        self.Mitarbeiteruebersicht_obj = Mitarbeiteruebersicht.Mitarbeiteruebersicht_cl(self.currDir)
        self.Weiterbildunguebersicht_obj = Weiterbildunguebersicht.Weiterbildunguebersicht_cl(self.currDir)
        self.Weiterbildung_obj = Weiterbildung.Weiterbildung_cl(self.currDir)