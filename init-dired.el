;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)

;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")

(setq dired-dwim-target t)


(defun dired-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (move-beginning-of-line nil)
    (if (= p (point))
        (dired-move-to-filename))))

(define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol)

(eval-after-load "wdired"
  '(define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))


(require-package 'dired+)
(require 'dired+)


(provide 'init-dired)
