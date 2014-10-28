(use-package exec-path-from-shell
  :init
  (progn
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))))

(defun toggle-term-char-line ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(add-hook 'term-mode-hook
          (lambda ()
            ;; why needed?
            (define-key term-mode-map (kbd "C-c C-j") 'toggle-term-char-line)))

(use-package multi-term
  :ensure multi-term
  :bind (("C-c m" . multi-term-next)
         ("C-c M" . multi-term))
  :init
  (progn
    (require 'multi-term)
    (setq multi-term-program (or (getenv "SHELL") "/bin/sh"))
    (setq term-bind-key-alist
          (append term-bind-key-alist
                  '(("C-c C-j" . toggle-term-char-line))))))
