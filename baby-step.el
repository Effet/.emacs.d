;; load paths
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;(add-to-list 'load-path "~/.emacs.d")
(require 'init-packages)

;; menus
;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
(set-default-font "Envy Code R-11")
(set-fontset-font (frame-parameter nil 'font)
              'han '("WenQuanYi Micro Hei"))

;; ido (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)

;; ibuffer (C-x C-b)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; ;; yasnippet (Tab/C-i)
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")
;; (yas/global-mode t)

;; ;; auctex (for tex/ps/pdf)
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

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
