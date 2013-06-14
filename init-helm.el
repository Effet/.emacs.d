(require-package 'helm)


(setq helm-command-prefix-key "M-s")
(require 'helm-config)
;; (helm-mode t)
;; (setq helm-idle-delay 0.1)
;; (setq helm-input-idle-delay 0.1)
;; (setq helm-split-window-in-side-p t)

;; (setq helm-M-x-always-save-history t)

(set-default 'imenu-auto-rescan t)

(define-key helm-command-map (kbd "i") 'helm-imenu)
(define-key helm-command-map (kbd "h") 'helm-mini)
(define-key helm-command-map (kbd "g") 'helm-do-grep)
(define-key helm-command-map (kbd "o") 'helm-occur)
(define-key helm-command-map (kbd "r") 'helm-register)
(define-key helm-command-map (kbd "R") 'helm-regexp)
(define-key helm-command-map (kbd "b") 'helm-c-pp-bookmarks)
(define-key helm-command-map (kbd "p") 'helm-eproject-projects)
(define-key helm-command-map (kbd "f") 'helm-eproject-files-in-project)
(define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)

;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (define-key eshell-mode-map 
;;                 [remap pcomplete]
;;                 'helm-esh-pcomplete)))

(provide 'init-helm)
