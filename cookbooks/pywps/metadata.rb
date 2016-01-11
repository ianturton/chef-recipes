name             'pywps'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures pywps'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'poise-python'
depends 'apt'
depends 'apache2'
depends 'gdal'
depends 'grass'
depends 'mapserver'
