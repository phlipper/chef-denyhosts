#
# Cookbook Name:: denyhosts
# Attributes:: default
#
# Copyright 2011, Phil Cohen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
