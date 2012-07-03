;; some from https://github.com/thelmstedt/emacs.d/blob/master/init-packages.el

;; use elpa(offical) package manager (package-*)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; el-get package manager
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path (concat base-dir "/el-get/el-get"))
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
        ;; undo operates
        (:name undo-tree :type elpa)
        ;; highlight key work like eclipse
        (:name idle-highlight-mode :type elpa)

        (:name linum-relative
               :after (lambda()
                        (require 'linum-relative)
                        ;; (setq linum-relative-current-symbol "->")
                        )
               )

        (:name kill-ring-search
               :type http
               :url "http://nschum.de/src/emacs/kill-ring-search/kill-ring-search.el"
               :after (lambda ()
                        (autoload 'kill-ring-search "kill-ring-search"
                          "Search the kill ring in the minibuffer."
                          (interactive))
                        (global-set-key (kbd "C-M-y") 'kill-ring-search)))

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
                        ;; (autoload 'eim-use-package "eim"
                        ;;   "Another emacs input method")

                        ;; (setq eim-punc-translate-p nil)
                        (setq eim-use-tooltip nil)
                        (register-input-method
                         "eim-py" "euc-cn" 'eim-use-package
                         "拼音" "汉字拼音输入法" (concat base-dir "/py.txt"))
                        (set-input-method "eim-py")
                        ;; (activate-input-method t)
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

         ;; autocomplete
         auto-complete
         auto-complete-clang

         ;; ido
         smex

         ;; misc
         pos-tip
         rect-mark                      ;visual rect operate
         rainbow-delimiters             ;"rainbow parentheses"-like mode
         highlight-parentheses

         ;; color-themes
         color-theme
         color-theme-solarized

         ;; effective tools

         ;; git
         magit
         )
       (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)

(provide 'init-packages)
