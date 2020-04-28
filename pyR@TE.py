#!/usr/bin/env python
try:
    import sys
    from sys import exit
    import os
    import time

    wd = os.path.abspath(os.path.dirname(__file__))
    os.chdir(wd)
    sys.path.append(os.path.join(wd, 'src'))
    sys.path.append(os.path.join(wd, 'src', 'Core'))
    sys.path.append(os.path.join(wd, 'src', 'GroupTheory'))
    sys.path.append(os.path.join(wd, 'src', 'IO'))
    sys.path.append(os.path.join(wd, 'src', 'PyLie'))
except:
    raise SystemExit("Error while importing one of the modules `sys, os, yaml`")


welcomemessage = (
"""
============================================================================

             PyR@TE version 3.0-beta1  released  April 8th 2020

       L. Sartore,

       F. Lyonnet, I. Schienbein (version 2)
       and F.Staub, A.Wingerter (version 1)
    Please cite: arXiv:20xx.xxxxx , arXiv:1608.07274 and arXiv:1309.7030

! Disclaimer !
    This is a beta-version. If you encounter any bug or have any trouble
    running PyR@TE, please contact the author at : sartore at lpsc.in2p3.fr
    Also, please consider downloading the most recent version regularly.
============================================================================
""" )
print(welcomemessage)

try:
    from Logging import loggingInfo
    from Inputs import Inputs
except ImportError:
    exit("Error while importing the 'Inputs' module")


inputs = Inputs(wd)
runSettings, yamlSettings = inputs.getSettings()

import traceback

from PyLieDB import PyLieDB
from ModelsClass import Model
from RGEsModule import RGEsModule

# The following should be removed later
from sympy import init_printing
init_printing(forecolor='White', wrap_line=False, use_unicode=False)

t0 = time.time()

# Create the interactive database instance
idb = PyLieDB(raiseErrors=True)

error = False
# Whatever happens (errors or not) the DB is properly closed
try:
    idb.load()

    # Create the instance of the model
    model = Model(yamlSettings, runSettings, idb)

    # Create the instance of the RG module
    RGmodule = RGEsModule(model)

    # Fill the information in RGmodule using the Lagrangian expression
    model.expandLagrangian(RGmodule)

    # Map the model onto the general Lagrangian form
    model.constructMapping(RGmodule)

    # Initialize various gauge and tensor quantities + check gauge invariance
    RGmodule.initialize()
except:
    error = True
    track = traceback.format_exc()
finally:
    idb.close()
    if error:
        print(track)
        exit(1)


# Actual beta-function computation
model.defineBetaFunctions(RGmodule)
model.computeBetaFunctions()
model.mapBetaFunctions()

# Apply the user-defined substitutions (replacements, GUT normalization, ...)
model.doSubstitutions()

loggingInfo(f"-> All done in {time.time()-t0:.3f} seconds.", end='\n\n')

# Now export the results
import Exports

Exports.exports(runSettings, model)

loggingInfo("End of the run.")