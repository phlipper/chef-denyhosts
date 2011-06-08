# DESCRIPTION

Installs the denyhosts package from (http://denyhosts.sourceforge.net/). Currently only targeting Ubuntu platform. It's not complicated and would work on other platforms, but that can come later.


# REQUIREMENTS

## Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu
* Debian


# ATTRIBUTES

## `admin_email`

Email address that will receive notifications.

The default is `root@localhost`.

## `smtp_host`

SMTP server hostname to use for outgoing mail.

The default is `localhost`.

## `smtp_port`

SMTP server port number to use for outgoing mail.

The default is `25`.

## `smtp_from`

Email address that will be used to send outgoing mail

The default is `denyhosts@localhost`.

## `allowed_hosts`

Hostnames that will always be allowed to connect.

The default is `[]`.


# USAGE

This cookbook installs denyhosts if not present and pulls updates if it is installed on the system.


# LICENSE and AUTHOR:

Author:: Phil Cohen (<github@phlippers.net>)

Copyright:: 2011, Phil Cohen

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.