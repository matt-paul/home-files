# Home dotfiles

This contains all my home file configurations (in particular my vim setup) so that I can share it across computers.

It is designed to work with [homesick](https://github.com/technicalpickles/homesick) which handles all my symlinking for me automatically. Much of the configuration is inspired by [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles).

To install, first install [homesick](https://github.com/technicalpickles/homesick):

    gem install homesick

Next, use the homesick command to clone this repository:

    homesick clone https://github.com/hvenables/home-files.git

you can now link its contents into your home dir:

    homesick symlink home-files

run the rc file to get vundler installed:

    homesick rc home-files

and restart your terminal.

You can now use the `hup` command to update your home files and install your vim bundles automatically.
