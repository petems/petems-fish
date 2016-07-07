# fish Puppet Module
[![Build Status](https://secure.travis-ci.org/petems/petems-fish.svg)](https://travis-ci.org/petems/petems-fish)

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

For more detailed information about parameters, you can read the [docs](doc/fish.html)

## Limitations

* Arch support is currently not implemented.

## Development

If you'd like to other features or anything else, check out the contributing guidelines in CONTRIBUTING.md.
