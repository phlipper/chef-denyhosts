maintainer       "Phil Cohen"
maintainer_email "github@phlippers.net"
license          "Apache 2.0"
description      "Installs denyhosts"
version          "0.1"

%w{ubuntu debian}.each do |os|
  supports os
end

attribute "denyhosts/admin_email",
  :display_name => "Admin email address",
  :description  => "Email address that will receive notifications",
  :default      => "root@localhost"

attribute "denyhosts/smtp_host",
  :display_name => "SMTP server hostname",
  :description  => "SMTP server hostname to use for outgoing mail",
  :default      => "localhost"

attribute "denyhosts/smtp_port",
  :display_name => "SMTP server port",
  :description  => "SMTP server port number to use for outgoing mail",
  :default      => "25"

attribute "denyhosts/smtp_from",
  :display_name => "SMTP from address",
  :description  => "Email address that will be used to send outgoing mail",
  :default      => "denyhosts@localhost"

attribute "denyhosts/allowed_hosts",
  :display_name => "Allowed hosts",
  :description  => "Hostnames that will always be allowed to connect",
  :default      => []

attribute "denyhosts/secure_log",
  :display_name => "Secure log location",
  :description  => "The log file that contains sshd logging info.",
  :type => "string",
  :calculated => true
