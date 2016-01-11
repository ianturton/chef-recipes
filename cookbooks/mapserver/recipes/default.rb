#
# Cookbook Name:: gdal
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

#add repo if needed 
#

apt_repository "ubuntu-unstable" do
  uri "http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "314DF160"
end

# install package

package 'cgi-mapserver'
package 'python-mapscript'
package 'mapserver-bin'
#package 'libmapserver-dev'

