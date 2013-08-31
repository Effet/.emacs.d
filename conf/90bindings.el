(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; (global-set-key "\C-cR" 'rename-current-file-or-buffer)

;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)


(use-package key-chord
  :init
  (progn
    (key-chord-mode 1)
    (key-chord-define-global "ui" 'undo)
    (key-chord-define-global "df" 'find-file)
    (key-chord-define-global "sd" 'ido-dired)
    (key-chord-define-global "jk" 'other-window)))
