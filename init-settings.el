;; global settings

;; font
(set-default-font "Envy Code R-11")
(set-fontset-font (frame-parameter nil 'font)
              'han '("WenQuanYi Micro Hei"))


;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; ;;支持emacs和外部程序的粘贴
;; (setq x-select-enable-clipboard t)
;; ;;关闭备份文件#xxx#
;; (setq auto-save-default nil)

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;;关闭emacs启动时的画面
(setq inhibit-startup-message t)
;;关闭gnus启动时的画面
(setq gnus-inhibit-startup-message t)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no
(fset 'yes-or-no-p 'y-or-n-p)


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

;; (C-x C-x) (C-u C-x C-x)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x C-x") 'eshell)
;; Start a new eshell even if one is active.
;(global-set-key (kbd "C-x C-x") (lambda () (interactive) (eshell t)))


(provide 'init-settings)
