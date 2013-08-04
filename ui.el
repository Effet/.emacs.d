;;; ui.el --- what emacs look like

(setq inhibit-startup-screen t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L20
;; Add spaces and proper formatting to linum-mode. It uses more room than
;; necessary, but that's not a problem since it's only in use when going to
;; lines.
(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))


;; Modeline Settings
(column-number-mode t)
(size-indication-mode t) ;show file size


(when window-system
  (global-hl-line-mode t))


;; cursor
(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows 'hollow)


(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))


(defun my-x-settings ()
  (tooltip-mode -1)

  (setq frame-title-format
        '("Emacs :: "
          (:eval (if buffer-file-name
                     (abbreviate-file-name buffer-file-name)
                   (buffer-name)))))

  (load-theme 'base16-monokai t)
  (set-frame-size (selected-frame) 111 65)
  )


(when window-system
  (my-x-settings))


(provide 'ui)


;;; ui.el ends here
