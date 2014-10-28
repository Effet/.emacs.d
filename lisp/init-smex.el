(use-package smex
  :disabled t
  :init
  (progn
    (setq smex-save-file "~/.emacs.d/.smex-items")
    (smex-initialize))
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))
