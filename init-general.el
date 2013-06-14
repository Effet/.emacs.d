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
 echo-keystrokes                0.1
 mouse-wheel-progressive-speed  nil
 )

(when window-system
  (setq frame-title-format
        '("Emacs :: "
          (:eval (if buffer-file-name
                     (abbreviate-file-name buffer-file-name)
                   (buffer-name)))))
  (tooltip-mode -1)
  )

(setq-default
 indent-tabs-mode nil
 tab-width 4
 fill-column 80
 require-final-newline t
 )


(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


;; (recentf-mode 1)
(delete-selection-mode t)
(global-subword-mode t)
(show-paren-mode t)


;;;; Modeline Settings
(column-number-mode t)
(size-indication-mode t) ;show file size


;;;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;;;; Ediff
(eval-after-load 'ediff
  '(progn
     (setq ediff-diff-options "-w")
     ;; (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))


;;;; C-x o rebind
(require-package 'switch-window)
(require 'switch-window)
;; (autoload 'switch-window "switch-window")
;; (global-set-key (kbd "C-x o") 'switch-window)

;;;; C-c <left>, c-c <right>
(winner-mode t)


;;;; useful shortcuts C-x r j <reg_name>
(set-register ?h '(file . "~/"))
(set-register ?e '(file . "~/.emacs"))
(set-register ?d '(file . "~/.emacs.d"))
(set-register ?p '(file . "~/Projects"))
(set-register ?o '(file . "~/Projects/org"))
(set-register ?s '(file . "~/Dropbox/study_recipe.org"))

;; (midnight-delay-set 'midnight-delay "4:30am")


;;;; Indent after yank
;; http://www.emacswiki.org/emacs/AutoIndentation
(dolist (command '(yank yank-pop))
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



(with-package* undo-tree
  (global-undo-tree-mode))


(with-package* volatile-highlights
  (volatile-highlights-mode t))


(with-package* diminish
  (with-package undo-tree (diminish 'undo-tree-mode))
  (with-package autopair (diminish 'autopair-mode))
  (with-package volatile-highlights (diminish 'volatile-highlights-mode)))


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


;;;; Popwin (C-g to hide temp buffer)
(with-package* popwin
  (setq display-buffer-function 'popwin:display-buffer)

  ;; Conflict between `popwin' and `Icicles', because of `completion-list-mode'.
  (setq popwin:special-display-config
        '(help-mode
          (compilation-mode :noselect t)
          "*Apropos*"
          "*Shell Command Output*" "*Async Shell Command*"
          "*Compile-Log*" "*TeX Help*"
          (" *undo-tree*" :position bottom)))
  )



;;;; Deft
(with-package deft-autoloads
  (setq deft-directory "~/Dropbox/notes"
        deft-extension "org"
        deft-text-mode 'org-mode
        deft-use-filename-as-title t)
  (global-set-key [f8] 'deft))


(provide 'init-general)
