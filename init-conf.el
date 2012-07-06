;; global settings


;; menus
;; (menu-bar-mode -1)
;; (tool-bar-mode -1)
(scroll-bar-mode -1)


;; (line-number-mode    t) ;default
(column-number-mode  t)
;; highlight line
(global-hl-line-mode t)


;; lines
(global-linum-mode t)


(require 'linum-relative)
(global-set-key [(f12)]
                '(lambda ()
                   (interactive)
                   (if (eq linum-format 'dynamic)
                       (setq linum-format 'linum-relative)
                     (setq linum-format 'dynamic))))
(setq linum-relative-current-symbol "->")
(set-face-attribute 'linum-relative-current-face nil
                    :foreground "#d33582" ;$magenta:   #d33682;
                    :background "#073642" ;$base02:    #073642;
                    )


;; highlight parens
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;; (global-font-lock-mode t)               ;highlight for grammar
(require 'generic-x)                    ;advance highlight


(fset 'yes-or-no-p 'y-or-n-p)           ;always use y-n instead of yes-no


(put 'dired-find-alternate-file 'disabled nil)


;; back up & tab
(setq-default
 make-backup-files	nil                 ;do not back up
 indent-tabs-mode	nil                 ;use [space] to indet
 ;; tab-always-indent	nil
 tab-width		4
 )


(setq
 default-major-mode		'text-mode
 inhibit-startup-message	t           ;unable startup message
 visible-bell		nil                 ;use visible-bell instead of 'bee'
 echo-keystrokes	0.1
 ;; suggest-key-bindings 1

 font-lock-maximum-decoration	t		;only load current page

 scroll-margin			3               ;let 3 lines after scroll
 default-fill-column	80

 require-final-newline	t
 )


;; Use `Trash' when deleting files
(setq delete-by-moving-to-trash t)


;; (set-language-environment 'utf-8) ;this may couse `eim' error
(prefer-coding-system 'utf-8)
;; (setq file-name-coding-system 'utf-8)
;; (setq-default pathname-coding-system 'utf-8)


(require 'rect-mark)


;; ;; lambda -> λ
;; (require 'pretty-mode)
;; (global-pretty-mode t)


;; this indent guides is `NOT-IN-PACKAGES', is copied from
;; https://github.com/ran9er/init.emacs/blob/master/20_aux-line.el
(require 'aux-line)
;; (indent-vline)
;; (indent-vline-lisp)


;; sublime text2 minimap
;; (require 'minimap)
;; (global-set-key [(f11)] 'minimap-toggle)


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; nice look tooltip
(require 'pos-tip)
(if (string= system-type "windows-nt")
    '(pos-tip-w32-max-width-height))

;; (require 'popup)
;; (require 'pos-tip)
(require 'popup-kill-ring)
;; (setq popup-kill-ring-interactive-insert t)
(global-set-key (kbd "C-y") 'popup-kill-ring)


;; undo tree (C-x u) (C-/) (C-?)
(require 'undo-tree)
(global-undo-tree-mode)


;; ido (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)


;; ibuffer (C-x C-b)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; smex (M-x)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; git status
(global-set-key (kbd "C-x C-z") 'magit-status)


;; warning if a line too long
(font-lock-add-keywords
 'c++-mode
 '(("^[^\n]\\{80\\}\\(.*\\)$"
    1 font-lock-warning-face prepend)))

(font-lock-add-keywords
 'emacs-lisp-mode
 '(("^[^\n]\\{80\\}\\(.*\\)$"
    1 font-lock-warning-face prepend)))


;; window settings

;; usage:
;;   M-x windmove-up	/ C-up
;;   M-x windmove-down	/ C-down
;;   M-x windmove-left	/ C-left
;;   M-x windmove-right / C-right
(windmove-default-keybindings 'ctrl)


;; usage:
;;   M-x winner-undo / C-c <left>
;;   M-x winner-redo / c-c <right>
(winner-mode t)


(set-mouse-color "white")
;; daemon settings
(defun frame-setting ()
  (if window-system
      (progn
        (blink-cursor-mode t)
        (setq x-select-enable-clipboard t)
        ;; font & theme
        ;; (set-default-font "Envy Code R 11")
        (set-frame-font "Envy Code R 11")
        (set-fontset-font (frame-parameter nil 'font)
                          'han '("WenQuanYi Micro Hei"))
        (color-theme-solarized-dark)
        )
    (color-theme-charcoal-black)))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (frame-setting))))
  (frame-setting))


;; mode-hook

;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (define-key prog-mode-map [return] 'newline-and-indent)


(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")    ;c-style edit
             (c-toggle-hungry-state)
             (c-toggle-auto-state)
             (indent-vline-fixed)       ;`TEST-SIGNAL'
             ;; keys
             (define-key c++-mode-map [return] 'newline-and-indent)
             (define-key c++-mode-map [(f9)]
               '(lambda()
                  "A quick compile funciton for C++"
                  (interactive)
                  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))))
             (highlight-parentheses-mode)
             (idle-highlight-mode)
             ))

(add-hook 'emacs-lisp-mode-hook
	  '(lambda()
         (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
         (idle-highlight-mode)
         (rainbow-delimiters-mode)
         ;; (highlight-parentheses-mode)   ;may conflict with rainbow-*
         (indent-vline-lisp)            ;`TEST-SIGNAL'
         ))


;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (setq flymake-gui-warnings-enabled nil)
;; (setq flymake-log-level 0)



(provide 'init-conf)
