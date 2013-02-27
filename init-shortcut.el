;; (require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; (require 'iy-go-to-char)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)


;; (require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-M-'") 'er/contract-region)

;; (require 'change-inner)
(global-set-key (kbd "C-c i") 'change-inner)
(global-set-key (kbd "C-c o") 'change-outer)

(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

;; (require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)


(global-set-key (kbd "C-c =") 'fold-dwim-toggle)
(global-set-key (kbd "C-c -") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c +") 'fold-dwim-show-all)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; (setq helm-M-x-always-save-history t)
(global-set-key (kbd "C-c h") 'helm-mini)


;; <return> always `newline-and-indent'
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; (C-x C-x) (C-u C-x C-x)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-c e") 'eshell)

(global-set-key (kbd "C-x g") 'webjump)


(global-set-key (kbd "C-x C-b") 'ibuffer)


(global-set-key (kbd "C-c r") 'quickrun)
(global-set-key (kbd "C-c c") 'quickrun-compile-only)
(global-set-key (kbd "C-c s") 'quickrun-shell)


(provide 'init-shortcut)
