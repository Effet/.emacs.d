(use-package mmm-mode
  :disabled t
  :init
  (progn
    (require 'mmm-auto)
    (setq mmm-global-mode 'buffers-with-submode-classes)
    (setq mmm-submode-decoration-level 0)
    (setq mmm-parse-when-idle t)

    (mmm-add-mode-ext-class 'html-mode nil 'html-js)
    (mmm-add-mode-ext-class 'html-mode nil 'html-css)

    ;; jsp
    (add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
    (mmm-add-mode-ext-class 'html-mode "\\.jsp\\'" 'jsp)))

(provide 'setup-mmm-mode)
