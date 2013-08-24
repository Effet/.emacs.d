;;; init.el --- Emacs configuration file

(add-to-list 'load-path user-emacs-directory)

;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; for the first run.
(unless package-archive-contents
  (package-refresh-contents))

;; must installs
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      '(expand-region ibuffer-vc ido-ubiquitous magit multiple-cursors smex
                      undo-tree use-package ))

;; `use-package' to maintain packages
(require 'use-package)

;;; equip defuns
(defvar defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'setup-editing)
(require 'setup-font)
(require 'setup-theme)
(require 'setup-ido)
(require 'setup-dired)
(require 'setup-ibuffer)

(require 'setup-magit)
(require 'setup-org)

(require 'setup-yasnippet)
(require 'setup-auto-complete)
(require 'setup-helm)
(require 'setup-smartparens)

;; extras settings
(require 'extras)
(require 'setup-eshell)
(require 'setup-term)
(require 'setup-python)
(require 'coding)
(require 'locales)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; init.el ends here
