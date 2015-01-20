(defun my-rust-quick-compile()
  "A quick compile funciton for Rust"
  (interactive)
  (save-buffer)
  (compile (concat "rustc " (buffer-name (current-buffer)))))

(add-hook 'rust-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-c") 'my-rust-quick-compile)
             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)))

(provide 'init-rust)
