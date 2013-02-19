# dotEmacs

My personal emacs configs (some copy from other's).

## Installation
    git clone git@github.com:hienke/dotEmacs.git ~/dotEmacs
    [[ -f ~/.emacs ]] && mv ~/.emacs{,.bak}
    cp ~/dotEmacs/.emacs ~/.emacs

## Directory structure
    |-- site-lisp/
    |   |-- personal-package-sync.el
    |   |-- personal-ui.el
    |   |-- personal-config.el
    |   |-- my-acm-special-conf.el
    |   |-- personal-completion.el
    |   |-- personal-yasnippet.el
    |   |-- personal-eshell.el
    |   |-- personal-org-mode.el
    |   `-- personal-auctex.el
    `-- snippits/