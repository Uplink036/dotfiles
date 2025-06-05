# Dotfiles
## Introduction 
### My personal dotfiles

## How to run
To start you need to have the following packages.
- git
- make
- curl

Which can be done with the following command:

```sudo apt install git make curl```

Then you can download this repo using:

```git clone https://github.com/Uplink036/dotfiles```

### VSCode

VSCode is a nice code editor i use. To download the repostiry sign and install it through upt, you can run the `install_code.sh` script.

Tips: Move primary bar to the right.

### Gnome Exstension

GNOME Exstensions provide many useful utils for Ubuntu, such as caffiene. 

### BASH
Run make bash to place the config in the right place. Next time you open your terminal every keybinding and tmux will be in place. 

### TMUX
Run `make tmux` to place the config in the right place. Then you have install the plugins by pressing `prefix` + `I`, which in our case is `ctrl`+`space`+`I`.

### ZOXIDE
Run `./install_zoxide` and make sure you have done the bash part of this script. 

### How to get github ssh key
Infromation can be found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Thanks to and inspired by

* [Andreas Bauer](https://github.com/andreas-bauer) and his [dotfiles](https://github.com/andreas-bauer/dotfiles.git)
* [Dreams of Code](https://github.com/dreamsofcode-io)

## License

Copyright (c) 2025 Oliver Sjödin

Licensed under the [MIT license](LICENSE).
