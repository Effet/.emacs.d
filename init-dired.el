;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)

(setq dired-listing-switches "-AlXh --group-directories-first")

(require 'dired+)

(custom-set-faces
 ;; Heading
 '(diredp-dir-heading ((t (:inherit font-lock-type-face))))
 
 '(diredp-display-msg ((t (:foreground "#f0dfaf"))))
 '(diredp-executable-tag ((t (:foreground "#dca3a3"))))

 '(diredp-file-name ((t (:inherit default))))
 '(diredp-file-suffix ((t (:foreground "#8fb28f"))))
 '(diredp-compressed-file-suffix ((t (:foreground "#94bff3"))))
 '(diredp-dir-priv ((t (:inherit font-lock-function-name-face))))
 '(diredp-symlink ((t (:inherit font-lock-keyword-face))))
 '(diredp-ignored-file-name ((t (:inherit shadow))))

 '(diredp-deletion ((t (:inherit error))))
 '(diredp-deletion-file-name ((t (:inherit error))))
 
 '(diredp-flag-mark ((t (:inherit font-lock-constant-face))))
 '(diredp-flag-mark-line ((t (:inherit warning))))
 '(diredp-mode-line-flagged ((t (:inherit error))))
 '(diredp-mode-line-marked ((t (:foreground "#bfebbf"))))
 
 '(diredp-number ((t (:foreground "#f0dfaf"))))
 '(diredp-date-time ((t (:foreground "#74749A"))))
 
 ;; priv
 '(diredp-no-priv ((t (:inherit 'default))))
 '(diredp-read-priv ((t (:background "#5f5f5f"))))
 '(diredp-write-priv ((t (:inherit font-lock-comment-delimiter-face))))
 '(diredp-exec-priv ((t (:background "#9c6363"))))
 '(diredp-link-priv ((t (:foreground "#94bff3"))))
 '(diredp-other-priv ((t (:background "#111117175555"))))
 '(diredp-rare-priv ((t (:background "#FFFF00008080" :foreground "Green"))))
 )


(provide 'init-dired)
