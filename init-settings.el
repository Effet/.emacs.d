;; global settings

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

(provide 'init-settings)
