(add-hook 'term-mode-hook (lambda() (yas-minor-mode -1)))
(use-package multi-term
  :ensure multi-term
  :bind (("C-c m" . multi-term-next)
         ("C-c M" . multi-term))
  :init (setq multi-term-program (or (getenv "SHELL") "/bin/sh")))

(provide 'setup-term)
