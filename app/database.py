import os
import os.path
import codecs
import json

from . import dataid


class Database_cl(object):

    def __init__(self):

        self.data_o_Mit = None
        self.data_o_Weiter = None
        self.data_o_Zerti = None
        self.data_o_Quali = None
        self.maxId_o = dataid.DataId_cl()
        self.listForm = "Pflege_Mit"
        self.readData_p()

    def create_px(self, data_opl, listForm):

        id_s = self.maxId_o.create_px()
        if listForm == "Pflege_Mit":
            self.data_o_Mit[str(id_s)] = data_opl
        elif listForm == "Pflege_Weiter":
            self.data_o_Weiter[str(id_s)] = data_opl
        elif listForm == "Zertifikat":
            self.data_o_Zerti[str(id_s)] = data_opl
        elif listForm == "Qualifikation":
            self.data_o_Quali[str(id_s)] = data_opl
        self.saveData_p()
        return str(id_s)

    def read_px(self, listForm, id_spl=None):

        if listForm == "Pflege_Mit" or listForm == "Pflege_Mit_Detail" or listForm == "Sichtweise_Mit" \
                or listForm == "Sichtweise_Mit_Form":
            data_o_Mit = None
            if id_spl == None:
                data_o_Mit = self.data_o_Mit
            else:
                if id_spl in self.data_o_Mit:
                    data_o_Mit = self.data_o_Mit[id_spl]

            return data_o_Mit
        elif listForm == "Pflege_Weiter" or listForm == "Pflege_Weiter_Detail":
            data_o_Weiter = None
            if id_spl == None:
                data_o_Weiter = self.data_o_Weiter
            else:
                if id_spl in self.data_o_Weiter:
                    data_o_Weiter = self.data_o_Weiter[id_spl]

            return data_o_Weiter
        elif listForm == "Zertifikat":
            data_o_Zerti = None
            if id_spl == None:
                data_o_Zerti = self.data_o_Zerti
            else:
                if id_spl in self.data_o_Zerti:
                    data_o_Zerti = self.data_o_Zerti[id_spl]

            return data_o_Zerti
        elif listForm == "Qualifikation":
            data_o_Quali = None
            if id_spl == None:

                data_o_Quali = self.data_o_Quali
            else:
                if id_spl in self.data_o_Quali:
                    data_o_Quali = self.data_o_Quali[id_spl]

            return data_o_Quali

    def update_px(self, id_spl, data_opl, listForm):

        status_b = False
        if id_spl in self.data_o_Mit:
            self.data_o_Mit[id_spl] = data_opl
            self.saveData_p()
            status_b = True
        elif id_spl in self.data_o_Weiter:
            self.data_o_Weiter[id_spl] = data_opl
            self.saveData_p()
            status_b = True
        elif id_spl in self.data_o_Zerti:
            self.data_o_Zerti[id_spl] = data_opl
            self.saveData_p()
            status_b = True
        elif id_spl in self.data_o_Quali:
            self.data_o_Quali[id_spl] = data_opl
            self.saveData_p()
            status_b = True
        return status_b

    def delete_px(self, id_spl, listForm):

        status_b = False
        if listForm == "Pflege_Mit":
            if self.data_o_Mit.pop(id_spl, None) != None:
                self.saveData_p()
                status_b = True
            return status_b
        elif listForm == "Pflege_Weiter":
            if self.data_o_Weiter.pop(id_spl, None) != None:
                self.saveData_p()
                status_b = True
            return status_b
        elif listForm == "Zertifikat":
            if self.data_o_Zerti.pop(id_spl, None) != None:
                self.saveData_p()
                status_b = True
            return status_b
        elif listForm == "Qualifikation":
            if self.data_o_Quali.pop(id_spl, None) != None:
                self.saveData_p()
                status_b = True
            return status_b
    def storno_px(self, id_spl, i):

        status_b = False

        if self.data_o_Mit != None:
            del self.data_o_Mit[id_spl]["Weiterbildung"][int(i)]
            self.saveData_p()
            status_b = True
        return status_b

    def getDefault_px(self, listForm):

        if listForm == "Pflege_Mit":
            return {
                "name": "",
                "vorname": "",
                "akademischer_grad": "",
                "taetigkeit": "",
                "Weiterbildung": "",
            }
        elif listForm == "Pflege_Weiter":
            return {
                "bezeichnung": "",
                "von": "",
                "bis": "",
                "beschreibung": "",
                "max_teilnehmer": "",
                "min_teilnehmer": "",
                "bezeichnung_zerti": "",
                "beschreibung_zerti": "",
                "berechtigt_zu": "",
                "bezeichnung_quali": "",
                "beschreibung_quali": "",
            }

        elif listForm == "Zertifikat":
            return {
                "bezeichnung": "",
                "beschreibung": "",
                "berechtigt": "",

            }
        elif listForm == "Qualifikation":
            return {
                "bezeichnung": "",
                "beschreibung": "",

            }

    def readData_p(self):

        try:

            fp_o_mit = codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'r', 'utf-8')
            fp_o_weiter = codecs.open(os.path.join('data', 'Weiterbildung.json'), 'r', 'utf-8')
            fp_o_zerti = codecs.open(os.path.join('data', 'Zertifikat.json'), 'r', 'utf-8')
            fp_o_quali = codecs.open(os.path.join('data', 'Qualifikation.json'), 'r', 'utf-8')

        except:
            self.data_o_Mit = {}
            self.data_o_Weiter = {}
            self.data_o_Zerti = {}
            self.data_o_Quali = {}
            self.saveData_p()
        else:
            with fp_o_mit:
                self.data_o_Mit = json.load(fp_o_mit)
            with fp_o_weiter:
                self.data_o_Weiter = json.load(fp_o_weiter)
            with fp_o_zerti:
                self.data_o_Zerti = json.load(fp_o_zerti)
            with fp_o_quali:
                self.data_o_Quali = json.load(fp_o_quali)
        return

    def saveData_p(self):

        with codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'w', 'utf-8') as fp_o:
            json.dump(self.data_o_Mit, fp_o, indent=3)

        with codecs.open(os.path.join('data', 'Weiterbildung.json'), 'w', 'utf-8') as fp_o:
            json.dump(self.data_o_Weiter, fp_o, indent=3)

        with codecs.open(os.path.join('data', 'Zertifikat.json'), 'w', 'utf-8') as fp_o:
            json.dump(self.data_o_Zerti, fp_o, indent=3)

        with codecs.open(os.path.join('data', 'Qualifikation.json'), 'w', 'utf-8') as fp_o:
            json.dump(self.data_o_Quali, fp_o, indent=3)
