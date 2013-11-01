#
# Cookbook Name:: denyhosts
# Attributes:: default
#
# Author:: Phil Cohen <github@phlippers.net>
# Author:: Evan Gilman <evan@pagerduty.com>
#
# Copyright 2011-2013, Phil Cohen
#

default["denyhosts"]["allowed_hosts"]   = []
default["denyhosts"]["admin_email"]     = "root@localhost"
default["denyhosts"]["smtp_host"]       = "localhost"
default["denyhosts"]["smtp_port"]       = 25
default["denyhosts"]["smtp_from"]       = "denyhosts@localhost"
default["denyhosts"]["work_dir"]        = "/var/lib/denyhosts"
default["denyhosts"]["purge_deny"]      = nil
default["denyhosts"]["purge_threshold"] = 0
default["denyhosts"]["lock_file"]       = case node['platform_family']
                                          when "rhel", "fedora"
                                            "/var/lock/subsys/denyhosts"
                                          when "debian"
                                            "/var/run/denyhosts.pid"
                                          else
                                            "/tmp/denyhosts.lock"
                                          end
default["denyhosts"]["secure_log"]      = case node['platform_family']
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



default["denyhosts"]["config"]["admin_email"]   = nil #node["denyhosts"]["admin_email"]
default["denyhosts"]["config"]["smtp_host"]     = nil #node["denyhosts"]["smtp_host"]
default["denyhosts"]["config"]["smtp_port"]     = nil #node["denyhosts"]["smtp_port"]
default["denyhosts"]["config"]["smtp_subject"]  = "DenyHosts Report"
default["denyhosts"]["config"]["smtp_from"]     = nil #node["denyhosts"]["smtp_from"]
#default["denyhosts"]["config"]["smtp_username"] = nil
#default["denyhosts"]["config"]["smtp_password"] = nil
#default["denyhosts"]["config"]["smtp_date_format"] = "%a, %d %b %Y %H:%M:%S %z"


# SECURE_LOG: the log file that contains sshd logging info
default["denyhosts"]["config"]["secure_log"]    = nil #node["denyhosts"]["secure_log"]
default["denyhosts"]["config"]["lock_file"]     = nil #node["denyhosts"]["lock_file"]

# HOSTS_DENY: the file which contains restricted host access information
default["denyhosts"]["config"]["hosts_deny"] = "/etc/hosts.deny"

# PURGE_DENY: removed HOSTS_DENY entries that are older than this time
#             when DenyHosts is invoked with the --purge flag
#             format is: i[dhwmy]
default["denyhosts"]["config"]["purge_deny"] = nil #node["denyhosts"]["purge_deny"]

# PURGE_THRESHOLD: defines the maximum times a host will be purged.
# Once this value has been exceeded then this host will not be purged.
# Setting this parameter to 0 (the default) disables this feature.
default["denyhosts"]["config"]["purge_threshold"] = nil #node["denyhosts"]["purge_threshold"]

# BLOCK_SERVICE: the service name that should be blocked in HOSTS_DENY
# man 5 hosts_access for details
default["denyhosts"]["config"]["block_service"] = "ALL"

# DENY_THRESHOLD_INVALID: block each host after the number of failed login
# attempts has exceeded this value.  This value applies to invalid
# user login attempts (eg. non-existent user accounts)
default["denyhosts"]["config"]["deny_threshold_invalid"] = 3

# DENY_THRESHOLD_VALID: block each host after the number of failed
# login attempts has exceeded this value.  This value applies to valid
# user login attempts (eg. user accounts that exist in /etc/passwd) except
# for the "root" user
default["denyhosts"]["config"]["deny_threshold_valid"] = 10

# DENY_THRESHOLD_ROOT: block each host after the number of failed
# login attempts has exceeded this value.  This value applies to
# "root" user login attempts only.
default["denyhosts"]["config"]["deny_threshold_root"] = 1

# DENY_THRESHOLD_RESTRICTED: block each host after the number of failed
# login attempts has exceeded this value.  This value applies to
# usernames that appear in the WORK_DIR/restricted-usernames file only.
default["denyhosts"]["config"]["deny_threshold_restricted"] = 1

# WORK_DIR: the path that DenyHosts will use for writing data to
# (it will be created if it does not already exist).
default["denyhosts"]["config"]["work_dir"] = nil #node["denyhosts"]["work_dir"]

# SUSPICIOUS_LOGIN_REPORT_ALLOWED_HOSTS=YES|NO
# If set to YES, if a suspicious login attempt results from an allowed-host
# then it is considered suspicious.  If this is NO, then suspicious logins
# from allowed-hosts will not be reported.  All suspicious logins from
# ip addresses that are not in allowed-hosts will always be reported.
default["denyhosts"]["config"]["suspicious_login_report_allowed_hosts"] = "YES"

# HOSTNAME_LOOKUP=YES|NO
# If set to YES, for each IP address that is reported by Denyhosts,
# the corresponding hostname will be looked up and reported as well
# (if available).
default["denyhosts"]["config"]["hostname_lookup"] = "YES"

