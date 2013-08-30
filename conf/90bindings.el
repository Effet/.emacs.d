(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; (global-set-key "\C-cR" 'rename-current-file-or-buffer)


(require 'key-chord)

(key-chord-define-global "df" 'find-file)
(key-chord-define-global "jk" 'ido-dired)

(key-chord-mode +1)
