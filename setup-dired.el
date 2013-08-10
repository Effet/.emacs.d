;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)
;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")
(setq dired-dwim-target t)

(require 'dired-x)

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(eval-after-load 'wdired
  '(define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))

(provide 'setup-dired)
