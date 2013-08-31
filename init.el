;;; init.el --- Emacs configuration file

(add-to-list 'load-path user-emacs-directory)

;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; configs
;; (mapc 'load (directory-files "~/.emacs.d/conf" t "\\.el$"))
(dolist (item (directory-files "~/.emacs.d/conf" t "\\w+"))
  (if (file-directory-p item)
      (mapc 'load (directory-files item t "\\w+"))
    (load item)))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; init.el ends here
