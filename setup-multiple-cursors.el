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

(provide 'setup-multiple-cursors)
