#
# Cookbook Name:: qgis
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
apt_repository "ubuntu-unstable" do
  uri "http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "314DF160"
end

apt_repository "qgis repo" do
  case node[:qgis][:version]
  when 'latest'
      uri "http://qgis.org/debian"
  when 'ltr'
      uri "http://qgis.org/debian-ltr"
  when 'dev', 'nightly'
      uri "http://qgis.org/debian-nightly"
  end
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "3FF5FFCAD71472C4"
end

package 'qgis' 
package 'python-qgis' 
package 'qgis-plugin-grass' 

