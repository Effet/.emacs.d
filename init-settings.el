;; global settings

;; menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line/columns
(global-linum-mode t)
;; (require 'wb-line-number)
;; (wb-line-number-toggle)
(column-number-mode t)
;; highlight line
(global-hl-line-mode t)

;; highlight parens
(show-paren-mode t)
(setq show-paren-style 'parentheses)

(if (string= system-type "windows-nt")
    (progn
      (setq-default cursor-type 'bar)))

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
 default-major-mode		'text-mode
 inhibit-startup-message	t           ;unable startup message
 visible-bell		t                   ;use visible-bell instead of 'bee'
 echo-keystrokes	0.1
 ;; suggest-key-bindings 1

 font-lock-maximum-decoration	t		;only load current page

 scroll-margin			3               ;let 3 lines after scroll
 default-fill-column	80

 mouse-avoidance-mode	'animate
 require-final-newline	t
 )

;; (set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
;; (setq file-name-coding-system 'utf-8)
;; (setq-default pathname-coding-system 'utf-8)


;; nice look tooltip
(require 'pos-tip)
(if (string= system-type "windows-nt")
    '(pos-tip-w32-max-width-height))

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



;; (C-x C-x) (C-u C-x C-x)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-c C-x") 'eshell)

;; git status
(global-set-key (kbd "C-x C-z") 'magit-status)


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
        (color-theme-solarized-dark))
    (color-theme-calm-forest)))

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

;; warning if a line too long
(font-lock-add-keywords
 'c++-mode
 '(("^[^\n]\\{80\\}\\(.*\\)$"
    1 font-lock-warning-face prepend)))

(font-lock-add-keywords
 'emacs-lisp-mode
 '(("^[^\n]\\{80\\}\\(.*\\)$"
    1 font-lock-warning-face prepend)))


(add-hook 'emacs-lisp-mode-hook
	  '(lambda()
         (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
         (idle-highlight-mode)
         (rainbow-delimiters-mode)
         ;; (highlight-parentheses-mode)   ;may conflict with rainbow-*
         ))

(add-to-list 'load-path
             "~/.emacs.d/dictionary-1.8.7"
             t)

(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)

(setq dictionary-server "dict.org")
(global-set-key (kbd "C-c s") 'dictionary-search)
;; (global-set-key (kbd "C-c m") 'dictionary-match-words)

;; (setq dictionary-tooltip-dictionary "gcide")
(require 'dictionary)
(global-dictionary-tooltip-mode t)

(global-set-key (kbd "<mouse-3>") 'dictionary-mouse-popup-matching-words)
(global-set-key (kbd "C-c m") 'dictionary-popup-matching-words)

(add-hook 'text-mode-hook 'dictionary-tooltip-mode)

(provide 'init-settings)
