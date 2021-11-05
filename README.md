# Dotfiles
<div align="center">
    <img alt="Github" src="https://img.shields.io/github/license/lombervid/dotfiles?logo=github&style=flat-square">
    <img alt="Arch Linux" src="https://img.shields.io/badge/Arch-Linux-blue?style=flat-square&logo=archlinux">
</div>
<br>

This repository contains my dotfiles and system setup using advance [Dotbot](https://github.com/anishathalye/dotbot) configuration.

The structure of this repository is heavily inspired by [ecarlson94](https://github.com/ecarlson94/userspace), [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).



## Table of Contents
<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
    - [For installing a predefined profile:](#for-installing-a-predefined-profile)
    - [For installing single configurations:](#for-installing-single-configurations)
- [Contents](#contents)
    - [Profiles](#profiles)
    - [Configs](#configs)
- [License](#license)

<!-- /TOC -->

## Dependencies
- git

## Installation

```bash
~$ git clone --recursive https://github.com/lombervid/dotfiles.git ~/.dotfiles
~$ cd ~/.dotfiles
```

### For installing a predefined profile:

```bash
~/.dotfiles$ ./install-profile <profile> [<configs...>]
```
See [config/profiles/](./config/profiles) for available profiles


### For installing single configurations:

```bash
~/.dotfiles$ ./install-module <configs...>
```
See [config/modules/](./config/modules) for available modules

_*Note:*_ Any module can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

## Contents

### Profiles
<pre>
config/profiles
├── <a href="./config/profiles/exampleOS1" title="exampleOS1">exampleOS1</a>
└── <a href="./config/profiles/exampleOS2" title="exampleOS2">exampleOS2</a>
</pre>

### Modules
<pre>
config
├── <a href="./config/base.yaml" title="base.yaml">base.yaml</a>
└── modules
    ├── <a href="./config/modules/example-module-1.yaml" title="example-module-1.yaml">example-module-1.yaml</a>
    └── <a href="./config/modules/example-module-2.yaml" title="example-module-2.yaml">example-module-2.yaml</a>
</pre>
