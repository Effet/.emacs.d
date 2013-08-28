(setq custom-theme-directory (concat user-emacs-directory "themes"))
(if window-system (load-theme 'kuu t))

(if window-system
    (setq frame-title-format
          '("Emacs :: "
            (:eval (if buffer-file-name
                       (abbreviate-file-name buffer-file-name)
                     (buffer-name))))))
