;;;; Smart C-a
;;;###autoload
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))


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


;;;; Duplicate region
;;;###autoload
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


;;;; cleanup-buffer
;; https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el#L150
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;;;###autoload
(defun cleanup-buffer ()
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))


;;;; dired C-a
;;;###autoload
(defun dired-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (move-beginning-of-line nil)
    (if (= p (point))
        (dired-move-to-filename))))


;;;; use ido-find-file in ibuffer buffer
;; -> https://github.com/filsinger/emacs-config/blob/master/custom/ibuffer-ido-find-file.el#L4-L15
(defun ibuffer-ido-find-file (file &optional wildcards)
  "Like `find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (list (ido-read-file-name "Find file: " default-directory)
           t)))
  (find-file file wildcards))


;;;; Highlight TODO: FIXME: BUG:
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
;;;###autoload
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))
