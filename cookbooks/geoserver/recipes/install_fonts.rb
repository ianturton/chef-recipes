#fonts_rpm="http://www.my-guides.net/en/images/stories/fedora12/msttcore-fonts-2.0-3.noarch.rpm"
#if platform_family?('rhel') do
#  fonts_rpm="msttcore-fonts-2.0-3.noarch.rpm"
#  fonts_name = ::File.basename("#{fonts_rpm}")
#  fonts_local_path = ::File.join(Chef::Config[:file_cache_path],fonts_name)
#  fonts_tmp = ::File.join(Chef::Config[:file_cache_path],"fonts")
#
#  remote_file fonts_local_path do
#      source fonts_rpm
#      notifies :run, 'execute[install_fonts]', :immediately
#  end 
#  #cookbook_file fonts_local_path do
#      #source fonts_rpm
#      #notifies :run, 'execute[install_fonts]', :immediately
#  #end
#  execute "install_fonts" do
#      repo_name = ::File.basename(fonts_local_path,".rpm")
#      not_if "rpm -qi #{repo_name}"
#      command "rpm -Uvh #{fonts_local_path}"
#  end
#
#end

#if platform_family?('debian') do
  include_recipe 'install_repo'

  package 'ttf-msttcorefonts-installer' do
    action :install
  end

#end

