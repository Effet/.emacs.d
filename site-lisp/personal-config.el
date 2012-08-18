;;; personal-config.el --- Many configs after packages installed.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:20:23 2012 (+0800)
;; Last-Updated: Sat Aug 18 16:34:21 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;;{{{ Efficient Tools

;; M-x package-install RET autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers


;; (require 'autopair)

;; (defvar autopair-modes '(r-mode ruby-mode))
;; (defun turn-on-autopair-mode () (autopair-mode 1))
;; (dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

;; (require 'paredit)
;; (defadvice paredit-mode (around disable-autopairs-around (arg))
;;   "Disable autopairs mode if paredit-mode is turned on"
;;   ad-do-it
;;   (if (null ad-return-value)
;;       (autopair-mode 1)
;;     (autopair-mode 0)
;;     ))

;; (ad-activate 'paredit-mode)


;; M-x package-install RET ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; M-x package-install RET undo-tree
;; `undo-tree' (C-x u) (C-/) (C-?)
(require 'undo-tree)
(global-undo-tree-mode)


;;{{{ Time Stamp (head of file)

;; ``Time-stamp: <>'' in first 8 lines
(add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format

;;}}}
;;{{{ Header2 (file information)

;; M-x package-install RET header2
;; User Commands:
;;   M-x make-header
;;   M-x make-revision
;;   M-x make-divider
;;   M-x make-box-comment

(setq
 header-copyright-notice (concat "Copyright (C) 2012 "
                                 user-full-name
                                 " <" user-mail-address ">\n")
 )

(defun header-author-email ()
  (insert header-prefix-string "Mail: " user-mail-address "\n"))

(setq make-header-hook
      '(header-title
        header-blank
        header-author
        header-author-email
        header-blank
        ;; header-copyright
        header-creation-date
        header-modification-date
        header-blank
        header-end-line
        ;; header-free-software
        header-code header-eof))

(add-hook 'write-file-hooks 'auto-update-file-header)

;; (add-hook 'c-mode-common-hook 'auto-make-header)
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)

;;}}}


;;{{{ Folding

;; http://www.emacswiki.org/emacs/FoldingMode

(autoload 'folding-mode          "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

(if (load "folding" 'nomessage 'noerror)
    (folding-mode-add-find-file-hook))

(folding-add-to-marks-list
 'lua-mode "-- {{{" "-- }}}" nil t)
(add-hook 'lua-mode-hook 'folding-mode)

;; (folding-mode t)

;; (add-hook 'find-file-hook
;;           '(lambda ()
;;              (folding-mode)))

(add-hook 'c-mode-common-hook 'folding-mode)
(add-hook 'emacs-lisp-mode-hook 'folding-mode)

;;}}}

;;{{{ Auto Highlight Symbol

;; cd /your-emacs-load-path/
;; wget http://github.com/mitsuo-saito/auto-highlight-symbol-mode/raw/master/auto-highlight-symbol.el
;; emacs -batch -f batch-byte-compile auto-highlight-symbol.el
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(setq ahs-case-fold-search nil)
(ahs-set-idle-interval 0.5)

;;}}}
;;{{{ Volatile Highlights (visual feedback to some operations)

;; M-x package-install RET volatile-highlights
(require 'volatile-highlights)
(vhl/define-extension 'undo-tree 'undo-tree-undo 'undo-tree-redo)
(vhl/install-extension 'undo-tree)

;; (vhl/define-extension 'copy 'kill-ring-save)
;; (vhl/install-extension 'copy)

(vhl/define-extension 'helm-yank 'helm-c-kill-ring-action)
(vhl/install-extension 'helm-yank)

(volatile-highlights-mode t)

;;}}}

;;{{{ Ido (select-base menu)

;; `ido' (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)
(global-set-key (kbd "C-x C-d") 'ido-dired)

;;}}}
;;{{{ Helm (anything)

;; M-x package-install RET helm
(require 'helm-config)
(helm-mode 1)
(setq helm-ff-transformer-show-only-basename t)
;; (set-face-background 'helm-selection (face-background 'highlight))
;; (set-face-background 'helm-selection "#fdf6e3")
(setq helm-idle-delay 0.2)
(setq helm-input-idle-delay 0.2)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;`M-y' is hard to type for `Dovark'-typist.

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(require 'helm-files)
(helm-dired-bindings 1)

;;}}}

;;{{{ Quickrun

;; M-x package-install RET quickrun
;; https://github.com/syohex/emacs-quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)

;;}}}
;;{{{ Popwin (C-g to hide temp buffer)

;; M-x package-install RET popwin
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;       (append '(("*Apropos*") ("*sdic*") ("*Faces*") ("*Colors*"))
;;               popwin:special-display-config))
(push '("*quickrun*") popwin:special-display-config)
;; (push '("*helm M-x*") popwin:special-display-config)
(push '("*Backtrace*") popwin:special-display-config)
(push '("*Compile-Log*") popwin:special-display-config)
(push '("*TeX Help*") popwin:special-display-config)
(push '("*Shell Command Output*") popwin:special-display-config)
(push '("*Async Shell Command*") popwin:special-display-config)

;;}}}

;;}}}


;;{{{ General Behaviors

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; Delete Files to Trash
(setq delete-by-moving-to-trash t)


;; History
(setq auto-save-list-file-prefix nil
      make-backup-files nil)


(setq-default major-mode 'text-mode)


;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)


;; Cursor
(setq-default cursor-in-non-selected-windows nil)
(blink-cursor-mode -1)
;; (blink-cursor-delay 0.5)


;; Mouse
(setq mouse-wheel-progressive-speed nil)


;; Misc
(setq scroll-margin 3
      echo-keystrokes 0.1)


(setq-default require-final-newline t)
(setq-default fill-column 80)


;; Buffer
;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-editor.el#L80
;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; Tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; <backspace> after selection
(delete-selection-mode t)

;; At head of a line, press C-k will kill whole line.
(setq kill-whole-line t)


;; <return> always `newline-and-indent'
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; http://emacswiki.org/emacs/AutoIndentation
;; `yank-and-indent'
(dolist (command '(yank yank-pop helm-c-kill-ring-action))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))


;; ;; M-x package-install RET fill-column-indicator
;; (require 'fill-column-indicator)
;; ;; (add-hook 'prog-mode-hook 'fci-mode)
;; (setq fci-handle-truncate-lines nil)
;; (defun auto-fci-mode (&optional unused)
;;   (if (> (frame-width) (+ fill-column 7))
;;       (fci-mode 1)
;;     (fci-mode 0))
;;   )
;; (add-hook 'window-configuration-change-hook 'auto-fci-mode)


;; (global-font-lock-mode t)               ;highlight for grammar
;; (setq font-lock-maximum-decoration nil)   ;only load current page
;; (require 'generic-x)                    ;advance highlight


;;{{{ Coding System

;; M-x describe-coding-system
;; M-x revert-buffer-with-coding-system
;; M-x set-buffer-file-coding-system
;; M-x universal-coding-system-argument

;; http://www.masteringemacs.org/articles/2012/08/09/working-coding-systems-unicode-emacs/
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;}}}

;;{{{ Words Behaviors

;; `AbcAbc' as two words `Abc' and `Abc'
(global-subword-mode t)


;; ;; http://calvinyoung.org/2010/06/upgrading-backward-kill-word-in-emacs/
;; ;; Eclipes-style kill-word in the beginning of a line.
;; (defun my-backward-kill-word (&optional arg)
;;   "Replacement for the backward-kill-word command
;; If the region is active, then invoke kill-region.  Otherwise, use
;; the following custom backward-kill-word procedure.
;; If the previous word is on the same line, then kill the previous
;; word.  Otherwise, if the previous word is on a prior line, then kill
;; to the beginning of the line.  If point is already at the beginning
;; of the line, then kill to the end of the previous line.

;; With argument ARG and region inactive, do this that many times."
;;   (interactive "p")
;;   (if (use-region-p)
;;       (kill-region (mark) (point))
;;     (let (count)
;;       (dotimes (count arg)
;;         (if (bolp)
;;             (delete-backward-char 1)
;;           (kill-region (max (save-excursion (backward-word)(point))
;;                             (line-beginning-position))
;;                        (point)))))))

;; (define-key (current-global-map) [remap backward-kill-word]
;;   'my-backward-kill-word)

;;}}}

;;{{{ Window Settings

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

;;}}}
;;{{{ Highlight TODO: FIXME: BUG:

;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook
          'highlight-fixme-todo-bug)

;;}}}

;;}}}

;;{{{ Programming

(add-hook 'prog-mode-hook
          '(lambda()
             (highlight-parentheses-mode)
             ;; (highlight-symbol-mode)
             (rainbow-mode)
             ;; ;; this indent guides is `NOT-IN-PACKAGES', is copied from
             ;; ;; https://github.com/ran9er/init.emacs/blob/master/20_aux-line.el
             ;; (require 'aux-line)
             ;; (indent-hint-mode t)
             ))


(add-hook 'c++-mode-hook
          '(lambda()
             (setq c-default-style "linux"
                   c-basic-offset 4)
             
             (c-set-style "stroustrup")    ;c++ style
             (c-toggle-hungry-state)
             (c-toggle-auto-state)
             
             ;; keys
             ;; (define-key c++-mode-map [return] 'newline-and-indent)
             ;; (define-key c++-mode-map "\C-j" 'newline)
             ))


(add-hook 'emacs-lisp-mode-hook
          '(lambda()
             (rainbow-delimiters-mode)
             
             ;; (define-key emacs-lisp-mode-map [return] 'newline-and-indent)
             ))

;; (define-derived-mode lua-mode prog-mode "lua-mode")

;;}}}

;;{{{ Input Chinese

;; There's some problems.
(when nil
;; input-method [eim] (C-\)
;; `https://github.com/viogus/eim.git'
(add-to-list 'load-path (concat personal-lisp-directory "plugins/eim"))
(autoload 'eim-use-package "eim" "Another emacs input method")

;; (setq eim-punc-translate-p nil)
(setq eim-use-tooltip t)
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" (concat user-emacs-directory "/py.txt"))
(set-input-method "eim-py")
;; (activate-input-method t)
(activate-input-method "eim-py")
(toggle-input-method nil)

;; ;; 用 ; 暂时输入英文
;; (require 'eim-extra)
;; (global-set-key ";" 'eim-insert-ascii)

)

;;}}}



(provide 'personal-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-config.el ends here
