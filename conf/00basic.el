(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(if window-system (tooltip-mode -1))

(setq inhibit-startup-screen t)

;; backups
(setq make-backup-files nil)
(setq delete-by-moving-to-trash t)

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; C-x f to set local value
(setq-default fill-column 78)

(setq-default require-final-newline t)

(delete-selection-mode t)
(global-subword-mode t)

(setq mouse-wheel-progressive-speed  nil)

;; narrow (C-x n n, C-x n p, C-x n d)
;;  (C-x n w) -> widen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; C-x C-u, C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
