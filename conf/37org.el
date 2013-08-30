;; Hint: C-c C-t org-todo
;; Hint: C-c C-o org-open-at-point
;; Hint: C-c C-x C-l org-preview-latex-fragment

;; (setq org-replace-disputed-keys t)
(setq org-startup-indented t)
(setq org-startup-folded 'content)
(setq org-src-fontify-natively t)
(setq org-link-file-path-type 'relative)

(defun org-time-stamp-setting ()
  (setq time-stamp-pattern
        "8/DATE:[ \t]+\\\\?[\"<]%Y-%02m-%02d\\\\?[\">]")
  (add-hook 'before-save-hook 'time-stamp))

(add-hook 'org-mode-hook
          'org-time-stamp-setting)
