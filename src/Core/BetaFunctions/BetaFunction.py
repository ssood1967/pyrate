# -*- coding: utf-8 -*-
from sys import exit
from Logging import loggingCritical

class BetaFunction():
    def __init__(self, model, RGmodule, fieldContent, nLoops):
        self.rm = RGmodule
        self.nLoops = nLoops
        self.store = False
        self.storeDic = {}

        self.Content = fieldContent

        self.functions = []
        self.coefficients = []

        # The BetaFunction object inherits all the useful attributes from RGmodule
        for key in dir(RGmodule) :
            if not(key[:2] == '__' and key[-2:] == '__'):
                self.__setattr__(key, RGmodule.__getattribute__(key))

        self.fDefinitions()
        self.cDefinitions()


    def Beta(self, *args, nLoops=1):

        # Possibly store the result of the computation. This is useful to
        # speed up the computation in presence of kinetic mixing
        storeAfter = False
        if self.store:
            key = tuple([*args, nLoops])
            if key in self.storeDic:
                return self.storeDic[key]
            storeAfter = True

        ret = 0
        for j, coeff in enumerate(self.coefficients[nLoops]):
            if coeff != 0:
                try:
                    tmp = self.functions[nLoops][j](*args)
                    if tmp != 0:
                        if ret == 0:
                            ret = coeff * tmp
                        else:
                            ret += coeff * tmp
                except BaseException as e:
                    loggingCritical(f"## Error while computing {self.functions[nLoops][j].__name__}. ##")
                    loggingCritical('>> ' + str(e))
                    exit()

        if storeAfter:
            self.storeDic[key] = ret

        return ret