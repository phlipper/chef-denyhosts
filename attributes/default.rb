#
# Cookbook Name:: denyhosts
# Attributes:: default
#
# Author:: Phil Cohen <github@phlippers.net>
#
# Copyright 2011-2013, Phil Cohen
#

default["denyhosts"]["admin_email"]   = "root@localhost"
default["denyhosts"]["smtp_host"]     = "localhost"
default["denyhosts"]["smtp_port"]     = "25"
default["denyhosts"]["smtp_from"]     = "denyhosts@localhost"
default["denyhosts"]["allowed_hosts"] = []
default["denyhosts"]["secure_log"]    = case node['platform_family']
                                        when "rhel", "fedora"
                                          "/var/log/secure"
                                        when "freebsd", "openbsd"
                                          "/var/log/auth.log"
                                        when "suse"
                                          "/var/log/messages"
                                        when "mac_os_x"
                                          "/private/var/log/asl.log"
                                        when "debian"
                                          "/var/log/auth.log"
                                        else
                                          "/var/log/auth.log"
                                        end
default["denyhosts"]["lock_file"]     = case node['platform_family']
                                        when "rhel", "fedora"
                                          "/var/lock/subsys/denyhosts"
                                        when "debian"
                                          "/var/run/denyhosts.pid"
                                        else
                                          "/tmp/denyhosts.lock"
                                        end
