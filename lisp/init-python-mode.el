(use-package jedi
  :commands jedi:setup
  :init
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:environment-virtualenv "/Users/Effet/opt/pydev-jedi")
    (setq jedi:setup-keys t)
    (setq jedi:complete-on-dot t)))


(setq python-shell-interpreter "ipython")
