#Path to your oh-my-zsh installation.


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# currently liking: 'miloshadzic', 'blinks', 'smt', 'dogenpunk'
ZSH_THEME="af-magic"

 #Example aliases
 export PATH="./node_modules/.bin:$PATH"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias wp="webpack --watch"


# Mac Helpers
alias show_hidden="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"

# SICP Racket Bullshit
alias racket="racket -i -p neil/sicp -l xrepl"
plugins=(git osx tmux github fasd history-substring-search zsh-syntax-highlighting nyan)

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
# User configuration

export PATH=$PATH:"/usr/local/bin:/usr/local/bin/git:/usr/local/heroku/bin:/Users/matt/.rvm/gems/ruby-2.1.1/bin:/Users/matt/.rvm/gems/ruby-2.1.1@global/bin:/Users/matt/.rvm/rubies/ruby-2.1.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/matt/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu' -c 'nnoremap i <nop>' -"

export EDITOR="/usr/bin/vim"

alias cdh='cd ~/.homesick/repos/home-files/home'
alias hup='cdh && sh ~/.homesick/repos/home-files/commit.sh && source ~/.zshrc && cd - && clear'


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Config for 'z': http://jilles.me/badassify-your-terminal-and-shell/
. `brew --prefix`/etc/profile.d/z.sh
source /usr/local/share/zsh/functions
alias s="~/chat.txt << "

alias rubes="ruby -run -ehttpd . -p8000"
alias mattgrok="ngrok -subdomain=matt 8000"

bindkey -v

# alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
#alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
