#
# Cookbook Name:: pywps
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'gdal'
include_recipe 'grass'
include_recipe 'mapserver'

python_runtime 'pywps' do
    version '2.7'
    options pip_version: true
end

# R
