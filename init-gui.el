(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
;; (scroll-bar-mode -1)


(defun get-foreground-of-face (face)
  (if (or (null face)
          (equal face 'unspecified))
      (setq face 'default))
  (let ((color (face-attribute face :foreground)))
    (if (equal color 'unspecified)
        (get-foreground-of-face (face-attribute face :inherit))
      color)))

(defun auto-change-cursor ()
  "Auto change the cursor color adjust to under text.
Like the way of KDE's KWrite/Kate."
  (interactive "d")
  (let ((face (or (get-char-property (point) 'face)
                  'default)))
    (let ((color (get-foreground-of-face face)))
      (set-cursor-color color))))


(if window-system
    (progn
      (load-font-alist
       '("DejaVu Sans Mono-9" "Monospace-10")
       '("Hiragino Sans GB-10.5" "WenQuanYi Micro Hei-12" "Microsoft Yahei-12"))
      ;; (setq face-font-rescale-alist
      ;;       '(("Hiragino Sans GB"  . 1.3)
      ;;         ("WenQuanYi Zen Hei" . 1.2)))

      ;; (load-theme 'solarized-dark t)
      (load-theme 'zenburn t)
      (set-frame-size (selected-frame) 111 41)
      ;; (add-hook 'post-command-hook 'auto-change-cursor)
      ))


(provide 'init-gui)
