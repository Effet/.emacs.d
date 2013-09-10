(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x M-f") 'find-file-other-window)

(global-set-key (kbd "C-x 3") '(lambda () (interactive) (split-window-right) (windmove-right)))

(global-set-key (kbd "C-a") 'smart-beginning-of-line)


(global-set-key (kbd "C-s") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-backward-use-region)

(global-set-key (kbd "C-S-s") 'isearch-forward)
(global-set-key (kbd "C-S-r") 'isearch-backward)


;; NOTE: =C-M-o= binds =split-line=
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)
(global-set-key (kbd "<M-S-return>") 'new-line-in-between)


(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(global-set-key (kbd "C-c s") 'create-scratch-buffer)

(global-set-key (kbd "C-c r") 'revert-buffer)

(global-set-key (kbd "C-c R") 'rename-current-file-or-buffer)
(global-set-key (kbd "C-c D") 'delete-current-buffer-file)

(global-set-key (kbd "C-c +") 'increment-number-at-point)


;; =C-w=/=M-w=
(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)


;; Originally, =<C-S-backspace>= binds =kill-whole-line=
;; NOTE: =C-u 0 C-k= =(kill-line 0)=, means kill lines backward.
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "<C-S-backspace>") 'kill-and-retry-line)


(global-set-key [remap list-buffers] 'ibuffer)

(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key (kbd "\e\el") 'goto-line)

(global-set-key [(meta f12)] 'recentf-open-files)
;; (global-set-key (kbd "C-c f") 'ido-choose-from-recentf)

(global-set-key (kbd "C-x m") 'eshell)

;; NOTE: =M-j=/=C-M-j= binds =indent-new-comment-line=
(global-set-key (kbd "M-S-j") '(lambda () (interactive) (join-line -1)))


;; Word: C-c SPC, Char: C-u C-c SPC, Line: C-u C-u C-c SPC
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(add-hook 'org-mode-hook
          #'(lambda ()
              ;; original map to org-table-blank-field
              (local-unset-key (kbd "C-c SPC"))))

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


(use-package zoom-frm
  :bind (("C-M-=" . zoom-frm-in)
         ("C-M--" . zoom-frm-out)
         ("C-M-0" . zoom-frm-unzoom)))
