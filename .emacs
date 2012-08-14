;;; init.el --- First step for every thing.
;; 
;; Author: n4k0master
;; Mail: nesuadark@gmail.com
;; 
;; Created: Thu Jul 19 20:52:37 2012 (+0800)
;; Last-Updated: Tue Aug 14 18:47:28 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; load paths

(setq user-emacs-directory "~/dotEmacs/")

(setq personal-lisp-directory
      (concat user-emacs-directory
              (convert-standard-filename "site-lisp/")))

(add-to-list 'load-path personal-lisp-directory)
(add-to-list 'load-path (concat personal-lisp-directory "/plugins/"))

(setq custom-file (concat personal-lisp-directory "personal-ui.el"))
(setq package-user-dir (concat user-emacs-directory "elpa/"))


(require 'personal-package-sync)
(require 'personal-ui)
(require 'personal-config)
(require 'my-acm-special-conf)
(require 'personal-completion)
(require 'personal-eshell)
(require 'personal-org-mode)
(require 'personal-auctex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
