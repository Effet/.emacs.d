;; ...

;; codings
(defun my-coding-hook ()
  ;; show line number
  (linum-mode t)
  (column-number-mode t)
  (hl-line-mode t)
  ;; 高亮匹配括号
  (show-paren-mode t)
  ;; use rainbow delimiters highlight
  (rainbow-delimiters-mode)

  (setq show-paren-style 'parentheses)
  )

;;=== C++设置 ===
(defun my-cc-mode-hook()
  ;; tab相关的设置
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  ;; 换行的同时对齐
  (define-key c++-mode-map [return] 'newline-and-indent)
  ;; C编辑风格
  (c-set-style "stroustrup")
  (c-toggle-hungry-state)
  (c-toggle-auto-state)
  ;; 快速编译
  (defun quick-compile ()
    "A quick compile funciton for C++"
    (interactive)
    (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))
    )
  ;; F9编译
  (global-set-key [(f9)] 'quick-compile)
  )

(add-hook 'c++-mode-hook 'my-coding-hook)
(add-hook 'c++-mode-hook 'my-cc-mode-hook)

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'lua-mode-hook 'my-coding-hook)
;(add-hook 'ruby-mode-hook 'my-coding-hook)
;(add-hook 'js2-mode-hook 'my-coding-hook)

(provide 'init-mode-settings)
