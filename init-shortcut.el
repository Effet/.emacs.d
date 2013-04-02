(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-and-retry-line)

;; Clever newlines
(global-set-key (kbd "C-c C-o") 'open-line)
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-in-between)

(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)

(global-set-key (kbd "C-c n") 'cleanup-buffer)

(global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-M-'") 'er/contract-region)
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "C-'") 'er/expand-region)))


(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


(global-set-key (kbd "C-c =") 'fold-dwim-toggle)
(global-set-key (kbd "C-c -") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c +") 'fold-dwim-show-all)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; (setq helm-M-x-always-save-history t)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key [remap occur] 'helm-occur)


;; (define-prefix-command 'ctl-z-map)
;; (global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-z") 'eshell)


(global-set-key (kbd "C-x C-b") 'ibuffer)


(global-set-key (kbd "C-c q r") 'quickrun)
(global-set-key (kbd "C-c q c") 'quickrun-compile-only)
(global-set-key (kbd "C-c q s") 'quickrun-shell)


(global-set-key (kbd "C-\"") 'toggle-quotes)
(global-set-key (kbd "C-+") 'change-number-at-point)


(global-set-key (kbd "C-S-y") 'yank-unindented)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)


(global-set-key [f11] 'fullscreen)

(provide 'init-shortcut)
