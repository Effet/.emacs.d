;;; extras.el --- extra configs

;; (midnight-delay-set 'midnight-delay "4:30am")

;; Quit: C-c C-q, Copy: C-c C-w, ToggleCase: C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)


(use-package projectile
  :disabled nil
  :init (projectile-global-mode))


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

;; ;; flycheck
;; (after 'flycheck-autoloads
;;   (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package ack-and-a-half
  :commands (ack-and-a-half
             ack-and-a-half-same
             ack-and-a-half-find-file
             ack-and-a-half-file-file-same)
  :init
  (progn
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))

(use-package guide-key
  :diminish guide-key-mode
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x c" "C-x RET" "C-c p" "C-c C-x"))
    (guide-key-mode 1)
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)))


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

(provide 'extras)

;;; extras.el ends here
