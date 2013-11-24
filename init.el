(add-to-list 'load-path user-emacs-directory)

;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(defvar vendor-dir
  (expand-file-name "vendor" user-emacs-directory))

(add-to-list 'load-path vendor-dir)

(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; configs
(mapc 'load (directory-files "~/.emacs.d/conf" t "\\.el$"))


;; modules
(defvar modules-dir
  (expand-file-name "modules" user-emacs-directory))

(add-to-list 'load-path modules-dir)

(load "init-smartparens")


;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
