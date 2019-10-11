# linux-config
Collection of Linux configuration files

## Usage

Clone the repository and replace local configuration files with symlinks to the repo files. Getting the latest files is then just down to doing a `git pull` on the repo.

There is only a need to create a symlink to the files that we want to use. If we don't use awesomewm, we don't need to do anything with `rc.lua`.

| file          | linux path                 | description                   |
| ------------- | -------------------------- | ----------------------------- |
| .vimrc        | ~/.vimrc                   | vim settings                  |
| .gitconfig    | ~/.gitconfig               | git global defaults           |
| .xbindkeysrc  | ~/.xbindkeysrc             | custom keyboard mappings      |
| .xmodmap      | ~/.xmodmap                 | different custom keymappings  |
| .zshrc        | ~/.zshrc                   | zsh settings                  |
| .xinitsrc     | ~/.xinitrc                 | system startup script         |
| nvim-init.vim | ~/.config/nvim/init.vim    | neovim init script            |
| kitty.conf    | ~/.config/kitty/kitty.conf | kitty terminal settings       |
| rc.lua        | ~/.config/awesome/rc.lua   | awesomewm settings            |

We can use the provided script to automatically create all the symlinks based on a typical installation. This will not necessarily work for everyone. It will back up any scripts that are replaced by a symlink.

For example, `~/.vimrc` will be backed up to `~/.vimrc.bak`

For `.gitconfig` we need to create `~/.gitconfig.local` that includes our name and email.

~~~gitconfig
[user]
name = Foo Bar
email = foo@bar.com
~~~

For `rc.lua` we need to create `~/.config/awesome/config.lua` to specify which screens map to which keybindings. For example,

~~~lua
local config = {};
config.screenJ = 1
config.screenK = 3
config.screenI = 2

return config
~~~

We can optionally also create `~/.config/awesome/rc.local.lua` to run any additional lua with our `rc.lua`.

## Features

### zsh

zsh is configured with oh-my-zsh and includes support for fzf for reverse history search. Terminal window titles display the current working directory so that jumping to the appropriate window will be easy using `rofi` in conjunction with `awesomewm`.

The current git branch will be displayed automatically as part of the status line where appropriate.

### Git

There are several commands added to make use of `fzf` and make interacting with basic git commands faster and easier, with aliases defined in `.zshrc`.

| command              | alias     | description                                              |
| -------------------- | --------- | -------------------------------------------------------- |
| git-fzf-menu         | gg        | Open menu with these commands                            |
| git-fzf-checkout     | gitc      | Checkout a local branch                                  |
| git-fzf-checkout-all | gitca     | Checkout a local or remote branch                        |
| git-fzf-checkout-tag | gitct     | Checkout a tag                                           |
| git-fzf-delete       | gitd      | Force delete a branch                                    |
| git-fzf-merge        | gitm      | Merge a branch into the current branch                   |
| git-fzf-merge-tag    | gitmt     | Merge a tag into the current branch                      |
| git-fzf-merge-squash | gitms     | Merge and squash a branch into the current branch        |
| git-github-push      | githubp   | Push the current branch to github, setting the upstream  |
