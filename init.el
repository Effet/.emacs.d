;;; init.el --- Emacs configuration file

(add-to-list 'load-path user-emacs-directory)

;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'setup-package)

;; ;;; equip defuns
;; (defvar defuns-dir (expand-file-name "defuns" user-emacs-directory))
;; (dolist (file (directory-files defuns-dir t "\\w+"))
;;   (when (file-regular-p file)
;;     (load file)))

;; configs
;; (mapc 'load (directory-files "~/.emacs.d/conf" t "\\.el$"))
(dolist (item (directory-files "~/.emacs.d/conf" t "\\w+"))
  (if (file-directory-p item)
      (mapc 'load (directory-files item t "\\w+"))
    (load item)))

(require 'setup-ido)
(require 'setup-smex)
(require 'setup-recentf)

(require 'setup-yasnippet)
(require 'setup-auto-complete)
(require 'setup-company)
(require 'setup-helm)
(require 'setup-smartparens)

(require 'setup-projectile)
(require 'setup-eshell)
(require 'setup-term)
(require 'setup-mmm-mode)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; init.el ends here
