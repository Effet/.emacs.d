;; (desktop-save-mode 1)

(add-hook 'after-init-hook 'session-initialize)


;; http://www.emacswiki.org/emacs/EmacsSession
;;; expanded folded secitons as required
(defun le::maybe-reveal ()
  (when (and (or (memq major-mode  '(org-mode outline-mode))
                 (and (boundp 'outline-minor-mode)
                      outline-minor-mode))
             (outline-invisible-p))
    (if (eq major-mode 'org-mode)
        (org-reveal)
      (show-subtree))))

(add-hook 'session-after-jump-to-last-change-hook
          'le::maybe-reveal)

(provide 'init-sessions)
