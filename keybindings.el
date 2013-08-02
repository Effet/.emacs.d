(global-set-key [remap goto-line] 'goto-line-with-feedback)


;;;; Smart C-a
(global-set-key (kbd "C-a") 'smart-beginning-of-line)


;;;; newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "C-j") 'newline)


;;;; Vim-like open-line
(global-set-key (kbd "C-<return>") 'open-line)
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)


;;;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)


;;;; Region editing
(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)


(global-set-key (kbd "C-c n") 'cleanup-buffer)


(global-set-key (kbd "C-S-y") 'yank-unindented)


;;;; Eshell
(global-set-key (kbd "C-x m") 'eshell)
(add-hook 'eshell-mode-hook 'my-eshell-keys) ;; why?
(defun my-eshell-keys ()
  (define-key eshell-mode-map (kbd "C-a") 'eshell-maybe-bol)
  (define-key eshell-mode-map (kbd "<return>") 'user-ret))


;;;; ace-jump-mode
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))


;;;; expand-region -- Killing extension for using GNU/Emacs
(use-package expand-region
  :bind ("C-=" . er/expand-region))


;;;; multiple-cursors
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


;;;; browse-kill-ring C-x C-y
;; (with-package* browse-kill-ring
;;   (global-set-key (kbd "C-x C-y") 'browse-kill-ring))

;;;; View-mode Vi-binding
(setq view-read-only t)                 ;bind `read-only-mode' to `view-mode'

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


;;;; fullscreen f11
(global-set-key [f11] 'fullscreen)


;;;; move-text M-S-up, M-S-dowm
(use-package move-text
  :init
  (progn
    (global-set-key [M-S-up] 'move-text-up)
    (global-set-key [M-S-down] 'move-text-down)))


;;;; C-x o rebind
(use-package switch-window
  ;; (global-set-key (kbd "C-x o") 'switch-window)
  )


;;;; C-c <left>, c-c <right>
(winner-mode t)


;;;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))
(set-register ?p '(file . "~/Projects"))
(set-register ?o '(file . "~/Projects/org"))
(set-register ?s '(file . "~/Dropbox/study_recipe.org"))


;;;; dired
(after 'dired
  (define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(after 'wdired
  (define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))


(provide 'keybindings)
