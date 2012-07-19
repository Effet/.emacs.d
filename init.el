;;; init.el --- First step for every thing.
;; 
;; Copyright (C) 2012 n4k0master <nesuadark@gmail.com>
;; 
;; Created: Thu Jul 19 20:52:37 2012 (+0800)
;; Last-Updated: Thu Jul 19 20:53:18 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; load paths
(setq dot-emacs-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dot-emacs-dir)

;; Load `elpa' to sync my packages. (network needed)
(require 'pkg-sync)

;; General Settings
(require 'init-conf)
(require 'my-acm-special-conf)

;; Load `eshell' stuff.
(require 'esh-conf)

;; ;; Load `auto-complete', `auto-complete-clang', `yasnippet'.
;; (require 'ac-conf)

;; ;; Load `AucTeX'
;; (require 'auctex-conf)

;; ;; Things for `test'
;; (require 'test)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
