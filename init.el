;;; init.el --- Emacs configuration file


(add-to-list 'load-path user-emacs-directory)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))


;;;; Package Stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;;; Functions (load all files in utils-dir)
(setq utils-dir (expand-file-name "utils" user-emacs-directory))
(dolist (file (directory-files utils-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


;; https://github.com/milkypostman/dotemacs/blob/master/init.el#L869
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)



;;;; UTF-8 Stuff
(require 'locales)


;;;; Loading Appearance Stuff
(require 'ui)


;;;; Settings For Editing Stuff

;; Narrow (C-x n n, C-x n p, C-x n d)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(setq
 make-backup-files              nil
 delete-by-moving-to-trash      t
 ;; auto-save-list-file-prefix     nil
 line-move-visual               nil
 track-eol                      t
 ;; kill-whole-line                t
 echo-keystrokes                0.1
 mouse-wheel-progressive-speed  nil
 )

(setq-default
 indent-tabs-mode nil
 tab-width 4
 fill-column 80
 require-final-newline t
 )

(set-default 'imenu-auto-rescan t)


(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


;; (recentf-mode 1)
(delete-selection-mode t)
(global-subword-mode t)
;; (show-paren-mode t)


;;;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;;;; saner regex syntax
;; Quit: C-c C-q, Copy C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)


;;;; Indent after yank
(unless (require 'yank-indent nil t)
  (warn "`yank-indent.el' is not found."))


;;;; Dired/Dired+
(eval-after-load "dired"
  '(progn
     ;; `dired' in single buffer by type `a'
     (put 'dired-find-alternate-file 'disabled nil)
     ;; (setq dired-listing-switches "-AlXh --group-directories-first")
     (setq dired-listing-switches "-Alh")
     (setq dired-dwim-target t)

     ;; (with-package* dired+)
     (unless (require 'dired+ nil t)
       (warn "`dired+' is not installed."))))


;;;; Ediff
(eval-after-load "ediff"
  '(progn
     (setq ediff-diff-options "-w")
     ;; (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))


;; (midnight-delay-set 'midnight-delay "4:30am")


;;;; Session
(with-package* session
  (add-hook 'after-init-hook 'session-initialize)
  ;; C-x C-/, C-x <undo>
  ;; http://www.emacswiki.org/emacs/EmacsSession
  ;; expanded folded secitons as required
  (defun le::maybe-reveal ()
    (when (and (or (memq major-mode  '(org-mode outline-mode))
                   (and (boundp 'outline-minor-mode)
                        outline-minor-mode))
               (outline-invisible-p))
      (if (eq major-mode 'org-mode)
          (org-reveal)
        (show-subtree))))

  (add-hook 'session-after-jump-to-last-change-hook
            'le::maybe-reveal)
  )


;;;; Eshell
(add-hook 'eshell-mode-hook 'my-eshell-settings)

(defun my-eshell-settings ()
  (setq scroll-margin 0)
  (setq outline-regexp "^[^#$\n]* [#$] ")
  (outline-minor-mode t)

  (setq eshell-history-size 512)
  (setq eshell-prompt-regexp "^[^#$\n]* [#$] ")

  (setq eshell-cp-interactive-query t
        eshell-ln-interactive-query t
        eshell-mv-interactive-query t
        eshell-rm-interactive-query t)

  (setq eshell-cmpl-ignore-case t
        eshell-cmpl-cycle-completions nil)

  (setq eshell-prompt-function
        (lambda ()
          (concat
           (short-pwd
            (split-string (abbreviate-file-name (eshell/pwd)) "/"))
           (if (= (user-uid) 0) " # " " $ "))))
  )


;;;; Org-mode
(eval-after-load "org"
  '(progn
     (setq org-replace-disputed-keys t)
     (setq org-src-fontify-natively t)))


;; (add-to-list 'iimage-mode-image-regex-alist
;;              (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
;;                            "\\)\\]")  1))

;; (defun org-toggle-iimage-in-org ()
;;   "display images in your org file"
;;   (interactive)
;;   (if (face-underline-p 'org-link)
;;       (set-face-underline-p 'org-link nil)
;;       (set-face-underline-p 'org-link t))
;;   (iimage-mode))


;; (defun my-org-settings ()
;;   (local-set-key "\M-I" 'org-toggle-iimage-in-org))

;; (add-hook 'org-mode-hook
;;           my-org-settings)


;;;; ack-and-a-half
(eval-after-load "ack-and-a-half-autoloads"
  '(progn
     (require 'ack-and-a-half)
     (defalias 'ack 'ack-and-a-half)
     (defalias 'ack-same 'ack-and-a-half-same)
     (defalias 'ack-find-file 'ack-and-a-half-find-file)
     (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))


;;;; undo-tree
(eval-after-load "undo-tree-autoloads"
  '(progn
     (if (require 'undo-tree nil t)
         (global-undo-tree-mode)
       (warn "`undo-tree' is not installed."))))


;;;; volatile-highlights
(with-package* volatile-highlights
  (volatile-highlights-mode t))


;;;; diminish
(with-package* diminish
  (with-package undo-tree (diminish 'undo-tree-mode))
  (with-package autopair (diminish 'autopair-mode))
  (with-package volatile-highlights (diminish 'volatile-highlights-mode)))


;;;; Deft
(eval-after-load "deft-autoloads"
  '(progn
     (setq deft-directory "~/Dropbox/notes")
     (setq deft-extension "org")
     (setq deft-text-mode 'org-mode)
     (setq deft-use-filename-as-title t)))


;;;; flycheck

(eval-after-load "flycheck-autoloads"
  '(progn
     (if (require 'flycheck nil t)
         (add-hook 'after-init-hook #'global-flycheck-mode)
       (warn "`flycheck' is not installed."))))


;;;; smartparens
(eval-after-load "smartparens-autoloads"
  '(progn
     (require 'smartparens-config)
     (smartparens-global-mode t)

     (show-smartparens-global-mode t)

     (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
     (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

     (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
     (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

     (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)

     (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
     (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
     (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)))



;;;; Ido
;; sea more -> http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(eval-after-load "ido"
  '(progn
     (setq ido-everywhere t
           ido-enable-flex-matching t
           ido-create-new-buffer 'always
           ido-use-filename-at-point 'guess
           ido-use-virtual-buffers t)

     (ido-mode t)

     (if (require 'ido-ubiquitous nil t)
         (ido-ubiquitous-mode t)
       (warn "`ido-ubiquitous' is not installed."))

     ;; (with-package* ido-vertical-mode
     ;;   (ido-vertical-mode t))

     (eval-after-load "flx-autoloads"
       '(progn
          ;; (require 'flx-ido)
          ;; (setq ido-use-faces nil)
          (flx-ido-mode t))
       )
     )
  )


(global-set-key [remap list-buffers] 'ibuffer)


;;;; smex
(eval-after-load "smex-autoloads"
  '(progn
     (smex-initialize)
     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)))


;;;; extension of my config
(require 'init-ext)


;;;; Coding Stuff
(require 'coding)


;;;; Loading Keybindings
(require 'keybindings)


;;;; Some used plugins
(require 'init-plugins)


;;; init.el ends here
