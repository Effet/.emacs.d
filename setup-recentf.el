;; recentf
(recentf-mode 1)
(global-set-key [(meta f12)] 'recentf-open-files)

(defun ido-choose-from-recentf ()
  "Use ido to select a recently visited file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))

  ;;; bind it to "C-c f"
(global-set-key (kbd "C-c f") 'ido-choose-from-recentf)

(provide 'setup-recentf)
