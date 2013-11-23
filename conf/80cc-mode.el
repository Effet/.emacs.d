(defun my-c++-quick-compile()
  "A quick compile funciton for C++"
  (interactive)
  (save-buffer)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg")))

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
      (run-with-timer sec nil (lambda (buf) (kill-process buf)) buf))))

(eval-after-load 'popwin
  '(push "*Quick Run for ACM*" popwin:special-display-config))

;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)


;; (setq-default c-basic-offset 4)
;; (c-set-offset 'substatement-open 0)

(defun my-c-mode-settings()
  (c-set-style "stroustrup")
  )

(add-hook 'c-mode-hook 'my-c-mode-settings)
(add-hook 'c++-mode-hook 'my-c-mode-settings)


(defun my-open-block-c-mode (id action context)
  (when (eq action 'insert)
    (indent-according-to-mode)          ;some bugs
    (newline)
    (newline)
    (indent-according-to-mode)
    (previous-line)
    (indent-according-to-mode)))

(sp-local-pair 'c-mode "{" nil :post-handlers '(:add my-open-block-c-mode))

(add-hook 'c++-mode-hook
          '(lambda()
             (c-toggle-hungry-state)
             (c-toggle-auto-state)

             (local-set-key (kbd "C-c C-c") 'my-c++-quick-compile)
             (local-set-key (kbd "C-c C-r") 'my-c++-quick-run)

             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)
             ))
