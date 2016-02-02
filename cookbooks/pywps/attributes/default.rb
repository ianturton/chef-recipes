#WPS
default[:pywps][:title] = "A Python WPS Server"
default[:pywps][:abstract] = "A default abstract"
default[:pywps][:keywords] = "GRASS,GIS,WPS"
default[:pywps][:serverurl] = "http://localhost:80/cgi-bin/wps.py"
default[:pywps][:encoding]="utf-8"
default[:pywps][:pywpsVersion]="1.0.0"
default[:pywps][:fees]="None"
default[:pywps][:constraints]="none"
default[:pywps][:lang]="en-CA"


#provider
default[:pywps][:providerName]="Your Company Name"
default[:pywps][:individualName]="Your Name"
default[:pywps][:positionName]="Your Position"
default[:pywps][:role]="Your role"
default[:pywps][:deliveryPoint]="Street"
default[:pywps][:city]="City"
default[:pywps][:postalCode]="000 00"
default[:pywps][:country]="eu"
default[:pywps][:electronicMailAddress]="login@server.org"
default[:pywps][:providerSite]="http://foo.bar"
default[:pywps][:phoneVoice]="False"
default[:pywps][:phoneFacsimile]="False"
default[:pywps][:administrativeArea]="False"
default[:pywps][:hoursofservice]="0:00-24:00"
default[:pywps][:contactinstructions]="none"

#server
default[:pywps][:maxoperations]="30"
default[:pywps][:maxinputparamlength]="1024"
default[:pywps][:maxfilesize]="3mb"
default[:pywps][:tempPath]="/tmp"
default[:pywps][:processesPath]=""
default[:pywps][:outputUrl]="http://localhost/wps/wpsoutputs"
default[:pywps][:outputPath]="/var/www/wps/wpsoutputs"
default[:pywps][:logFile]=""
default[:pywps][:logLevel]="INFO"

#grass
default[:pywps][:path]="/usr/lib/grass/bin/:/usr/lib/grass/scripts/"
default[:pywps][:addonPath]=""
default[:pywps][:grassVersion]="6.2.1"
default[:pywps][:gui]="text"
default[:pywps][:gisbase]="/usr/lib/grass/"
default[:pywps][:ldLibraryPath]="/usr/lib/grass/lib"
default[:pywps][:gisdbase]="grassdata/"

#mapserver
default[:pywps][:mapserveraddress]="http://localhost/cgi-bin/mapserv"
default[:pywps][:projdatapath]="/usr/lib/proj/"
default[:pywps][:projs]="epsg:4326,epsg:102067,epsg:3059,epsg:900913"
