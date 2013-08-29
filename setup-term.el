(use-package multi-term
  :ensure multi-term
  :bind (("C-c m" . multi-term-next)
         ("C-c M" . multi-term))
  :init (setq multi-terkm-program (or (getenv "SHELL") "/bin/sh")))

(defun term-toggle-mode ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

;; (eval-after-load 'term
;;   (define-key term-mode-map (kbd "C-c C-t") 'term-toggle-mode))

(provide 'setup-term)
