;; some from https://github.com/thelmstedt/emacs.d/blob/master/init-packages.el


;; Use `elpa'(offical) package manager.
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; el-get package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
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
        ;; highlight key work like `eclipse'
        (:name idle-highlight-mode :type elpa)
        
        ;;`rainbow-parentheses'-like mode
        (:name rainbow-delimiters :type git
               :url "https://github.com/jlr/rainbow-delimiters.git")

        ;; use the lastest version
        (:name minimap :type git
               :url "https://github.com/dustinlacewell/emacs-minimap.git")

        ;; use the lastest version
        (:name yasnippet :type git
               :url "https://github.com/capitaomorte/yasnippet.git")

        (:name autopair :type git
               :url "https://github.com/capitaomorte/autopair.git")
        
        (:name cursor-chg
               :after (lambda ()
                        (require 'cursor-chg)  ; Load the library
                        (toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
                        (change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

                        (setq curchg-default-cursor-color "wheat2")
                        
                        ;; Change cursor color according to mode
                        (defvar hcz-set-cursor-color-color "")
                        (defvar hcz-set-cursor-color-buffer "")
                        (defun hcz-set-cursor-color-according-to-mode ()
                          "change cursor color according to some minor modes."
                          ;; set-cursor-color is somewhat costly, so we only call it when needed:
                          (let ((color
                                 (if buffer-read-only "white"
                                   (if overwrite-mode "lightpink2"
                                     "wheat2"))))
                            (unless (and
                                     (string= color hcz-set-cursor-color-color)
                                     (string= (buffer-name) hcz-set-cursor-color-buffer))
                              (set-cursor-color (setq hcz-set-cursor-color-color color))
                              (setq hcz-set-cursor-color-buffer (buffer-name)))))
                        (add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)
                        ))

        ;; input-method [eim] (C-\)
        (:name eim
               :type git
               :url "https://github.com/viogus/eim.git"
               :after (lambda ()
                        (require 'eim-extra)
                        (autoload 'eim-use-package "eim"
                          "Another emacs input method")

                        (setq eim-punc-translate-p nil)
                        (setq eim-use-tooltip t)
                        (register-input-method
                         "eim-py" "euc-cn" 'eim-use-package
                         "拼音" "汉字拼音输入法" (concat base-dir "/py.txt"))
                        (set-input-method "eim-py")
                        ;; (activate-input-method t)
                        (activate-input-method "eim-py")
                        (toggle-input-method nil)))
        )
      )


(setq my-packages
      (append
       '(
         ;; sync el-get itself
         el-get

         ;; modes
         lua-mode
         markdown-mode
         graphviz-dot-mode              ;`C-cc' compile, `C-cp' show pictrue.

         ;; ido
         smex

         ;; misc
         pos-tip
         popup-kill-ring
         ;; browse-kill-ring
         ;; sunrise-commander              ;`midnight-commander'-like files manager

         rect-mark
         highlight-parentheses


         ;; color-themes
         color-theme
         color-theme-solarized
         
         ;; eye-candy
         ;; powerline
         ;; pretty-mode

         ;; auto-complete
         ;; and use a modified `auto-complete-config.el', from
         ;; `https://github.com/tkf/auto-complete/commit/337caa2ccc254a79f615bb2417f0d2fb9552b547'
         ;; look here `http://blog.binchen.org/?p=357',
         auto-complete
         auto-complete-clang
         ;; auto-complete-yasnippet

         ;; effective tools
         undo-tree
         linum-relative
         ace-jump-mode
         ;; minimap  ;Use `git' version
         autopair

         ;; git
         magit

         ;; TeX
         auctex

         ;; test to use
         ;; tabbar
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
;; (el-get 'wait my-packages)


(provide 'pkg-sync)
