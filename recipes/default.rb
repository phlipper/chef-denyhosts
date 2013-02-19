#
# Cookbook Name:: denyhosts
# Recipe:: default
#
# Copyright 2011-2013, Phil Cohen <github@phlippers.net>

package "denyhosts"

template "/etc/denyhosts.conf" do
  source "denyhosts.conf.erb"
  owner  "root"
  group  "root"
  action :create
  notifies :restart, "service[denyhosts]", :immediately
end

directory node["denyhosts"]["work_dir"] do
  owner "root"
  group "root"
  mode 00755
  action :create
  recursive true
end

template File.join(node["denyhosts"]["work_dir"], "allowed-hosts") do
  source "allowed-hosts.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  action :create
end

service "denyhosts" do
  supports :restart => true
  action [ :enable, :start ]
end
