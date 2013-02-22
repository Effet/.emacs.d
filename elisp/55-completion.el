;;; ---- Competion At Point ----

;; (global-set-key (kbd "TAB") 'completion-at-point)


;;; ---- Auto-Complete ----

;; ;; M-x package-install RET auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (global-auto-complete-mode t)


;; (setq-default ac-sources
;;               '(ac-source-abbrev
;;                 ac-source-dictionary
;;                 ac-source-words-in-same-mode-buffers
;;                 ac-source-words-in-all-buffer
;;                 ac-source-filename))

;; (add-hook
;;  'c-mode-common-hook
;;  '(lambda()
;;     (setq ac-sources (append
;;                       '(
;;                         ac-new-yas-source
;;                         ;; ac-source-yasnippet
;;                         ac-source-semantic
;;                         ac-source-clang
;;                         )
;;                       ac-sources))))

