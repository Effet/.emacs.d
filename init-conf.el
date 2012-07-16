;; global settings


;; menus
;; (menu-bar-mode -1)
;; (tool-bar-mode -1)
(scroll-bar-mode -1)


;; (line-number-mode    t)
(column-number-mode  t)


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


;; `dired' in single buffer
(put 'dired-find-alternate-file 'disabled nil)


(fset 'yes-or-no-p 'y-or-n-p)        ;always use y-n instead of yes-no


;; Use `Trash' when deleting files
(setq delete-by-moving-to-trash t)


(setq-default
 ;; `Backup' & `Tab' settings
 make-backup-files    nil               ;do `not' back up
 indent-tabs-mode     nil               ;use `Tab' to indent
 ;; tab-always-indent	nil
 tab-width             4
 
 ;; Other stuffs
 major-mode    'text-mode
 fill-column          80
 )


(setq
 inhibit-startup-message  t             ;unable startup message
 visible-bell		nil                 ;use visible-bell instead of 'bee'
 echo-keystrokes	0.1
 ;; suggest-key-bindings 1


 scroll-margin   3                      ;let 3 lines after scroll

 require-final-newline	t
 )


;; -- Setting for `font-look'.
;; (global-font-lock-mode t)               ;highlight for grammar
(setq font-lock-maximum-decoration t)   ;only load current page
(require 'generic-x)                    ;advance highlight


(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers


(delete-selection-mode t)


;; `coding-system'
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
(require 'minimap)
(global-set-key [(f11)] 'minimap-toggle)


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; nice look tooltip
(require 'pos-tip)
(if (eq system-type 'windows-nt)
    '(pos-tip-w32-max-width-height))

;; (require 'popup)
;; (require 'pos-tip)
(require 'popup-kill-ring)
;; (setq popup-kill-ring-interactive-insert t)
(global-set-key (kbd "C-y") 'popup-kill-ring)


;; `undo-tree' (C-x u) (C-/) (C-?)
(require 'undo-tree)
(global-undo-tree-mode)


;; `ido' (C-x C-f/C-x b)
;; (require 'ido)
(ido-mode t)


;; `ibuffer' (C-x C-b)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; `smex' (M-x)
;; (require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; `git' status
(global-set-key (kbd "C-x C-z") 'magit-status)



;; -- Window settings.

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

(if window-system
    (progn
      (blink-cursor-mode t)

      (global-hl-line-mode t) ;; highlight line
      (setq x-select-enable-clipboard t)
      
      ;; font & theme
      ;; (set-default-font "Envy Code R 11")
      (set-frame-font "Envy Code R 11")
      (set-fontset-font (frame-parameter nil 'font)
                        'han '("WenQuanYi Micro Hei"))
      (color-theme-solarized-dark)
      )
  (color-theme-calm-forest)
  )



;; -- Settings for `mode-hook'.


;; Warning if a `line-too-long', `TODO', `FIXME', `BUG'.
;; http://emacs-fu.blogspot.com/2008/12/highlighting-lines-that-are-too-long.html
(defun highlight-if-too-long ()
  (font-lock-add-keywords nil
                          '(("^[^\n]\\{80\\}\\(.*\\)$"
                             1 font-lock-warning-face t))))
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook
          '(lambda()
             ;; -- highlight `parens'
             (show-paren-mode t)
             ;; (setq show-paren-style 'parentheses)
             (setq show-paren-style 'expression)

             (idle-highlight-mode)
             (highlight-parentheses-mode)
             
             (indent-vline-fixed)       ;`TEST-SIGNAL'
             (highlight-if-too-long)    ;`personal-function'
             (highlight-fixme-todo-bug) ;`personal-function'
             ))



(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")    ;c-style edit
             (c-toggle-hungry-state)
             (c-toggle-auto-state)
             
             ;; keys
             (define-key c++-mode-map [return] 'newline-and-indent)
             ;; (define-key c++-mode-map "\C-j" 'newline)
             ))


(add-hook 'emacs-lisp-mode-hook
	  '(lambda()
         (rainbow-delimiters-mode)
         
         (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
         ))



;; `test'
;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (setq flymake-gui-warnings-enabled nil)
;; (setq flymake-log-level 0)



(provide 'init-conf)
