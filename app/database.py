import os
import os.path
import codecs
import json

from . import dataid


class Database_cl(object):

    def __init__(self):

        self.data_o = None
        self.maxId_o = dataid.DataId_cl()
        self.listForm = "None"
        self.readData_p(self.listForm)

    def create_px(self, data_opl, listForm):

        id_s = self.maxId_o.create_px()
        self.data_o[str(id_s)] = data_opl
        self.saveData_p(listForm)
        return str(id_s)

    def read_px(self, id_spl=None):

        data_o = None
        if id_spl == None:
            data_o = self.data_o
        else:
            if id_spl in self.data_o:
                data_o = self.data_o[id_spl]
        return data_o

    def update_px(self, id_spl, data_opl,listForm):

        status_b = False
        if id_spl in self.data_o:
            self.data_o[id_spl] = data_opl
            self.saveData_p(listForm)
            status_b = True
        return status_b

    def delete_px(self, id_spl,listForm):

        status_b = False
        if self.data_o.pop(id_spl, None) != None:
            self.saveData_p(listForm)
            status_b = True
        return status_b


    def getDefault_px(self):

        return ['', '', '', '', '', '', '', '', '']  # step 1,3

    def readData_p(self,listForm):


        try:
            if listForm == "Mitarbeiter":
                fp_o = codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'r', 'utf-8')
            elif listForm == "Weiterbildung":
                fp_o = codecs.open(os.path.join('data', 'Weiterbildung.json'), 'r', 'utf-8')
            elif listForm == "Zertifikat":
                fp_o = codecs.open(os.path.join('data', 'Zertifikat.json'), 'r', 'utf-8')
            elif listForm == "Qualifikation":
                fp_o = codecs.open(os.path.join('data', 'Qualifikation.json'), 'r', 'utf-8')
            else:
                return
        except:
            self.data_o = {}
            self.saveData_p(listForm)
        else:
            with fp_o:
                self.data_o = json.load(fp_o)
        return

    def saveData_p(self,listForm):

        if listForm == "Mitarbeiter":
            with codecs.open(os.path.join('data', 'Mitarbeiter.json'), 'w', 'utf-8') as fp_o:
                json.dump(self.data_o, fp_o, indent=3)
        elif listForm == "Weiterbildung":
            with codecs.open(os.path.join('data', 'Weiterbildung.json'), 'w', 'utf-8') as fp_o:
                json.dump(self.data_o, fp_o, indent=3)
        elif listForm == "Zertifikat":
            with codecs.open(os.path.join('data', 'Zertifikat.json'), 'w', 'utf-8') as fp_o:
                json.dump(self.data_o, fp_o, indent=3)
        elif listForm == "Qualifikation":
            with codecs.open(os.path.join('data', 'Qualifikation.json'), 'w', 'utf-8') as fp_o:
                json.dump(self.data_o, fp_o, indent=3)
