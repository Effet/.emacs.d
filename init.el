;;; init.el --- Emacs configuration file


(add-to-list 'load-path user-emacs-directory)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))


(require 'init-package)


;;;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


(load "~/.emacs.d/utils/package-helper.el")


(require 'init-gui)

;; ;; (require 'init-ido)
(require 'init-general)
(require 'init-programming)
(require 'init-yasnippet)
(require 'init-hippie)
(require 'init-helm)
(require 'init-icicles)

(eval-after-load 'dired '(require 'init-dired))

(eval-after-load 'org '(require 'init-org))
(eval-after-load 'eshell '(require 'init-eshell))
;; (eval-after-load 'auctex '(require 'init-auctex))

(require 'init-editing)
(require 'init-keybindings)

;;;; Session
(with-package session-autoloads
  (add-hook 'after-init-hook 'session-initialize)

  ;; http://www.emacswiki.org/emacs/EmacsSession
  ;; expanded folded secitons as required
  (defun le::maybe-reveal ()
    (when (and (or (memq major-mode  '(org-mode outline-mode))
                   (and (boundp 'outline-minor-mode)
                        outline-minor-mode))
               (outline-invisible-p))
      (if (eq major-mode 'org-mode)
          (org-reveal)
        (show-subtree))))

  (add-hook 'session-after-jump-to-last-change-hook
            'le::maybe-reveal)
  )


(require 'init-plugins)

;;;; UTF-8 Staff
(require 'init-locales)

;;; init.el ends here
