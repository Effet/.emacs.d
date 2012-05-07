;; use elpa(offical) package manager (package-*)
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; menus
;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
(set-default-font "Envy Code R-11")
(set-fontset-font (frame-parameter nil 'font)
              'han '("WenQuanYi Micro Hei"))

;; color theme
(load-theme 'solarized-dark t)

;; ido (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)

;; smex (M-x)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ibuffer (C-x C-b)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; undo tree (C-x u)
(require 'undo-tree)
(global-undo-tree-mode)

;; auto complete()
;(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")

;; yasnippet (Tab/C-i)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")
(yas/global-mode t)

;; ;; auctex (for tex/ps/pdf)
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)


;; input-method [eim] (C-\)
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(require 'eim-extra)

(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-punc-translate-p nil)
(setq eim-use-tooltip nil)

(register-input-method
  "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "~/.emacs.d/site-lisp/eim/py.txt")

(set-input-method "eim-py")
(setq activate-input-method t)
(toggle-input-method nil)
;(provide 'eim-extension)

;; codings
(defun my-coding-hook ()
  ;; show line number
  (linum-mode t)
  (column-number-mode t)
  (hl-line-mode t)
  ;; highlight key work like eclipse
  (idle-highlight-mode t)
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
;(add-hook 'ruby-mode-hook 'my-coding-hook)
;(add-hook 'js2-mode-hook 'my-coding-hook)
