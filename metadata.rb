name             "denyhosts"
maintainer       "Phil Cohen"
maintainer_email "github@phlippers.net"
license          "MIT"
description      "Installs denyhosts"
version          "1.1.0"

%w{ubuntu debian redhat centos}.each do |os|
  supports os
end
