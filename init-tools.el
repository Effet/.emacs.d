;;; Efficient Tools

(ido-mode t)
(ido-ubiquitous-mode t)

(autopair-global-mode)
(global-undo-tree-mode)

(require 'browse-kill-ring)


(require 'fold-dwim)

;; rebind C-x o
(require 'switch-window)

(midnight-delay-set 'midnight-delay "4:30am")


;; (require 'volatile-highlights)
(autoload 'vhl/define-extension "volatile-highlights" t)
;; (autoload 'vhl/install-extension "volatile-highlights" t)
(vhl/define-extension 'undo-tree 'undo-tree-undo 'undo-tree-redo)
(vhl/install-extension 'undo-tree)
(vhl/define-extension 'helm-yank 'helm-c-kill-ring-action)
(vhl/install-extension 'helm-yank)
(volatile-highlights-mode t)

;; (require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'volatile-highlights-mode)
(diminish 'autopair-mode)


;; https://bitbucket.org/pitkali/emacs-config/src/28ed0d4b4654f696969f23c0bb1084275852026a/init.el?at=default#cl-209
(defun auto-fci-mode (&optional unused)
  "Attempts to automatically enable fci mode for text and file
buffers, but only if window width is larger than
fci-fill-column."
  (if (or (equalp 'major-mode 'text-mode)
          (buffer-file-name))
      (let ((rule-column (or fci-rule-column fill-column)))
        (fci-mode (if (> (window-width) rule-column) 1 0)))
    (fci-mode 0)))

(add-hook 'after-change-major-mode-hook #'auto-fci-mode)
(add-hook 'window-configuration-change-hook #'auto-fci-mode)



;; (require 'quickrun)

;;; Popwin (C-g to hide temp buffer)
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(dolist (buffer '(("*Apropos*")
                  ("*quickrun*")
                  ("*Backtrace*")
                  ("*Compile-Log*")
                  ("*TeX Help*")
                  ("*Async Shell Command*")
                  ("*quickrun*")
                  ;; ("*Buffer List*")
                  ))
  (push buffer popwin:special-display-config))



;;  make-{header,revision,divider,box-comment}
(setq header-copyright-notice
      (concat "Copyright (C) 2012 "
              user-full-name
              " <" user-mail-address ">\n"))

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
      '(header-file-name
        my-header-blank
        header-author
        my-header-email
        my-header-blank
        header-creation-date
        header-modification-date
        my-header-blank
        my-header-divider
        header-eof))


;; (require 'tabbar)
;; (require 'tabbar-ruler)
;; (tabbar-mode 1)
;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 'nil) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 'nil) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 'nil) ; If you want a popup toolbar


(provide 'init-tools)
