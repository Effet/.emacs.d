;; load paths
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; load packages (need connect network)
(require 'init-packages)
(require 'init-settings)

(require 'auto-complete-settings)
