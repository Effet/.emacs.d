;;; Efficient Tools

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(require 'iy-go-to-char)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)


(require 'undo-tree)
(global-undo-tree-mode)
;; http://ergoemacs.org/emacs/emacs_best_redo_mode.html
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)


(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-M-'") 'er/contract-region)


(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; rebind C-x o
(require 'switch-window)


;; ``Time-stamp: <>'' in first 8 lines
(add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format


;;; ---- Header2 (file information) ----
;;  make-{header,revision,divider,box-comment}

(setq
 header-copyright-notice (concat "Copyright (C) 2012 "
                                 user-full-name
                                 " <" user-mail-address ">\n")
 )

(defun my-header-email ()
  (insert header-prefix-string "E-mail: " user-mail-address "\n"))

(defun my-header-blank ()
  (insert "\n"))

(defun my-header-divider ()
  (insert comment-start (if (= 0 (length comment-end))
                            (make-string 10 (aref comment-start 0))
                          (concat (make-string 8 ?\*) comment-end))
          "\n"))

(setq make-header-hook
      '(;; header-mode-line
        ;; header-title
        ;; (lambda ()
        ;;   (insert "hello World"))
        header-file-name
        my-header-blank
        header-author
        my-header-email
        my-header-blank
        ;; header-copyright
        header-creation-date
        header-modification-date
        my-header-blank
        my-header-divider
        ;; header-free-software
        ;; header-code
        header-eof))


;;; Folding

(require 'fold-dwim)
(global-set-key (kbd "C-c =") 'fold-dwim-toggle)
(global-set-key (kbd "C-c -") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c +") 'fold-dwim-show-all)

;; (global-set-key (kbd "C-#") 'hs-toggle-hiding)

(dolist (hook '(emacs-lisp-mode-hook
                c-mode-common-hook
                python-mode))
  (add-hook hook
            '(lambda ()
              (hs-minor-mode 1)
              (hideshowvis-enable)
              (hs-hide-all))))

(hideshowvis-symbols)


;;; ---- Volatile Highlights (visual feedback to some operations) ----

;; M-x package-install RET volatile-highlights
(require 'volatile-highlights)
(vhl/define-extension 'undo-tree 'undo-tree-undo 'undo-tree-redo)
(vhl/install-extension 'undo-tree)

;; (vhl/define-extension 'copy 'kill-ring-save)
;; (vhl/install-extension 'copy)

(vhl/define-extension 'helm-yank 'helm-c-kill-ring-action)
(vhl/install-extension 'helm-yank)

(volatile-highlights-mode t)


(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'volatile-highlights-mode)


;; `ido' (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)
;; (global-set-key (kbd "C-x C-d") 'ido-dired)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; Popwin (C-g to hide temp buffer)
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;       (append '(("*Apropos*") ("*sdic*") ("*Faces*") ("*Colors*"))
;;               popwin:special-display-config))
(push '("*quickrun*") popwin:special-display-config)
(push '("*Backtrace*") popwin:special-display-config)
(push '("*Compile-Log*") popwin:special-display-config)
(push '("*TeX Help*") popwin:special-display-config)
(push '("*Async Shell Command*") popwin:special-display-config)
;; (push '("*Buffer List*") popwin:special-display-config)



;; M-x package-install RET helm
;; (require 'helm-config)
;; (helm-mode 1)
;; (setq helm-ff-transformer-show-only-basename t)
;; (setq helm-idle-delay 0.2)
;; (setq helm-input-idle-delay 0.2)

;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-M-x-always-save-history t)

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-y") 'helm-show-kill-ring)
;; ;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)


;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c h") 'helm-mini)

;; (require 'helm-files)
;; (helm-dired-bindings 1)


;;; ---- General Behaviors ----

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; Delete Files to Trash
(setq delete-by-moving-to-trash t)


;; History
(setq auto-save-list-file-prefix nil
      make-backup-files nil)
;; (setq auto-save-default nil) ; stop creating those #autosave# files


(recentf-mode 1) ; keep a list of recently opened files


(setq-default major-mode 'text-mode)


;; Alarm bell
;; http://emacsblog.org/2007/02/06/quick-tip-visible-bell/
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)
;; (setq ring-bell-function (lambda () (message "*beep*")))


;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)


;; Cursor
(setq-default cursor-in-non-selected-windows nil)
(blink-cursor-mode t)
(setq-default cursor-type 'box)


;; Mouse
(setq mouse-wheel-progressive-speed nil)
;; (add-to-list 'default-frame-alist '(mouse-color . "white"))


;; Misc
(setq scroll-margin 0
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


;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?d '(file . "~/dotFiles/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?s '(file . "~/dotEmacs/site-lisp/"))


(midnight-delay-set 'midnight-delay "4:30am")


;;; ---- Coding System ----

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


;; TODO: use utf-8
(if (eq system-type 'windows-nt)
    (set-language-environment 'Chinese-GB))


;;; ---- Words Behaviors ----

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


(require 'windmove)
(windmove-default-keybindings 'ctrl)

;; usage:
;;   M-x winner-undo  C-c <left>
;;   M-x winner-redo  c-c <right>
(winner-mode t)

;;; ---- Highlight TODO: FIXME: BUG: ----
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook
          'highlight-fixme-todo-bug)


;;; ---- Programming ----

(add-hook 'prog-mode-hook '(lambda() (rainbow-mode)))

(add-hook 'sgml-mode-hook
          '(lambda()
             (zencoding-mode)
             (local-set-key (kbd "C-c C-j") 'zencoding-expand-line)))


(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(add-hook 'c++-mode-hook
          '(lambda()
             (setq c-default-style "linux"
                   c-basic-offset 4
                   )
             
             ;; (c-set-style "stroustrup")    ;c++ style
             (c-toggle-hungry-state)
             (c-toggle-auto-state)

             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)
             ))


;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda()
;;              (rainbow-delimiters-mode)))

;; (define-derived-mode lua-mode prog-mode "lua-mode")


;;; ---- Input Chinese ----

;; There's some problems.
(when t
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

  ;; 用 ; 暂时输入英文
  (require 'eim-extra)
  (global-set-key ";" 'eim-insert-ascii)
  
  )


(provide 'personal-config)
