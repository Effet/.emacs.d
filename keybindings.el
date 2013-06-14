(global-set-key [remap goto-line] 'goto-line-with-feedback)


;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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
(with-package eshell
  (define-key eshell-mode-map (kbd "C-a") 'eshell-maybe-bol)
  (define-key eshell-mode-map (kbd "<return>") 'user-ret))


;; (global-set-key (kbd "C-x C-b") 'ibuffer)


;;;; ace-jump-mode
(with-package ace-jump-mode-autoloads
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))


;;;; expand-region -- Killing extension for using GNU/Emacs
(with-package expand-region-autoloads
  (global-set-key (kbd "C-'") 'er/expand-region)
  (global-set-key (kbd "C-M-'") 'er/contract-region)
  (eval-after-load "org"
    '(define-key org-mode-map (kbd "C-'") 'er/expand-region)))


;;;; multiple-cursors
(with-package multiple-cursors-autoloads
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
  (global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor))


;;;; helm keybinding
(with-package helm-autoloads
  (setq helm-command-prefix-key "M-s")
  (require 'helm-config)
  
  (define-key helm-command-map (kbd "i") 'helm-imenu)
  (define-key helm-command-map (kbd "h") 'helm-mini)
  (define-key helm-command-map (kbd "g") 'helm-do-grep)
  (define-key helm-command-map (kbd "o") 'helm-occur)
  (define-key helm-command-map (kbd "r") 'helm-register)
  (define-key helm-command-map (kbd "R") 'helm-regexp)
  (define-key helm-command-map (kbd "b") 'helm-c-pp-bookmarks)
  (define-key helm-command-map (kbd "p") 'helm-eproject-projects)
  (define-key helm-command-map (kbd "f") 'helm-eproject-files-in-project)
  (define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)
  )


;;;; browse-kill-ring C-x C-y
(with-package* browse-kill-ring
  (global-set-key (kbd "C-x C-y") 'browse-kill-ring))


;;;; fullscreen f11
(global-set-key [f11] 'fullscreen)


;;;; move-text M-S-up, M-S-dowm
(with-package* move-text
  (global-set-key [M-S-up] 'move-text-up)
  (global-set-key [M-S-down] 'move-text-down))


;;;; C-x o rebind
(with-package* switch-window
  ;; (global-set-key (kbd "C-x o") 'switch-window)
  )


;;;; C-c <left>, c-c <right>
(winner-mode t)


;;;; deft
(with-package deft-autoloads
  (global-set-key [f8] 'deft))


;;;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))
(set-register ?p '(file . "~/Projects"))
(set-register ?o '(file . "~/Projects/org"))
(set-register ?s '(file . "~/Dropbox/study_recipe.org"))


;;;; dired
(with-package dired
  (define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(with-package wdired
  (define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))


(provide 'keybindings)
