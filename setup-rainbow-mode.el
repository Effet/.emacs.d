;; if use M-x way enable `rainbow-mode', M-o M-o to refontify.
(use-package rainbow-mode
  :commands rainbow-mode
  :init
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))))

(provide 'setup-rainbow-mode)
