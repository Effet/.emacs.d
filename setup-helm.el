(use-package helm
  :bind ("C-c h" . helm-mini)
  :init
  (progn
    ;; (helm-mode t)
    ;; (setq helm-idle-delay 0.1)
    ;; (setq helm-input-idle-delay 0.1)
    ;; (setq helm-split-window-in-side-p t)

    ;; (setq helm-M-x-always-save-history t)
    ;; (setq helm-command-prefix-key "M-s")
    (require 'helm-config)
    ))

(provide 'setup-helm)
