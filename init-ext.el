;;; init-ext.el --- extension of my config.


;;;; yasnippet
(eval-after-load "yasnippet-autoloads"
  '(progn
     (require 'yasnippet)
     (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
     (setq yas-prompt-functions '(yas-ido-prompt))

     ;; When I typed `(global-set`, and press [tab] to use `competion-at-point` to
     ;; complete `global-set-key`, in default YASnippet setting, it will expand `set`
     ;; first if define a snippet `set`.
     ;;   Refer to -> http://ergoemacs.org/emacs/emacs_tip_yasnippet_expand_whole_hyphenated_word.html
     (setq yas-key-syntaxes '("w_" "w_." "w_.()" "^ "))

     (yas-global-mode 1)
     )
  )


;;;; Auto-Complete
(eval-after-load "auto-complete-autoloads"
  '(progn
     (require 'auto-complete-config)
     (ac-config-default)
     ;; (setq ac-dwim nil)
     ;; (setq ac-auto-show-menu 0.3)
     (setq ac-auto-show-menu t)

     (setq ac-use-menu-map t)
     (define-key ac-menu-map (kbd "C-n") 'ac-next)
     (define-key ac-menu-map (kbd "C-p") 'ac-previous)

     (setq popup-isearch-cursor-color (face-foreground 'warning)) ;... is there a better way?
     )
  )


;;;; projectile
(eval-after-load "projectile-autoloads"
  '(progn
     (require 'projectile)
     (projectile-global-mode)))


;;;; helm
(eval-after-load "helm-autoloads"
  '(progn
     ;; (helm-mode t)
     ;; (setq helm-idle-delay 0.1)
     ;; (setq helm-input-idle-delay 0.1)
     ;; (setq helm-split-window-in-side-p t)

     ;; (setq helm-M-x-always-save-history t)
     (setq helm-command-prefix-key "M-s")
     (require 'helm-config)

     (define-key helm-command-map (kbd "i") 'helm-imenu)
     (define-key helm-command-map (kbd "h") 'helm-mini)
     (define-key helm-command-map (kbd "g") 'helm-do-grep)
     (define-key helm-command-map (kbd "o") 'helm-occur)
     (define-key helm-command-map (kbd "r") 'helm-register)
     (define-key helm-command-map (kbd "R") 'helm-regexp)
     (define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)
     )
  )


;;;; Popwin (C-g to hide temp buffer)
(eval-after-load "popwin-autoloads"
  '(progn
     (require 'popwin)
     
     (setq display-buffer-function 'popwin:display-buffer)

     ;; Conflict between `popwin' and `Icicles', because of `completion-list-mode'.
     (setq popwin:special-display-config
           '(help-mode
             (compilation-mode :noselect t)
             "*Apropos*"
             "*Shell Command Output*" "*Async Shell Command*"
             "*Compile-Log*" "*TeX Help*"
             (" *undo-tree*" :position bottom)))
     )
  )

(provide 'init-ext)


;;; init-ext.el ends here
