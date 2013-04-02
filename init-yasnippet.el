;;; ---- YASnippet Setting ----
(require 'yasnippet)

;; https://github.com/redguardtoo/emacs.d/blob/master/init-yasnippet.el
;; default TAB key is occupied by auto-complete
(global-set-key (kbd "C-c k") 'yas-expand)
;; default hotkey `C-c C-s` is still valid
(global-set-key (kbd "C-c l") 'yas-insert-snippet)

(setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
(setq yas-prompt-functions '(yas-ido-prompt))

;; When I typed `(global-set`, and press [tab] to use `competion-at-point` to
;; complete `global-set-key`, in default YASnippet setting, it will expand `set`
;; first if define a snippet `set`.
;; Related to: http://ergoemacs.org/emacs/emacs_tip_yasnippet_expand_whole_hyphenated_word.html
(setq yas-key-syntaxes '("w_" "w_." "w_.()" "^ "))

(yas-global-mode 1)
;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (yas-minor-mode)))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

(provide 'init-yasnippet)
