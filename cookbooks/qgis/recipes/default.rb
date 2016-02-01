#
# Cookbook Name:: qgis
# Recipe:: default
#
# Copyright 2016, Ian Turton, Astun
#

apt_repository "ubuntugis" do
  uri "http://ppa.launchpad.net/ubuntugis/ubuntugis/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "314DF160"
end
apt_repository "ubuntugis unstable" do
  uri "http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "314DF160"
end

apt_repository "qgis" do
  case node[:qgis][:version]
  when 'latest'
      uri "http://qgis.org/ubuntugis"
  when 'ltr'
      uri "http://qgis.org/ubuntugis-ltr"
  when 'dev', 'nightly'
      uri "http://qgis.org/ubuntugis-nightly"
  end
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "3FF5FFCAD71472C4"
end


package ['qgis', 'python-qgis']
