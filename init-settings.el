;; global settings


;; font
(set-default-font "Envy Code R 11")
(set-fontset-font (frame-parameter nil 'font)
		  'han '("WenQuanYi Micro Hei"))

;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; load the theme
(load-theme 'solarized-dark t)


;; line/columns
(global-linum-mode t)
(column-number-mode t)
;; highlight line
(global-hl-line-mode t)

;; highlight parens
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; (setq-default cursor-type 'bar)
;; (global-font-lock-mode t)               ;highlight for grammar
(require 'generic-x)                    ;advance highlight



(fset 'yes-or-no-p 'y-or-n-p)           ;always use y-n instead of yes-no

;; back up & tab
(setq-default
 make-backup-files	nil                 ;do not back up
 indent-tabs-mode	nil                 ;use [space] to indet
 ;; tab-always-indent	nil
 tab-width		4
 )

(setq 
 ;; unable emacs/gnus startup message
 inhibit-startup-message		t
 gnus-inhibit-startup-message	t

 ring-bell-function		'ignore			;close 'bee' noise
 visible-bell			t

 echo-keystrokes				0.1
 ;; suggest-key-bindings			1

 scroll-margin					3		;let 3 lines after scroll
 default-fill-column			80

 font-lock-maximum-decoration	t		;only load current page

;; 支持emacs和外部程序的粘贴
 x-select-enable-clipboard		t
 )


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

;; git status
(global-set-key (kbd "C-x C-z") 'magit-status)



;; mode-hook

;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (define-key prog-mode-map [return] 'newline-and-indent)

(add-hook 'c++-mode-hook
          '(lambda()
             ;; (c-set-style "stroustrup")    ;c-style edit
             ;; (c-toggle-hungry-state)
             ;; (c-toggle-auto-state)
             ;; keys
             (define-key c++-mode-map [return] 'newline-and-indent)
             (define-key c++-mode-map [(f9)]
               '(lambda()
                  "A quick compile funciton for C++"
                  (interactive)
                  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))))
             (highlight-parentheses-mode)
             ))

(add-hook 'emacs-lisp-mode-hook
	  '(lambda()
         (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
         (idle-highlight-mode)
         (rainbow-delimiters-mode)
         (highlight-parentheses-mode)   ;may conflict with rainbow-*
         ))


(provide 'init-settings)
