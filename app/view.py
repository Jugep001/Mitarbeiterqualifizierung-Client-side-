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
    def createList_px(self, data_opl, listForm):
        # -------------------------------------------------------

        if listForm == "Tabelle":
            template_o = self.lookup_o.get_template('list.mako')

            markup_s = template_o.render(data_o=data_opl, listFormText="Aufzählung", listform0=listForm,
                                         listForm="Aufzaehlung")
            return markup_s


    # -------------------------------------------------------
    def createForm_px(self, id_spl, data_opl, listForm):
        # -------------------------------------------------------
        template_o = self.lookup_o.get_template('form.mako')
        markup_s = template_o.render(data_o=data_opl, key_s=id_spl, listForm=listForm)
        return markup_s

    # -------------------------------------------------------
    def readFile_p(self, fileName_spl):
        # -------------------------------------------------------
        content_s = ''
        with codecs.open(os.path.join('templates', fileName_spl), 'r', 'utf-8') as fp_o:
            content_s = fp_o.read()
        return content_s
