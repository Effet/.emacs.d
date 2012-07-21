;;; init.el --- First step for every thing.
;; 
;; Copyright (C) 2012 n4k0master <nesuadark@gmail.com>
;; 
;; Created: Thu Jul 19 20:52:37 2012 (+0800)
;; Last-Updated: Sat Jul 21 08:46:05 2012 (+0800)
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

;; ;; Load `AucTeX'
;; (require 'auctex-conf)

;; ;; Things for `test'
;; (require 'test)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
