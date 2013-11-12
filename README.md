# chef-denyhosts [![Build Status](https://travis-ci.org/phlipper/chef-denyhosts.png?branch=master)](https://travis-ci.org/phlipper/chef-denyhosts)

## Description

Installs the denyhosts package from (http://denyhosts.sourceforge.net/). Currently only targeting Ubuntu platform. It's not complicated and would work on other platforms, but that can come later.


## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu
* Debian
* RedHat
* CentOS

### Chef

It is recommended to use a version of Chef `>= 10.16.4` as that is the target of my usage and testing, though this should work with most recent versions.

### Ruby

This cookbook should work on Ruby 1.8.7+ but Ruby 1.9+ is preferred. This cookbook is tested against:

* 1.8.7
* 1.9.2
* 1.9.3


## Usage

This cookbook installs the Denyhosts components if not present, and pulls updates if they are installed on the system.


## Attributes

```ruby
default["denyhosts"]["allowed_hosts"] = []  # Hostnames that will always be allowed to connect.

default["denyhosts"]["config"]["admin_email"]     = "root@localhost"  # Email address that will receive notifications.
default["denyhosts"]["config"]["smtp_host"]       = "localhost"  # SMTP server hostname to use for outgoing mail.
default["denyhosts"]["config"]["smtp_port"]       = "25"  # SMTP server port number to use for outgoing mail.
default["denyhosts"]["config"]["smtp_from"]       = "denyhosts@localhost"  # Email address that will be used to send outgoing mail.
default["denyhosts"]["config"]["smtp_subject"]    = "DenyHosts Report" # Email subject
default["denyhosts"]["config"]["smtp_username"]   = nil # SMTP username for authentication (if any)
default["denyhosts"]["config"]["smtp_password"]   = nil # SMTP password for authentication (if any)
default["denyhosts"]["config"]["smtp_date_format"] = "%a, %d %b %Y %H:%M:%S %z" # Optional custom date format for outgoing mail.
default["denyhosts"]["config"]["work_dir"]        = "/var/lib/denyhosts"  # Working dir for denyhosts daemon.
default["denyhosts"]["config"]["purge_deny"]      = nil  # The time after which a denial should be removed.
default["denyhosts"]["config"]["purge_threshold"] = 0  # The number of times after which a denial becomes permanent.
default["denyhosts"]["config"]["secure_log"]      = case node['platform_family']  # The log file that contains sshd logging info.
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
default["denyhosts"]["config"]["lock_file"]       = case node['platform_family']  # The pid file for the denyhosts daemon.
                                                  when "rhel", "fedora"
                                                    "/var/lock/subsys/denyhosts"
                                                  when "debian"
                                                    "/var/run/denyhosts.pid"
                                                  else
                                                    "/tmp/denyhosts.lock"
                                                  end

default["denyhosts"]["config"]["hosts_deny"] = "/etc/hosts.deny" # Your system's restricted access file
default["denyhosts"]["config"]["block_service"] = "ALL" # Which services to block - see `man 5 hosts_access`
default["denyhosts"]["config"]["deny_threshold_invalid"] = 3 # Block host after X tries on an invalid user.
default["denyhosts"]["config"]["deny_threshold_valid"] = 10 # Block host after X tries on a valid user.
default["denyhosts"]["config"]["deny_threshold_root"] = 1 # Block host after X tries on the root user
default["denyhosts"]["config"]["deny_threshold_restricted"] = 1 # Block host after X tries on users defined as restricted.
default["denyhosts"]["config"]["suspicious_login_report_allowed_hosts"] = "YES" # Report suspsicions logins from allowed hosts?
default["denyhosts"]["config"]["hostname_lookup"] = "YES" # Perform hostname lookup
default["denyhosts"]["config"]["syslog_report"] = "NO" # Send a log line to syslog?
default["denyhosts"]["config"]["allowed_hosts_hostname_lookup"] = "NO" # Look up hostnames in allowed-hosts file?
default["denyhosts"]["config"]["age_reset_valid"] = "5d" # Reset failed login count after X time
default["denyhosts"]["config"]["age_reset_root"] = "25d" # Reset failed login count after X time
default["denyhosts"]["config"]["age_reset_restricted"] = "25d" # Reset failed login count after X time
default["denyhosts"]["config"]["age_reset_invalid"] = "10d" # Reset failed login count after X time
default["denyhosts"]["config"]["reset_on_success"] = "NO" # Reset failed login count after successful login?
default["denyhosts"]["config"]["plugin_deny"] = "/usr/bin/true" # File to execute when a host is denied
default["denyhosts"]["config"]["plugin_purge"] = "/usr/bin/true" # File to execute when a host is purged
default["denyhosts"]["config"]["userdef_failed_entry_regex"] = nil # Optional additional custom REGEX matcher for failed logins.
default["denyhosts"]["config"]["daemon_log"] = "/var/log/denyhosts" # Log file for daemon
default["denyhosts"]["config"]["daemon_log_time_format"] = "%b %d %I:%M:%S" # Time format for daemon log file
default["denyhosts"]["config"]["daemon_sleep"] = "30s" # Sleep interval for daemon log polling
default["denyhosts"]["config"]["daemon_purge"] = "1h" # How often the daemon should run the purge routine
default["denyhosts"]["config"]["sync_server"] = "http://xmlrpc.denyhosts.net:9911" # DenyHosts sync server to use (set to enable)
default["denyhosts"]["config"]["sync_interval"] = "1h" # How often to speak to sync server, if enabled
default["denyhosts"]["config"]["sync_upload"] = "YES" # Share your DenyHosts data?
default["denyhosts"]["config"]["sync_download"] = "YES" # Use public DenyHosts data?
default["denyhosts"]["config"]["sync_download_threshold"] = 3 # When sync is enabled, X hosts must blacklist before you blacklist
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Contributors

Many thanks go to the following [contributors](https://github.com/phlipper/chef-denyhosts/graphs/contributors) who have helped to make this cookbook even better:

* **[@dwradcliffe](https://github.com/dwradcliffe)**
    * add attribute for secure log location
    * restart service when config changes
    * add attribute for lock file
    * add `work_dir` attribute and ensure the working dir exists
* **[@dougbarth](https://github.com/dougbarth)**
    * expose purge settings as attributes
* **[@evan2645](https://github.com/evan2645)**
    * remove `denyhosts.conf` template in favor of a config hash


## License

**chef-denyhosts**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2011-2013/license.html).
* Copyright (c) 2011-2013 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)
* http://phlippers.net/


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/phlipper/chef-denyhosts/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

