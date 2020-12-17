import codecs
import os.path
import string

from mako.template import Template
from mako.lookup import TemplateLookup


# ----------------------------------------------------------
class View_cl(object):
    # ----------------------------------------------------------

    # -------------------------------------------------------
    def __init__(self):
        # -------------------------------------------------------
        self.lookup_o = TemplateLookup('./templates')

    # -------------------------------------------------------
    def createList_px(self, data_opl, listForm, data_weiter_opl=None, data_mit_opl=None):
        # -------------------------------------------------------

        if listForm == "Startseite":

            template_o = self.lookup_o.get_template('Startseite.mako')

            markup_s = template_o.render(data_o=data_opl, data_weiter_o=data_weiter_opl, listform0=listForm, i=0, j=0,
                                         k=0)
            return markup_s
        elif listForm == "Pflege_Mit":

            template_o = self.lookup_o.get_template('Pflege_Mit.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s
        elif listForm == "Pflege_Weiter":
            template_o = self.lookup_o.get_template('Pflege_Weiter.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s
        elif listForm == "Sichtweise_Mit":
            template_o = self.lookup_o.get_template('Sichtweise_Mit.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s

        elif listForm == "Sichtweise_Weiter":
            template_o = self.lookup_o.get_template('Sichtweise_Weiter.mako')
            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s
        elif listForm == "Mitarbeiter":
            template_o = self.lookup_o.get_template('Mitarbeiter.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm, data_weiter_o=data_weiter_opl)
            return markup_s
        elif listForm == "Weiterbildungen":
            template_o = self.lookup_o.get_template('Weiterbildungen.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm, data_weiter_o=data_weiter_opl)
            return markup_s
        elif listForm == "Zertifikate":
            template_o = self.lookup_o.get_template('Zertifikate.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s
        elif listForm == "Pflege_Mit_Detail":
            template_o = self.lookup_o.get_template('Pflege_Mit_Detail.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm)
            return markup_s
        elif listForm == "Pflege_Weiter_Detail":
            template_o = self.lookup_o.get_template('Pflege_Weiter_Detail.mako')

            markup_s = template_o.render(data_o=data_opl, listform0=listForm, data_mit_o=data_mit_opl)
            return markup_s

    # -------------------------------------------------------
    def createForm_px(self, id_spl, data_opl, listForm, data_weiter_opl=None, data=None):
        # -------------------------------------------------------
        if listForm == "Pflege_Mit" or listForm == "Pflege_Mit_Detail":
            template_o = self.lookup_o.get_template('Mitarbeiter_form.mako')

            markup_s = template_o.render(data_o=data_opl, key_s=id_spl, bezeichnung={}, listForm=listForm,
                                         data_weiter=data_weiter_opl)
            return markup_s

        elif listForm == "Pflege_Weiter" or listForm == "Pflege_Weiter_Detail":
            template_o = self.lookup_o.get_template('Weiterbildung_form.mako')
            markup_s = template_o.render(data_o=data_opl, key_s=id_spl, listForm=listForm)
            return markup_s

        elif listForm == "Sichtweise_Mit_Form":
            template_o = self.lookup_o.get_template('Sichtweise_Mit_Form.mako')
            markup_s = template_o.render(data_o=data_opl, listform=listForm, data_key=data, key_weiter_s=data,
                                         data_weiter=data_weiter_opl, bezeichnung={}, value_weiter={}, i=0)
            return markup_s
        elif listForm == "Sichtweise_Weiter_form":
            template_o = self.lookup_o.get_template('Sichtweise_Weiter_form.mako')

            markup_s = template_o.render(data_o=data_opl,  listForm=listForm, data_weiter=data_weiter_opl,
                                         key_weiter_s=data)
            return markup_s

    # -------------------------------------------------------
    def readFile_p(self, fileName_spl):
        # -------------------------------------------------------
        content_s = ''
        with codecs.open(os.path.join('templates', fileName_spl), 'r', 'utf-8') as fp_o:
            content_s = fp_o.read()
        return content_s