# SYSLOG_REPORT=YES|NO
# If set to yes, when denied hosts are recorded the report data
# will be sent to syslog (syslog must be present on your system).
#default["denyhosts"]["config"]["syslog_report"] = "NO"

# ALLOWED_HOSTS_HOSTNAME_LOOKUP=YES|NO
# If set to YES, for each entry in the WORK_DIR/allowed-hosts file,
# the hostname will be looked up.
#default["denyhosts"]["config"]["allowed_hosts_hostname_lookup"] = "NO"

# AGE_RESET_VALID: Specifies the period of time between failed login
# attempts that, when exceeded will result in the failed count for
# this host to be reset to 0.  This value applies to login attempts
# to all valid users (those within /etc/passwd) with the
# exception of root.
#default["denyhosts"]["config"]["age_reset_valid"] = "5d"

# AGE_RESET_ROOT: Specifies the period of time between failed login
# attempts that, when exceeded will result in the failed count for
# this host to be reset to 0.  This value applies to all login
# attempts to the "root" user account.
#default["denyhosts"]["config"]["age_reset_root"] = "25d"

# AGE_RESET_RESTRICTED: Specifies the period of time between failed login
# attempts that, when exceeded will result in the failed count for
# this host to be reset to 0.  This value applies to all login
# attempts to entries found in the WORK_DIR/restricted-usernames file.
#default["denyhosts"]["config"]["age_reset_restricted"] = "25d"

# AGE_RESET_INVALID: Specifies the period of time between failed login
# attempts that, when exceeded will result in the failed count for
# this host to be reset to 0.  This value applies to login attempts
# made to any invalid username (those that do not appear
# in /etc/passwd).
#default["denyhosts"]["config"]["age_reset_invalid"] = "10d"

# RESET_ON_SUCCESS: If this parameter is set to "yes" then the
# failed count for the respective ip address will be reset to 0
# if the login is successful.
#default["denyhosts"]["config"]["reset_on_success"] = "NO"

# PLUGIN_DENY: If set, this value should point to an executable
# program that will be invoked when a host is added to the
# HOSTS_DENY file.  This executable will be passed the host
# that will be added as its only argument.
#default["denyhosts"]["config"]["plugin_deny"] = "/usr/bin/true"

# PLUGIN_PURGE: If set, this value should point to an executable
# program that will be invoked when a host is removed from the
# HOSTS_DENY file.  This executable will be passed the host
# that is to be purged as its only argument.
#default["denyhosts"]["config"]["plugin_purge"] = "/usr/bin/true"

# USERDEF_FAILED_ENTRY_REGEX: if set, this value should contain
# a regular expression that can be used to identify additional
# hackers for your particular ssh configuration.  This functionality
# extends the built-in regular expressions that DenyHosts uses.
# This parameter can be specified multiple times.
#default["denyhosts"]["config"]["userdef_failed_entry_regex"] = nil

# DAEMON_LOG: when DenyHosts is run in daemon mode (--daemon flag)
# this is the logfile that DenyHosts uses to report its status.
# To disable logging, leave blank.
default["denyhosts"]["config"]["daemon_log"] = "/var/log/denyhosts"
#default["denyhosts"]["config"]["daemon_log_time_format"] = "%b %d %I:%M:%S"

# DAEMON_SLEEP: when DenyHosts is run in daemon mode (--daemon flag)
# this is the amount of time DenyHosts will sleep between polling
# the SECURE_LOG.
default["denyhosts"]["config"]["daemon_sleep"] = "30s"

# DAEMON_PURGE: How often should DenyHosts, when run in daemon mode,
# run the purge mechanism to expire old entries in HOSTS_DENY
# This has no effect if PURGE_DENY is blank.
default["denyhosts"]["config"]["daemon_purge"] = "1h"


# SYNC_SERVER: The central server that communicates with DenyHost
# daemons.  Currently, denyhosts.net is the only available server
# however, in the future, it may be possible for organizations to
# install their own server for internal network synchronization
# To enable synchronization, you must uncomment the following line
#default["denyhosts"]["config"]["sync_server"] = "http://xmlrpc.denyhosts.net:9911"

# SYNC_INTERVAL: the interval of time to perform synchronizations if
# SYNC_SERVER has been uncommented.
#default["denyhosts"]["config"]["sync_interval"] = "1h"

# SYNC_UPLOAD: allow your DenyHosts daemon to transmit hosts that have
# been denied?  This option only applies if SYNC_SERVER has
# been uncommented.
#default["denyhosts"]["config"]["sync_upload"] = "YES"

# SYNC_DOWNLOAD: allow your DenyHosts daemon to receive hosts that have
# been denied by others?  This option only applies if SYNC_SERVER has
# been uncommented.
#default["denyhosts"]["config"]["sync_download"] = "YES"

# SYNC_DOWNLOAD_THRESHOLD: If SYNC_DOWNLOAD is enabled this parameter
# filters the returned hosts to those that have been blocked this many
# times by others.  That is, if set to 1, then if a single DenyHosts
# server has denied an ip address then you will receive the denied host.
#default["denyhosts"]["config"]["sync_download_threshold"] = 3
