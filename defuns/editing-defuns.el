;;;; Vim-like open-line
;;;###autoload
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

;;;###autoload
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))


;;;; Region editing
(defun copy-whole-line (&optional arg)
  (interactive "p")
  (or arg (setq arg 1))
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (1+ arg)))
  (if (> arg 1)
      (message "%d lines copied" arg)))

;;;###autoload
(defun copy-region-or-whole-line (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-whole-line arg)))

;;;###autoload
(defun kill-region-or-to-beginning-of-line ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (save-excursion (beginning-of-line) (point))
                 (point))))
