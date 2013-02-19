;; Personal Information
(setq user-full-name "Catl Sing"
      user-mail-address "nesuadark@gmail.com")


(setq personal-lisp-directory
      (concat user-emacs-directory
              (convert-standard-filename "site-lisp/")))

(add-to-list 'load-path personal-lisp-directory)
(add-to-list 'load-path (concat personal-lisp-directory "plugins/"))

(setq package-user-dir (concat personal-lisp-directory "elpa/"))
(setq personal-snippet-directory
      (concat user-emacs-directory "snippets/"))

(setq custom-file (concat personal-lisp-directory "custom.el"))


;; Personal Stuffs
(require 'personal-package-sync)
(require 'personal-ui)
(require 'personal-config)
(require 'my-acm-special-conf)
(require 'personal-completion)
(require 'personal-yasnippet)
(require 'personal-eshell)
(require 'personal-org-mode)
(require 'personal-auctex)
;; (require 'setup-hippie)
