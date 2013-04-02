(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "plugins/"))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))


(require 'init-package)


;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


(require 'init-ido)
(require 'init-general)
(require 'init-prog)
(require 'init-web)
(require 'init-yasnippet)
(require 'init-hippie)

(eval-after-load 'dired '(require 'init-dired))

(eval-after-load 'org '(require 'init-org))
(eval-after-load 'eshell '(require 'init-eshell))
(eval-after-load 'auctex '(require 'init-auctex))

(require 'init-shortcut)
(require 'init-gui)
(require 'init-sessions)

(require 'init-plugins)

;; UTF-8 Staff
(require 'init-locales)

;; (when (file-exists-p user-lisp-directory)
;;   (mapc 'load (directory-files user-lisp-directory nil "^[^#].*\\.el$")))
