;;; setup-editing.el --- editing, basic behavior and so on


(setq inhibit-startup-screen t)

(setq make-backup-files nil)
(setq delete-by-moving-to-trash t)

(setq mouse-wheel-progressive-speed  nil)

(set-default 'imenu-auto-rescan t)


;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; cursor
(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows 'hollow)


;; C-x f to set local value
(setq-default fill-column 78)

(setq-default require-final-newline t)


;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; narrow (C-x n n, C-x n p, C-x n d)
;;  (C-x n w) -> widen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; C-x C-u, C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(if window-system (tooltip-mode -1))


(delete-selection-mode t)
(global-subword-mode t)
;; (show-paren-mode t)


;; recentf
(recentf-mode 1)
(global-set-key [(meta f12)] 'recentf-open-files)


(require 'autorevert)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


(require 'saveplace)
(setq-default save-place t)


;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L20
;; Add spaces and proper formatting to linum-mode. It uses more room than
;; necessary, but that's not a problem since it's only in use when going to
;; lines.
(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))


(if window-system
    (setq frame-title-format
          '("Emacs :: "
            (:eval (if buffer-file-name
                       (abbreviate-file-name buffer-file-name)
                     (buffer-name))))))


(if window-system
    (set-frame-size (selected-frame) 111 65))


;; modeline
(column-number-mode t)
(size-indication-mode t)


(when window-system
  (global-hl-line-mode t))


;; C-c <left>, c-c <right>
(winner-mode t)

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


(global-set-key (kbd "C-a") 'smart-beginning-of-line)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Vim-like open-line
(global-set-key (kbd "C-<return>") 'open-line)
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Region editing
(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)

(global-set-key (kbd "C-c n") 'cleanup-buffer)

(global-set-key [remap goto-line] 'goto-line-with-feedback)


;; C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))
(set-register ?p '(file . "~/Projects"))
(set-register ?o '(file . "~/Projects/org"))
(set-register ?s '(file . "~/Dropbox/study_recipe.org"))


;;;; Indent after yank
;; http://www.emacswiki.org/emacs/AutoIndentation
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))


;;;; View-mode Vi-binding
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


(provide 'setup-editing)


;;; setup-editing.el ends here
