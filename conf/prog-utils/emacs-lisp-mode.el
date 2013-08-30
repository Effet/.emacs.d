(define-key emacs-lisp-mode-map (kbd "C-c .") 'find-function-at-point)

;; https://github.com/milkypostman/dotemacs/blob/master/init.el#L919-L924
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)
