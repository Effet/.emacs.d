;; popwin (C-g to hide temp buffer)
(use-package popwin
  :init
  (progn
    (setq display-buffer-function 'popwin:display-buffer)

    ;; Conflict between `popwin' and `Icicles', because of `completion-list-mode'.
    (setq popwin:special-display-config
          '(help-mode
            (compilation-mode :noselect t)
            "*Apropos*"
            "*Shell Command Output*" "*Async Shell Command*"
            "*Compile-Log*" "*TeX Help*"
            (" *undo-tree*" :position bottom)))
    ))


;; if use M-x way enable `rainbow-mode', M-o M-o to refontify.
(use-package rainbow-mode
  :commands rainbow-mode
  :init
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))))


(use-package projectile
  :disabled nil
  :init (projectile-global-mode))


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


(use-package guide-key
  :diminish guide-key-mode
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x c" "C-x RET" "C-c p" "C-c C-x"))
    (guide-key-mode 1)
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)))


(use-package keyfreq
  :init
  (progn
    (setq keyfreq-file "~/.emacs.d/keyfreq")
    (setq keyfreq-file-lock "~/.emacs.d/keyfreq.lock")

    (keyfreq-mode 1)
    (keyfreq-autosave-mode 1)))


;; Quit: C-c C-q, Copy: C-c C-w, ToggleCase: C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)


;; http://ergoemacs.org/emacs/emacs_form_feed_section_paging.html
;; NOTE: backward-page =C-x [=, forward-page =C-x ]=
(use-package page-break-lines
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'turn-on-page-break-lines-mode)
    (add-hook 'lisp-interaction-mode-hook 'turn-on-page-break-lines-mode)))


;; (use-package hi-lock
;;   :bind (("M-o l" . highlight-lines-matching-regexp)
;;          ("M-o r" . highlight-regexp)
;;          ("M-o w" . highlight-phrase)))


;; chinese input method
(use-package eim
  :commands eim-use-package
  :init
  (progn
    (setq eim-use-tooltip nil)
    (register-input-method
     "eim-py" "Chinese-GB" 'eim-use-package
     "拼音" "汉字拼音输入法" "py.txt")
    ))


;; (eval-after-load "sql"
;;   (load-library "sql-indent"))


(use-package region-bindings-mode
  :init
  (progn
    (region-bindings-mode-enable)
    ;; expand-region
    (define-key region-bindings-mode-map "=" 'er/expand-region)
    (define-key region-bindings-mode-map "-" 'er/contract-region)
    (define-key region-bindings-mode-map "0" '(lambda () (interactive "p") (er/expand-region 0)))
    ;; multiple-cursor
    (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
    (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
    (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
    (define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)))


(use-package fill-column-indicator
  :init
  (progn
    (add-hook 'c-mode-common-hook 'turn-on-fci-mode)))
