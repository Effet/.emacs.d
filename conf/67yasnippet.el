(use-package yasnippet
  :init
  (progn
    ;; https://github.com/redguardtoo/emacs.d/blob/master/init-yasnippet.el
    ;; default TAB key is occupied by auto-complete
    (global-set-key (kbd "C-c k") 'yas-expand)
    ;; default hotkey `C-c C-s` is still valid
    (global-set-key (kbd "C-c l") 'yas-insert-snippet)

    ;; (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
    (setq yas-prompt-functions '(yas-ido-prompt))

    ;; When I typed `(global-set`, and press [tab] to use `competion-at-point` to
    ;; complete `global-set-key`, in default YASnippet setting, it will expand `set`
    ;; first if define a snippet `set`.
    ;;   Refer to -> http://ergoemacs.org/emacs/emacs_tip_yasnippet_expand_whole_hyphenated_word.html
    (setq yas-key-syntaxes '("w_" "w_." "w_.()" "^ "))

    (setq yas-triggers-in-field t)

    (yas-global-mode 1)

    (defun yas-not-activate ()
      (memq major-mode '(term-mode)))
    (setq-default yas-dont-activate (cons #'yas-not-activate yas-dont-activate))
    ))
