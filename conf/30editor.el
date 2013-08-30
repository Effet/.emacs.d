;; Hint: <C-S-backspace> (kill a whole line)
;; Hint: C-u 0 C-k (backward kill line)

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; C-x f to set local value
(setq-default fill-column 78)

(setq-default require-final-newline t)

(delete-selection-mode t)
(global-subword-mode t)

(global-set-key (kbd "RET") 'newline-and-indent)

;; narrow (C-x n n, C-x n p, C-x n d)
;;  (C-x n w) -> widen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; C-x C-u, C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Word: C-c SPC, Char: C-u C-c SPC, Line: C-u C-u C-c SPC
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode)
  :config
  (progn
    (add-hook 'org-mode-hook
              #'(lambda ()
                  ;; original map to org-table-blank-field
                  (local-unset-key (kbd "C-c SPC"))))))

;; undo/redo
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :bind (("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-*"           . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("S-SPC"         . set-rectangular-region-anchor))
  :init
  (eval-after-load 'sgml-mode
    '(define-key sgml-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair))
  )

(use-package move-text
  :bind (("M-S-<up>"   . move-text-up)
         ("M-S-<down>" . move-text-down)))
