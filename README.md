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
default["denyhosts"]["admin_email"]   = "root@localhost"  # Email address that will receive notifications.
default["denyhosts"]["smtp_host"]     = "localhost"  # SMTP server hostname to use for outgoing mail.
default["denyhosts"]["smtp_port"]     = "25"  # SMTP server port number to use for outgoing mail.
default["denyhosts"]["smtp_from"]     = "denyhosts@localhost"  # Email address that will be used to send outgoing mail.
default["denyhosts"]["allowed_hosts"] = []  # Hostnames that will always be allowed to connect.
default["denyhosts"]["secure_log"]    = case node['platform_family']  # The log file that contains sshd logging info.
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


## License

**chef-denyhosts**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2011-2013/license.html).
* Copyright (c) 2011-2013 Phil Cohen (github@phlippers.net) [![endorse](http://api.coderwall.com/phlipper/endorsecount.png)](http://coderwall.com/phlipper)
* http://phlippers.net/
