;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(setq
 inhibit-startup-screen         t
 make-backup-files              nil
 delete-by-moving-to-trash      t
 ;; auto-save-list-file-prefix     nil
 track-eol                      t
 scroll-margin                  0
 echo-keystrokes                0.1
 ;; kill-whole-line                t
 ring-bell-function             'ignore
 mouse-wheel-progressive-speed  nil
 frame-title-format             '(buffer-file-name "%f" ("%b"))
 uniquify-buffer-name-style     'forward
 uniquify-separator             "/"
 uniquify-ignore-buffers-re     "^\\*"
 )

(setq-default
 major-mode                     'text-mode
 fill-column                    80
 indent-tabs-mode               nil
 tab-width                      4
 indicate-empty-lines           t
 indicate-buffer-boundaries     'left
 require-final-newline          t
 )


(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)


;; (recentf-mode 1)
(delete-selection-mode t)
(global-subword-mode t)
(show-paren-mode t)


;; Modeline Settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t) ;show file size


;; Ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


(require 'switch-window)
(require 'windmove)
(windmove-default-keybindings)

;; C-c <left>, c-c <right>
(winner-mode t)


;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/dotEmacs"))
(set-register ?p '(file . "~/Projects"))


(autopair-global-mode)
(setq autopair-blink nil)

(global-undo-tree-mode)

(require 'browse-kill-ring)
(require 'fold-dwim)

;; (midnight-delay-set 'midnight-delay "4:30am")


(require 'volatile-highlights)
(volatile-highlights-mode t)


;; (require 'diminish)
(dolist (mode '(undo-tree-mode
                volatile-highlights-mode
                autopair-mode))
  (when (fboundp mode)
    (diminish mode)))


;; ;; https://bitbucket.org/pitkali/emacs-config/src/28ed0d4b4654f696969f23c0bb1084275852026a/init.el?at=default#cl-209
;; (defun auto-fci-mode (&optional unused)
;;   "Attempts to automatically enable fci mode for text and file
;; buffers, but only if window width is larger than
;; fci-fill-column."
;;   (if (or (equalp 'major-mode 'text-mode)
;;           (buffer-file-name))
;;       (let ((rule-column (or fci-rule-column fill-column)))
;;         (fci-mode (if (> (window-width) rule-column) 1 0)))
;;     (fci-mode 0)))

;; (add-hook 'after-change-major-mode-hook #'auto-fci-mode)
;; (add-hook 'window-configuration-change-hook #'auto-fci-mode)


;;; Popwin (C-g to hide temp buffer)
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; (dolist (buffer '(("*Apropos*")
;;                   ("*quickrun*")
;;                   ("*Backtrace*")
;;                   ("*Compile-Log*")
;;                   ("*TeX Help*")
;;                   ("*Async Shell Command*")
;;                   ;; ("*quickrun*")
;;                   ;; ("*Buffer List*")
;;                   ))
;;   (push buffer popwin:special-display-config))


(require 'quickrun)


(provide 'init-general)
