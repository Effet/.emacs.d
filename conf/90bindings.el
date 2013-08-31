;; Hint: <C-S-backspace> (kill a whole line)
;; Hint: C-u 0 C-k (backward kill line)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; (global-set-key "\C-cR" 'rename-current-file-or-buffer)

;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
;; (global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; (global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key [remap list-buffers] 'ibuffer)

(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key (kbd "\e\el") 'goto-line)

(global-set-key [(meta f12)] 'recentf-open-files)
(global-set-key (kbd "C-c f") 'ido-choose-from-recentf)

;; Word: C-c SPC, Char: C-u C-c SPC, Line: C-u C-u C-c SPC
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode)
  :config
  (progn
    (add-hook 'org-mode-hook
              #'(lambda ()
                  ;; original map to org-table-blank-field
                  (local-unset-key (kbd "C-c SPC"))))))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :bind (("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-*"           . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("S-SPC"         . set-rectangular-region-anchor))
  :init
  (eval-after-load 'sgml-mode
    '(define-key sgml-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair))
  )

(use-package move-text
  :bind (("M-S-<up>"   . move-text-up)
         ("M-S-<down>" . move-text-down)))

(use-package key-chord
  :init
  (progn
    (key-chord-mode 1)
    (key-chord-define-global "ui" 'undo)
    (key-chord-define-global "df" 'find-file)
    (key-chord-define-global "sd" 'ido-dired)
    (key-chord-define-global "jk" 'other-window)))
