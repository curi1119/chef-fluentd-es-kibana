# -*- coding: utf-8 -*-
#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# execute "update apt sources" do
#   command "apt-get update"
#   action :run
# end


# install default package
%w{language-pack-ja build-essential ntp git curl dstat unzip libxml2-dev libxslt1-dev zlib1g-dev sysv-rc-conf emacs23 chkrootkit sysstat mysql-client-5.5 libmysqlclient-dev liblwp-useragent-determined-perl ruby1.9.3 redis-tools}.each do |pkg|
  package pkg do
    action :install
  end
end

# set default locale to ja_JP.UTF-8
bash "set default locale" do
  not_if { ::File.read('/etc/default/locale') == "LANG=ja_JP.UTF-8\n" }
  code <<-EOC
     update-locale LANG=ja_JP.UTF-8
  EOC
end

# set localtime to JST
bash "set timezone" do
  not_if 'diff /usr/share/zoneinfo/Asia/Tokyo /etc/localtime'
  code <<-EOC
    cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  EOC
end

service "ntp" do
  action [ :enable, :start ]
end

bash "set right time" do
  not_if 'which ntpq'
  code <<-EOC
    ntpdate 0.ubuntu.pool.ntp.org
  EOC
end


directory "/var/www" do
  owner "root"
  group "root"
  mode 0755
  action :create
end
