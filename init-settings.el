;; global settings

;; font
(set-default-font "Envy Code R 11")
(set-fontset-font (frame-parameter nil 'font)
              'han '("WenQuanYi Micro Hei"))

;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;; ;;关闭备份文件#xxx#
;; (setq auto-save-default nil)


;; close 'bee' noise
(setq visible-bell t)

;; unable emacs/gnus startup message
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; always use y-n instead of yes-no
(fset 'yes-or-no-p 'y-or-n-p)

;; ido (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)

;; ibuffer (C-x C-b)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; (C-x C-x) (C-u C-x C-x)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-c C-x") 'eshell)

;; (define-key global-map "C-c C-g" 'goto-line)
(global-set-key (kbd "C-c C-g") 'goto-line)

(provide 'init-settings)
