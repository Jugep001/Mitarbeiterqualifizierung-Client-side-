import base64
import os
import os.path
import codecs
import json


# ----------------------------------------------------------
import uuid


class DataId_cl(object):
    # ----------------------------------------------------------

    # -------------------------------------------------------
    def __init__(self):
        # -------------------------------------------------------
        self.maxId_i = 0
        self.r_uuid = 0
        self.readMaxId_p()

    # -------------------------------------------------------
    def create_px(self):
        # -------------------------------------------------------
        self.maxId_i += 1
        self.r_uuid = uuid.uuid1()

        self.saveMaxId_p()
        return str(self.r_uuid)

    # -------------------------------------------------------
    def read_px(self):
        # -------------------------------------------------------
        return str(self.maxId_i)

    # -------------------------------------------------------
    def readMaxId_p(self):
        # -------------------------------------------------------
        try:
            fp_o = codecs.open(os.path.join('data', 'maxid.json'), 'r', 'utf-8')
        except:
            self.maxId_i = 0
            self.saveMaxId_p()
        else:
            with fp_o:
                self.maxId_i = json.load(fp_o)
        return

    # -------------------------------------------------------
    def saveMaxId_p(self):
        # -------------------------------------------------------
        with codecs.open(os.path.join('data', 'maxid.json'), 'w', 'utf-8') as fp_o:
            json.dump(self.maxId_i, fp_o)
