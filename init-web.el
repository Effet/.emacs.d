(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
  (add-hook hook 'rainbow-mode))


(add-hook 'sgml-mode-hook
          '(lambda()
             (zencoding-mode)
             (local-set-key (kbd "C-c C-j") 'zencoding-expand-line)
             (local-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)))


;; mmm-mode
(require 'mmm-auto)

(setq mmm-global-mode 'auto)

(setq mmm-submode-decoration-level 0)
(setq mmm-parse-when-idle t)

(mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

(add-to-list 'auto-mode-alist '("\\.html\\'" . html-erb-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
;; (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))


(provide 'init-web)
