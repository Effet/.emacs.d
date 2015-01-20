(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

(add-hook 'poly-markdown-mode-hook
          (lambda ()
            (orgtbl-mode)))

(provide 'init-md)
