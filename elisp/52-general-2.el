;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?d '(file . "~/dotFiles/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?s '(file . "~/dotEmacs/elisp/"))


;; <return> always `newline-and-indent'
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)


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



;;; ---- Input Chinese ----

;; There's some problems.
(when t
  ;; input-method [eim] (C-\)
  ;; `https://github.com/viogus/eim.git'
  (add-to-list 'load-path (concat user-lisp-directory "plugins/eim"))
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
