;;; setup-editing.el --- editing, basic behavior and so on

;; recentf
(recentf-mode 1)
(global-set-key [(meta f12)] 'recentf-open-files)

(require 'autorevert)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(if window-system
    (set-frame-size (selected-frame) 111 65))

(when window-system
  (global-hl-line-mode t))

;; C-c <left>, c-c <right>
(winner-mode t)

;; undo/redo
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;; Word: C-c SPC, Char: C-u C-c SPC, Line: C-u C-u C-c SPC
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

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

(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))

(use-package move-text
  :bind (("M-S-<up>"   . move-text-up)
         ("M-S-<down>" . move-text-down)))

;; C-x o rebind
(use-package switch-window
  ;; (global-set-key (kbd "C-x o") 'switch-window)
  )

(global-set-key (kbd "RET") 'newline-and-indent)

;; Hint: <C-S-backspace> (kill a whole line)
;; Hint: C-u 0 C-k (backward kill line)

;; Vim-like open-line
(global-set-key (kbd "C-<return>") 'open-line)
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)

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
