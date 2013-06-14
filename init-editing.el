;;;; autopair
(with-package autopair-autoloads
  (setq autopair-blink nil)
  (autopair-global-mode))

;;;; ace-jump-mode
(with-package ace-jump-mode-autoloads
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode))


;;;; expand-region -- Killing extension for using GNU/Emacs
(with-package expand-region-autoloads
  (global-set-key (kbd "C-'") 'er/expand-region)
  (global-set-key (kbd "C-M-'") 'er/contract-region)
  (eval-after-load "org"
    '(define-key org-mode-map (kbd "C-'") 'er/expand-region)))


;;;; multiple-cursors
(with-package multiple-cursors-autoloads
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
  (global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor))


;;;; ack-and-a-half
(require-package 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)


;;;; Smart C-a
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key (kbd "C-a") 'smart-beginning-of-line)


;;;; newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "C-j") 'newline)


;;;; Vim-like open-line
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "C-<return>") 'open-line)
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)


;;;; Duplicate region
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (save-excursion
    (if (region-active-p)
        (duplicate-region arg)
      (duplicate-current-line arg))))

(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (goto-char start)
    (dotimes (i num)
      (insert region))))

(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol))))

(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)


;;;; Region editing
(defun copy-whole-line (&optional arg)
  (interactive "p")
  (or arg (setq arg 1))
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (1+ arg)))
  (if (> arg 1)
      (message "%d lines copied" arg)))

(defun copy-region-or-whole-line (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-whole-line arg)))

(defun kill-region-or-to-beginning-of-line ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (save-excursion (beginning-of-line) (point))
                 (point))))

(global-set-key [remap kill-ring-save] 'copy-region-or-whole-line)
(global-set-key [remap kill-region] 'kill-region-or-to-beginning-of-line)


;;;; move-text
(require-package 'move-text)
(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)


;;;; cleanup-buffer
;; https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el#L150
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(global-set-key (kbd "C-c n") 'cleanup-buffer)


;; Narrow (C-x n n)
(put 'narrow-to-region 'disabled nil)


(provide 'init-editing)
