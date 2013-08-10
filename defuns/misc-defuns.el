;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L20
;;;###autoload
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode -1)))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L95
;;;###autoload
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


;; https://github.com/biern/.emacs.d/blob/master/conf-fullscreen.el#L1
;;;###autoload
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))


;;;###autoload
(defun init-time ()
  "Modifier for emacs-init-time."
  (interactive)
  (let ((str
         (format "%.10f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time)))))
    (if (called-interactively-p 'interactive)
        (message "%s" str)
      str)))
