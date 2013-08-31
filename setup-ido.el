(require 'ido)

(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el"
                                  ".ini" ".cfg" ".conf"))

(use-package ido-sort-mtime
  :init (ido-sort-mtime-mode 1))

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode t))

(use-package ido-at-point
  :init (ido-at-point-mode))

(provide 'setup-ido)
