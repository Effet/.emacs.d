;; some from https://github.com/thelmstedt/emacs.d/blob/master/init-packages.el

;; use elpa(offical) package manager (package-*)
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; el-get package manager
;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path (concat dotfiles-dir "/el-get/el-get"))
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)

;; local sources
(setq el-get-sources
      '(
	;; smex (M-x)
	(:name smex
	       :after (lambda ()
			(require 'smex)
			(smex-initialize)
	       		(global-set-key (kbd "M-x") 'smex)
	       		;; (global-set-key (kbd "M-x") 'smex-major-mode-commands)
	       		;; This is your old M-x.
	       		(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
	
	;; undo tree (C-x u) (C-/) (C-?)
	(:name undo-tree
	       :type elpa
	       :after (lambda ()
			(require 'undo-tree)
			(global-undo-tree-mode)))

	;; highlight key work like eclipse
	(:name idle-highlight-mode
	       :type elpa
	       :after (lambda ()
			(idle-highlight-mode t)))

	;; "rainbow parentheses"-like mode
	(:name rainbow-delimiters
	       :type elpa
	       :after (lambda ()
			(require 'rainbow-delimiters)
			(setq-default frame-background-mode 'dark)))

	;; ...
	(:name auto-complete
	       :after (lambda ()
                        (require 'auto-complete-config)
                        (ac-config-default)
                        (ac-flyspell-workaround)
                        (ac-linum-workaround)

                        (global-auto-complete-mode t)

                        (set-default 'ac-sources
                                     '(ac-source-dictionary
                                       ac-source-words-in-buffer
                                       ac-source-words-in-same-mode-buffers
                                       ac-source-words-in-all-buffer))))
	;; git
	(:name magit
               :after (lambda ()
			(global-set-key (kbd "C-x C-z") 'magit-status)))
	
	;; ...
	(:name color-theme-solarized
	       :after (lambda ()
			(load-theme 'solarized-dark t)))

	;; input-method [eim] (C-\)
	(:name eim
	       :type git
	       :url "https://github.com/viogus/eim.git"
	       :after (lambda ()
			(require 'eim-extra)
			;; (autoload 'eim-use-package "eim"
			;;   "Another emacs input method")

			;; (setq eim-punc-translate-p nil)
			(setq eim-use-tooltip nil)
			(register-input-method
			 "eim-py" "euc-cn" 'eim-use-package
			 "拼音" "汉字拼音输入法" (concat dotfiles-dir "/py.txt"))
			(set-input-method "eim-py")
			;; (setq activate-input-method t)
			;; (toggle-input-method nil)
			))
	)
      )

(setq my-packages
      (append
       '(el-get
	 lua-mode
	 markdown-mode
	 color-theme
	 rect-mark)
	      (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

(provide 'init-packages)
