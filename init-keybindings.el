(global-set-key [remap goto-line] 'goto-line-with-feedback)


;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; (define-prefix-command 'ctl-z-map)
;; (global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-x m") 'eshell)


;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-S-y") 'yank-unindented)


(require-package 'browse-kill-ring)
(require 'browse-kill-ring)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)


(global-set-key [f11] 'fullscreen)

(provide 'init-keybindings)
