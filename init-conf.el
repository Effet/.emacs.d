;;; init-conf.el --- Many configs after packages installed.
;; 
;; Copyright (C) 2012 n4k0master <nesuadark@gmail.com>
;; 
;; Created: Thu Jul 19 20:55:36 2012 (+0800)
;; Last-Updated: Thu Jul 19 20:56:44 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; global settings

;; ;; -- UI
;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode -1))

;; ;; (menu-bar-mode -1)
;; (scroll-bar-mode -1)


;; Modeline Settings
(line-number-mode    t)
(column-number-mode  t)
(size-indication-mode t)


;; line-number
(global-linum-mode t)
(setq linum-format "%5d ")


;; (global-hl-line-mode t) ;; highlight line


;; ;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-ui.el#L82
;; ;; make the fringe (gutter) smaller
;; ;; the argument is a width in pixels (the default is 8)
;; (if (fboundp 'fringe-mode)
;;     (fringe-mode 6))


;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-ui.el#L90
;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name (:eval (if (buffer-file-name)
                                      (abbreviate-file-name (buffer-file-name))
                                    "%b"))))


;; For `Server-Client'.
(setq default-frame-alist
      '((font-backend . "xft")
        (font . "Inconsolata-12")
        ;; (font . "Envy Code R-11")
        ;; (alpha 86 84)
        (vertical-scroll-bars . nil)
        ;; (vertical-scroll-bars . 'right)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)

        (mouse-color . "white")

        (cursor-color . "wheat2")
        (cursor-type . bar)
        ;; (foreground-color . "white")
        ;; (background-color ."black"))
      ))



;; ;; Themes
;; ;; (color-theme-solarized-dark)
;; (require 'solarized-mod-theme)
;; (if window-system
;;     (enable-theme 'solarized-mod)
;;   (enable-theme 'solarized-mod))
(load-theme 'solarized-dark t)


(blink-cursor-mode t)


;; `coding-system'
;; (set-language-environment 'utf-8) ;this may couse `eim' error
(prefer-coding-system 'utf-8)
;; (setq file-name-coding-system 'utf-8)
;; (setq-default pathname-coding-system 'utf-8)


;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-editor.el#L80
;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)


;; `ediff' in single window
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


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

 x-select-enable-clipboard t            ;Use `Shift-Ins'

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


(require 'rect-mark)


;; ;; lambda -> λ
;; (require 'pretty-mode)
;; (global-pretty-mode t)


;; this indent guides is `NOT-IN-PACKAGES', is copied from
;; https://github.com/ran9er/init.emacs/blob/master/20_aux-line.el
(require 'aux-line)
;; (indent-vline)
;; (indent-vline-lisp)


;; ;; sublime text2 minimap
;; (require 'minimap)
;; (global-set-key [(f11)] 'minimap-toggle)


;; ;; Change Cursor when Mode.
;; (require 'cursor-chg)  ; Load the library
;; (toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
;; (change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode
;; (setq curchg-default-cursor-color "wheat2")


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; ;; nice look tooltip
;; (require 'pos-tip)
;; (if (eq system-type 'windows-nt)
;;     '(pos-tip-w32-max-width-height))

;; ;; (require 'popup)
;; ;; (require 'pos-tip)
;; (require 'popup-kill-ring)
;; ;; (setq popup-kill-ring-interactive-insert t)
;; (global-set-key (kbd "C-y") 'popup-kill-ring)


;; `undo-tree' (C-x u) (C-/) (C-?)
(require 'undo-tree)
(global-undo-tree-mode)


;; ;; `ibuffer' (C-x C-b)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (autoload 'ibuffer "ibuffer" "List buffers." t)


;; ;; `ido' (C-x C-f/C-x b)
;; ;; (require 'ido)
;; (ido-mode t)


;; ;; `smex' (M-x)
;; ;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(add-to-list 'load-path (concat dot-emacs-dir "/helm"))
(require 'helm-config)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x d")   'helm-find-files)
(global-set-key (kbd "C-x C-d") 'helm-find-files)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;`M-y' is hard to type for `dovark'-typist.

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)


;; (require 'autoinsert)
;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; (setq auto-insert-directory (concat dot-emacs-dir "/auto-insert"))
;; (setq auto-insert-query nil)
;; (define-auto-insert "\.py" "my-python.py")

;; User Commands:
;;   M-x make-header
;;   M-x make-revision
;;   M-x make-divider
;;   M-x make-box-comment

(setq
 header-copyright-notice "Copyright (C) 2012 n4k0master <nesuadark@gmail.com>\n"
 ;; header-author               'user-full-name
 ;; header-modification-author  'user-full-name
 header-author               'user-login-name
 header-modification-author  'user-login-name
 ;; header-file-name            'buffer-file-name
 ;; header-creation-date        'current-time-string
 ;; header-date-format          nil
 )

(setq make-header-hook
      '(header-title
        header-blank
        header-copyright
        header-blank
        ;; header-file-name
        ;; header-description
        
        ;; header-author
        ;; header-blank
        header-creation-date
        header-modification-date
        header-blank
        header-end-line
        ;; header-free-software
        header-code header-eof))

(add-hook 'write-file-hooks 'auto-update-file-header)

(add-hook 'c-mode-common-hook 'auto-make-header)
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)


;; `git' status
;; (global-set-key (kbd "C-x C-g") 'magit-status)



;; ``Time-stamp: <>'' in first 8 lines
(add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format



;; -- Window settings.

;; usage:
;;   M-x windmove-up	/ C-up
;;   M-x windmove-down	/ C-down
;;   M-x windmove-left	/ C-left
;;   M-x windmove-right / C-right
(require 'windmove)
(windmove-default-keybindings 'ctrl)


;; usage:
;;   M-x winner-undo / C-c <left>
;;   M-x winner-redo / c-c <right>
(winner-mode t)



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


;; (require 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.5)
(defvar highlight-symbol-colors
  '("yellow" "DeepPink" "cyan" "MediumPurple1"
    "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)


;; This handles other autopair-handle-action-fns, plus works on every mode where highlight-parentheses-mode is used.
;; http://www.emacswiki.org/HighlightParentheses
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
					(if autopair-handle-action-fns
						autopair-handle-action-fns
					  '(autopair-default-handle-action))
					'((lambda (action pair pos-before)
						(hl-paren-color-update)))))))


(defun lispy-parens ()
  "Setup parens display for lisp modes"
  (setq show-paren-delay 0)
  (setq show-paren-style 'parenthesis)
  (make-variable-buffer-local 'show-paren-mode)
  (show-paren-mode 1)
  (set-face-background 'show-paren-match-face (face-background 'default))
  (if (boundp 'font-lock-comment-face)
      (set-face-foreground 'show-paren-match-face
                           (face-foreground 'font-lock-comment-face))
    (set-face-foreground 'show-paren-match-face
                         (face-foreground 'default)))
  (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold))



(add-hook 'prog-mode-hook
          '(lambda()
             ;; -- highlight `parens'
             ;; (show-paren-mode t)
             ;; (setq show-paren-style 'parentheses)
             ;; (setq show-paren-style 'expression)
             (lispy-parens)

             (highlight-parentheses-mode)
             (highlight-symbol-mode)
             (rainbow-mode)

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




;; ;; input-method [eim] (C-\)
;; ;; `https://github.com/viogus/eim.git'

;; (require 'eim-extra)
;; (autoload 'eim-use-package "eim"
;;   "Another emacs input method")

;; (setq eim-punc-translate-p nil)
;; (setq eim-use-tooltip t)
;; (register-input-method
;;  "eim-py" "euc-cn" 'eim-use-package
;;  "拼音" "汉字拼音输入法" (concat dot-emacs-dir "/py.txt"))
;; (set-input-method "eim-py")
;; ;; (activate-input-method t)
;; (activate-input-method "eim-py")
;; (toggle-input-method nil)


(provide 'init-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-conf.el ends here
