;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)
;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")
(setq dired-dwim-target t)

(require 'dired-x)

(require dired-details)
(setq-default dired-details-hidden-string "")
(dired-details-install)

(require 'dash)
;; Reload dired after making changes
(--each '(dired-do-rename
          dired-do-copy
          dired-create-directory
          wdired-abort-changes)
  (eval `(defadvice ,it (after revert-buffer activate)
           (revert-buffer))))

;; dired C-a
(defun dired-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (move-beginning-of-line nil)
    (if (= p (point))
        (dired-move-to-filename))))

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(eval-after-load 'wdired
  '(define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))
