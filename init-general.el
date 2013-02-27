(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
;; (scroll-bar-mode -1)


;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)


(setq
 inhibit-startup-screen         t
 make-backup-files              nil
 delete-by-moving-to-trash      t
 ;; auto-save-list-file-prefix     nil
 track-eol                      t
 scroll-margin                  0
 echo-keystrokes                0.1
 kill-whole-line                t
 ring-bell-function             'ignore
 mouse-wheel-progressive-speed  nil
 ediff-window-setup-function    'ediff-setup-windows-plain
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


;; (recentf-mode 1)
(delete-selection-mode t)
(global-subword-mode t)
(show-paren-mode t)


(setq linum-format "%4d ")
;; (global-linum-mode t)
;; (global-hl-line-mode t)


;; Modeline Settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t) ;show file size


(require 'windmove)
(windmove-default-keybindings 'ctrl)

;; C-c <left>, c-c <right>
(winner-mode t)


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


(provide 'init-general)
