;;; init.el --- First step for every thing.
;; 
;; Author: n4k0master
;; Mail: nesuadark@gmail.com
;; 
;; Created: Thu Jul 19 20:52:37 2012 (+0800)
;; Last-Updated: Tue Jul 24 19:00:38 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; load paths
(setq dot-emacs-dir "~/.emacs.d/")
(add-to-list 'load-path dot-emacs-dir)
(add-to-list 'load-path (concat dot-emacs-dir "/plugins/"))

;; Load `elpa' to sync my packages. (network needed)
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

;; ;; Things for `test'
;; (require 'test)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
