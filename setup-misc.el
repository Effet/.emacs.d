(use-package move-text
  :bind (("M-S-<up>"   . move-text-up)
         ("M-S-<down>" . move-text-down)))


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

(provide 'setup-misc)
