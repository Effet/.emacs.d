;; load paths
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;(add-to-list 'load-path "~/.emacs.d")
(require 'init-packages)
(require 'init-settings)
(require 'init-mode-settings)
