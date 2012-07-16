;; load paths
(setq base-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path base-dir)

;; Load `el-get', `elpa'. (needs to connect network)
(require 'pkg-sync)

;; General Settings
(require 'init-conf)
(require 'my-acm-special-conf)

;; Load `eshell' stuff.
(require 'esh-conf)

;; Load `auto-complete', `auto-complete-clang', `yasnippet'.
(require 'ac-conf)

;; Load `AucTeX'
(require 'auctex-conf)

;; Things for `test'
(require 'test)
