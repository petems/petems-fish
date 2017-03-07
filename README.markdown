# fish Puppet Module
[![Build Status](https://travis-ci.org/petems/petems-fish.svg?branch=master)](https://travis-ci.org/petems/petems-fish)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with fish](#setup)
    * [What fish affects](#what-fish-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with fish](#beginning-with-fish)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module for installing, configuring, and managing [Fish](https://fishshell.com/), "fish is a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family."

> Finally, a command line shell for the 90s

## Module Description

This module manages the installation of Fish.

If you'd prefer, you can also disable the repo after the agent's been installed, or opt out of repo management altogether.

## Setup

### What fish affects

By default, this module will:
* Set up the package repository
* Install the Fish package

### Beginning with fish

Repositories are maintained seperately:

* Ubuntu: https://launchpad.net/~fish-shell/+archive/ubuntu/release-2
* Debian, Redhat, CentOS, Fedora: https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A2&package=fish

Full docs are avaliable here: https://fishshell.com/docs/current/index.html

## Usage

This module includes a single class:
```puppet
include '::fish'
```

You'll more than likely want to provide the appropriate values for your setup.

To opt out of repo management altogether, you'd specify it like so:
```puppet
class { '::fish':
  manage_repo => false,
}
```

For more detailed information about parameters, you can read the [docs](https://petems.github.io/petems-fish/fish.html)

## Limitations

### Setting the root users shell

On Debian family systems, you can get dependancy loops when trying to order to set the root shell:

```
Error: Failed to apply catalog: Found 1 dependency cycle:
(Exec[fish-add-apt-repository-ppa:fish-shell/release-2] => Class[Fish::Repo::Ubuntu] => Class[Fish::Repo] => Class[Fish::Repo] => Class[Fish::Install] => Package[fish] => Class[Fish::Install] => Class[Fish] => Class[Fish] => User[root] => Exec[fish-add-apt-repository-ppa:fish-shell/release-2])
Try the '--graph' option and opening the resulting '.dot' file in OmniGraffle or GraphViz
```

This is because there is an auto-requirement for the files created or executables run on the root user existing. So the root user must exist so the apt source file can be created, but the root user also needs to wait for the package to be installed.

This only affects the `apt` repos, as `yumrepos` use a custom `inifile` type, so the file doesn't need to exist for it to edit it.

There's unfortunatly no easy solution, the only way would be to have a custom fact that determines if the `/usr/bin/fish` path exists on the system _or_ a fact that determines the package is already installed.

* Arch support is currently not implemented.

## Development

If you'd like to other features or anything else, check out the contributing guidelines in CONTRIBUTING.md.
