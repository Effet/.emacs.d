(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
;; (scroll-bar-mode -1)


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
      ))


(provide 'init-gui)
