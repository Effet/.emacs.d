(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(defvar vendor-dir
  (expand-file-name "vendor" user-emacs-directory))

(add-to-list 'load-path vendor-dir)

(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;;; Packages
;; (require 'cask "~/.cask/cask.el")
(require 'cask)
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(require 'use-package)

;;; Functions
(mapc 'load (directory-files "~/.emacs.d/functions" t "\\w+"))

;;; Core
(load "init-core")
(load "init-locale")
(load "init-appareance")
(load "init-bindings")
(require 'init-osx)

;;; Modules
(load "init-abbrev")
(load "init-ack-grep")
(load "init-auto-complete")
(load "init-cedet")
(load "init-company")
(load "init-dired")
(load "init-emacs-lisp-mode")
(load "init-eshell")
(load "init-gtags")
(load "init-helm")
(load "init-ibuffer")
(load "init-ido")
(load "init-magit")
(load "init-org")
(load "init-smartparens")
(load "init-smex")
(load "init-term")
(load "init-vc")
(load "init-window")
(load "init-yasnippet")
(load "init-misc")

;;; Programming Languages
(load "init-geiser")
(load "init-cc-mode")
;; (load "init-java-mode")
(load "init-js-mode")
(load "init-latex-mode")
(load "init-python-mode")
(load "init-web-mode")
(require 'init-rust)
(require 'init-md)
