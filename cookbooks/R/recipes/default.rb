#
# Cookbook Name:: R
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

apt_repository "cran-rstudio" do
  uri "http://cran.rstudio.com/bin/linux/ubuntu"
  distribution node['lsb']['codename']
  #components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E084DAB9"
end

package 'r-base'
