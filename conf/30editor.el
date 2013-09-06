;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; C-x f to set local value
(setq-default fill-column 78)

(setq-default truncate-lines t)

(setq-default require-final-newline t)

(delete-selection-mode t)
(global-subword-mode t)

(require 'yank-indent)

;; undo/redo
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;; bind `read-only-mode' to `view-mode'
(setq view-read-only t)


;; backups
(setq make-backup-files nil)
(setq delete-by-moving-to-trash t)

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(setq mouse-wheel-progressive-speed  nil)

(set-default 'imenu-auto-rescan t)

;; C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))

;; narrow (C-x n n, C-x n p, C-x n d)
;;  (C-x n w) -> widen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; C-x C-u, C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'autorevert)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

(setq recentf-save-file "~/.emacs.d/.recentf")
(recentf-mode 1)
