#!/usr/bin/env python
# -*- coding: utf-8 -*-

import vim
import os
import os.path
from leaderf.utils import *
from leaderf.explorer import *
from leaderf.manager import *


#*****************************************************
# ProsessionsExplorer
#*****************************************************
class ProsessionsExplorer(Explorer):
    def __init__(self):
        pass

    def getContent(self, *args, **kwargs):
        lfCmd("let sessions = leaderf#Prosessions#getSessions()")
        result = lfEval("sessions")
        return result;

    def getStlCategory(self):
        return "Prosessions"

    def getStlCurDir(self):
        return escQuote(lfEncode(os.getcwd()))

    def isFilePath(self):
        return False


#*****************************************************
# ProsessionsExplManager
#*****************************************************
class ProsessionsExplManager(Manager):
    def __init__(self):
        super(ProsessionsExplManager, self).__init__()
        self._match_ids = []

    def _getExplClass(self):
        return ProsessionsExplorer

    def _defineMaps(self):
        lfCmd("call leaderf#Prosessions#Maps()")

    def _acceptSelection(self, *args, **kwargs):
        if len(args) == 0:
            return
        session = args[0]
        try:
            lfCmd("Prosession %s" % session)
        except vim.error as e:
            lfPrintError(e)

    def _getDigest(self, line, mode):
        """
        specify what part in the line to be processed and highlighted
        Args:
            mode: 0, 1, 2, return the whole line
        """
        if not line:
            return ''

        return line

    def _getDigestStartPos(self, line, mode):
        """
        return the start position of the digest returned by _getDigest()
        Args:
            mode: 0, 1, 2, return 0
        """
        return 0

    def _createHelp(self):
        help = []
        help.append('" <CR>/<double-click>/o : execute command under cursor')
        help.append('" i : switch to input mode')
        help.append('" q : quit')
        help.append('" <F1> : toggle this help')
        help.append('" ---------------------------------------------------------')
        return help

    def _afterEnter(self):
        super(ProsessionsExplManager, self)._afterEnter()

    def _beforeExit(self):
        super(ProsessionsExplManager, self)._beforeExit()

#*****************************************************
# prosessionsExplManager is a singleton
#*****************************************************
prosessionsExplManager = ProsessionsExplManager()

__all__ = ['prosessionsExplManager']
