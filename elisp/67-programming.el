;;; ---- Highlight TODO: FIXME: BUG: ----
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook
          'highlight-fixme-todo-bug)


;;; ---- Programming ----

(add-hook 'prog-mode-hook '(lambda() (rainbow-mode)))

(add-hook 'sgml-mode-hook
          '(lambda()
             (zencoding-mode)
             (local-set-key (kbd "C-c C-j") 'zencoding-expand-line)))


(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(add-hook 'c++-mode-hook
          '(lambda()
             (setq c-default-style "linux"
                   c-basic-offset 4
                   )
             
             ;; (c-set-style "stroustrup")    ;c++ style
             (c-toggle-hungry-state)
             (c-toggle-auto-state)

             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)
             ))


;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda()
;;              (rainbow-delimiters-mode)))

;; (define-derived-mode lua-mode prog-mode "lua-mode")
