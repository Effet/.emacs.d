;;; ---- Highlight TODO: FIXME: BUG: ----
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
;;;###autoload
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


;; C++ specials
;;;###autoload
(defun my-c++-quick-compile()
  "A quick compile funciton for C++"
  (interactive)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))
  )

;;;###autoload
(defun my-c++-quick-run()
  (interactive)
  (if (not (file-exists-p "in"))
      (find-file "in")
    (let ((sec 2)
          (buf (get-buffer-create "*Quick Run for ACM*"))
          (cmd (if (eq system-type 'windows-nt)
                   "a.exe < in"
                 "./a.out < in")))
      (async-shell-command cmd buf)
      (run-with-timer sec nil (lambda (buf) (kill-process buf)) buf)
      )
    )
  )

(push '("*Quick Run for ACM*") popwin:special-display-config)


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
             
             (local-set-key (kbd "C-c C-c") 'my-c++-quick-compile)
             (local-set-key (kbd "C-c C-r") 'my-c++-quick-run)

             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)
             ))


(dolist (hook '(emacs-lisp-mode-hook
                c-mode-common-hook
                python-mode))
  (add-hook hook
            '(lambda ()
               (hs-minor-mode 1)
               (hideshowvis-enable)
               (hideshowvis-symbols)
               ;; (hs-hide-all)
               )))



;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda()
;;              (rainbow-delimiters-mode)))

;; (define-derived-mode lua-mode prog-mode "lua-mode")


(provide 'init-prog)
