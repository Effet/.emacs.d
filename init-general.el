;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(setq
 inhibit-startup-screen         t
 make-backup-files              nil
 delete-by-moving-to-trash      t
 ;; auto-save-list-file-prefix     nil
 line-move-visual               nil
 track-eol                      t
 ;; kill-whole-line                t
 mouse-wheel-progressive-speed  nil
 frame-title-format             '(buffer-file-name "%f" ("%b"))
 )

(setq-default
 indent-tabs-mode               nil
 tab-width                      4
 fill-column                    80
 require-final-newline          t
 )


;; (global-auto-revert-mode)
;; (setq global-auto-revert-non-file-buffers t
;;       auto-revert-verbose nil)


;; (recentf-mode 1)
(delete-selection-mode t)
(global-subword-mode t)
(show-paren-mode t)


;; Modeline Settings
(column-number-mode t)
(size-indication-mode t) ;show file size


;; Ediff
(eval-after-load 'ediff
  '(progn
     (setq ediff-diff-options "-w")
     ;; (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))


(autoload 'switch-window "switch-window")
(global-set-key (kbd "C-x o") 'switch-window)
;; (require 'switch-window)

;; C-c <left>, c-c <right>
(winner-mode t)


;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/dotEmacs"))
(set-register ?p '(file . "~/Projects"))
(set-register ?o '(file . "~/Projects/org"))


(autopair-global-mode)
(setq autopair-blink nil)

(global-undo-tree-mode)

;; (midnight-delay-set 'midnight-delay "4:30am")


(require 'volatile-highlights)
(volatile-highlights-mode t)


;; (require 'diminish)
(eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
(eval-after-load 'autopair '(diminish 'autopair-mode))
(eval-after-load 'volatile-highlights '(diminish 'volatile-highlights-mode))


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
;; (require 'popwin)
(autoload 'popwin:special-display-config "popwin")
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


;; (require 'quickrun)


(provide 'init-general)
