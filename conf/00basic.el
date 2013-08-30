(setq inhibit-startup-screen t)

;; backups
(setq make-backup-files nil)
(setq delete-by-moving-to-trash t)

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(setq mouse-wheel-progressive-speed  nil)

;; do not ask, just follow symlinks
(setq vc-follow-symlinks t)

(set-default 'imenu-auto-rescan t)

(eval-after-load 'ediff
  '(progn
     (setq ediff-diff-options "-w")
     (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))

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

;; Quit: C-c C-q, Copy: C-c C-w, ToggleCase: C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)

;; C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))

;; bind `read-only-mode' to `view-mode'
(setq view-read-only t)
(defun view-mode-vi-binding ()
  (progn
    (define-key view-mode-map (kbd "j") 'next-line)
    (define-key view-mode-map (kbd "k") 'previous-line)
    (define-key view-mode-map (kbd "h") 'backward-char)
    (define-key view-mode-map (kbd "l") 'forward-char)
    (define-key view-mode-map (kbd "b") 'backward-word)
    (define-key view-mode-map (kbd "w") 'forward-word)))
(add-hook 'view-mode-hook
          'view-mode-vi-binding)