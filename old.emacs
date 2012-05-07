;; set number
(global-linum-mode t)

;; Do not backup files
(setq make-backup-files nil)

;; hide menu/tool/scroll bar
;(menu-bar-mode -1)
;(tool-bar-mode -1)
(scroll-bar-mode -1)

;; color theme
(require 'color-theme)
(color-theme-initialize)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-dark)
(color-theme-tangotango)
;;(color-theme-catl)
;;(color-theme-robin-hood)


;; key-binding
;;(global-unset-key (kbd "C-SPC"))
;;(global-set-key (kbd "C-SPC") 'nil)
;;(global-set-key (kbd "M-SPC") 'set-mark-command) 

;; input-method
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(require 'eim-extra)

(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-punc-translate-p nil)
(setq eim-use-tooltip nil)

(register-input-method
  "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "~/.emacs.d/site-lisp/eim/py.txt")

(set-input-method "eim-py")
(setq activate-input-method t)
(toggle-input-method nil)
;(provide 'eim-extension)

;; set c program style
(add-hook 'c-mode-hook 'linux-c-mode)
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode() 
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive) 
  (c-set-style "K&R") 
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  )

(global-set-key [f8] 'gdb)


;; shell mode
(setq shell-file-name "/bin/zsh") 
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t) 

;; org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-publish-project-alist
      '(("note-org"
         :base-directory "/home/catl/org/daily"
         :publishing-directory "/home/catl/org/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
    href=\"./style/emacs.css\"
    type=\"text/css\"/>")
        ("note-static"
         :base-directory "/home/catl/org/daily"
         :publishing-directory "/home/catl/org/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note"
         :components ("note-org" "note-static")
         :author "nesuadark@gmail.com"
         )))
