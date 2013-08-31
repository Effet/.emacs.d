(setq custom-theme-directory (concat user-emacs-directory "themes"))
(if window-system (load-theme 'kuu t))

(if window-system
    (setq frame-title-format
          '("Emacs :: "
            (:eval (if buffer-file-name
                       (abbreviate-file-name buffer-file-name)
                     (buffer-name))))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; (if window-system (tooltip-mode -1))

(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))

(if window-system
    (set-frame-size (selected-frame) 111 65))

;; cursor
(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows 'hollow)

;; modeline
(column-number-mode t)
(size-indication-mode t)

(when window-system
  (global-hl-line-mode t))

(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))
