(use-package jedi
  :commands jedi:setup
  :init
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:setup-keys t)
    (setq jedi:complete-on-dot t)))
