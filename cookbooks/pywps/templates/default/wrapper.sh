#!/usr/sh

# Author: jachym
# Purpose: PyWPS wrapper script
# Licence: GNU/GPL
# Version: To be used with PyWPS >= 3.0.0
# Installation: Put this script to /usr/lib/cgi-bin directory (or other
#               cgi-bin directory of your web server) and call it whatever
#               you like (e.g. "foowps"). Adjust the variables below and
#               chmod +x this script.

export PYWPS_CFG=/usr/local/pywps/foo/pywps.cfg
export PYWPS_PROCESSES=/usr/local/pywps/foo/processes/

/usr/bin/wps.py
