;;; .emacs --- Emacs dot file.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 22:27:18 2012 (+0800)
;; Last-Updated: Fri Aug 17 20:30:28 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; Personal Information
(setq user-full-name "Catl Sing"
      user-mail-address "nesuadark@gmail.com")


;; Paths Setting
(setq user-emacs-directory "~/dotEmacs/")

(setq personal-lisp-directory
      (concat user-emacs-directory
              (convert-standard-filename "site-lisp/")))

(add-to-list 'load-path personal-lisp-directory)
(add-to-list 'load-path (concat personal-lisp-directory "/plugins/"))

(setq package-user-dir (concat personal-lisp-directory "elpa/"))
(setq personal-snippet-directory
      (concat user-emacs-directory "snippets/"))

(setq custom-file (concat personal-lisp-directory "personal-ui.el"))


;; Personal Stuffs
(require 'personal-package-sync)
(require 'personal-ui)
(require 'personal-config)
(require 'my-acm-special-conf)
(require 'personal-completion)
(require 'personal-eshell)
(require 'personal-org-mode)
(require 'personal-auctex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
