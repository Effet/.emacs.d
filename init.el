;;; init.el --- Emacs configuration file

;; Hint: <C-S-backspace> (kill a whole line)
;; Hint: C-u 0 C-k (backward kill line)

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
(require 'setup-ibuffer)
(require 'setup-recentf)
(require 'setup-dired)

(require 'setup-undo-tree)
(require 'setup-ace-jump-mode)
(require 'setup-expand-region)
(require 'setup-multiple-cursors)
(require 'setup-magit)
(require 'setup-org)

(require 'setup-yasnippet)
(require 'setup-auto-complete)
(require 'setup-helm)
(require 'setup-smartparens)

(require 'setup-projectile)
(require 'setup-popwin)
(require 'setup-eshell)
(require 'setup-term)
(require 'setup-python)
(require 'setup-web-mode)
(require 'setup-mmm-mode)
(require 'setup-rainbow-mode)
(require 'coding)

(require 'setup-misc)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; init.el ends here
