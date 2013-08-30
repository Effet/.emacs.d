(use-package auto-complete
  :init
  (progn
    (require 'auto-complete-config)
    (ac-config-default)
    ;; (setq ac-dwim nil)
    ;; (setq ac-auto-show-menu 0.3)
    (setq ac-auto-show-menu t)

    (setq ac-use-menu-map t)
    ;; (define-key ac-menu-map (kbd "C-n") 'ac-next)
    ;; (define-key ac-menu-map (kbd "C-p") 'ac-previous)

    (setq popup-isearch-cursor-color (face-foreground 'warning)) ;... is there a better way?
    ))

(provide 'setup-auto-complete)
