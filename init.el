;;; init.el --- Emacs configuration file


(add-to-list 'load-path user-emacs-directory)


;;;; Package Stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages
  '(ace-jump-mode
    ack-and-a-half
    auto-complete
    bind-key
    company
    deft
    expand-region
    flx
    flx-ido
    flycheck
    helm
    ibuffer-vc
    ido-ubiquitous
    jedi
    mmm-mode
    move-text
    multi-term
    multiple-cursors
    pcmpl-args
    pcmpl-git
    popup
    popwin
    projectile
    rainbow-mode
    smartparens
    smex
    sr-speedbar
    switch-window
    tabbar
    tabbar-ruler
    undo-tree
    use-package
    volatile-highlights
    yasnippet))

(defun install-my-packages ()
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        my-packages))

(condition-case nil
    (install-my-packages)
  (error
   (package-refresh-contents)
   (install-my-packages)))


;;;; ...
(require 'use-package)


;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L149-L153
;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


;; https://github.com/milkypostman/dotemacs/blob/master/init.el#L919-L924x
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
;;  (C-x n w) -> widen
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
 ;; track-eol                      t
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


(require 'autorevert)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


(delete-selection-mode t)
(global-subword-mode t)
;; (show-paren-mode t)


;;;; uniquify buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;;;; saner regex syntax
;; Quit: C-c C-q, Copy: C-c C-w, ToggleCase: C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)


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


;;;; Dired/Dired+
(require 'dired)
(require 'dired-x)

;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)
;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")
(setq dired-dwim-target t)


;; (with-package* dired+)


;;;; Ediff
(eval-after-load 'ediff
  '(progn
     (setq ediff-diff-options "-w")
     ;; (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))


;; (midnight-delay-set 'midnight-delay "4:30am")


;;;; recentf
(recentf-mode 1)
(global-set-key [(meta f12)] 'recentf-open-files)


(require 'saveplace)
(setq-default save-place t)

;;;; Session
;; (with-package* session
;;   (add-hook 'after-init-hook 'session-initialize)
;;   ;; C-x C-/, C-x <undo>
;;   ;; http://www.emacswiki.org/emacs/EmacsSession
;;   ;; expanded folded secitons as required
;;   (defun le::maybe-reveal ()
;;     (when (and (or (memq major-mode  '(org-mode outline-mode))
;;                    (and (boundp 'outline-minor-mode)
;;                         outline-minor-mode))
;;                (outline-invisible-p))
;;       (if (eq major-mode 'org-mode)
;;           (org-reveal)
;;         (show-subtree))))

;;   (add-hook 'session-after-jump-to-last-change-hook
;;             'le::maybe-reveal)
;;   )


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

  (require 'pcmpl-args)
  (require 'pcmpl-git)
  )


;;;; term-mode
(add-hook 'term-mode-hook (lambda() (yas-minor-mode -1)))

(use-package multi-term
  :bind (("C-c m" . multi-term-next)
         ("C-c M" . multi-term))
  :init (setq multi-term-program "/bin/zsh")
  )


;;;; Org-mode
(after 'org
  ;; (setq org-replace-disputed-keys t)
  (setq org-startup-indented t)
  (setq org-src-fontify-natively t))

(defun my-org-mode-key-settings ()
  ;; I bind it to `expand-region'
  (local-unset-key (kbd "C-'"))
  )
(add-hook 'org-mode-hook 'my-org-mode-key-settings)


;;;; ack-and-a-half
(use-package ack-and-a-half
  :init
  (progn
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))


;;;; undo-tree
(use-package undo-tree-autoloads
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))


;;;; volatile-highlights
(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))


;; ;;;; diminish
;; (use-package diminish)


;;;; Deft
(after 'deft-autoloads
  (global-set-key [f8] 'deft))

(after 'deft
  (setq deft-directory "~/Dropbox/notes")
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title t))


;;;; flycheck
;; (after 'flycheck-autoloads
;;   (add-hook 'after-init-hook #'global-flycheck-mode))


;;;; autopair
;; (with-package autopair-autoloads
;;   (setq autopair-blink nil)
;;   (autopair-global-mode))


;;;; smartparens
(use-package smartparens
  :init
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode t)

    (show-smartparens-global-mode t)

    (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
    (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

    (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
    (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
    (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
    (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

    (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
    (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
    (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

    (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
    (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

    (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)

    (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
    (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
    (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)))


;;;; Ido
(require 'ido)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode t))

;; (with-package* ido-vertical-mode
;;   (ido-vertical-mode t))

;; (with-package* flx-ido
;;   (setq ido-use-faces nil)
;;   (setq flx-ido-threshhold 3000)
;;   (flx-ido-mode t))


(global-set-key [remap list-buffers] 'ibuffer)

;; -> https://github.com/filsinger/emacs-config/blob/master/custom/ibuffer-ido-find-file.el#L4-L15
(defun ibuffer-ido-find-file (file &optional wildcards)
  "Like `find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (list (ido-read-file-name "Find file: " default-directory)
           t)))
  (find-file file wildcards))

(global-set-key [remap ibuffer-find-file] 'ibuffer-ido-find-file)

(after 'ibuffer-vc-autoloads
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  )


(use-package smex
  :init
  (progn
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)))


(use-package projectile
  :init (projectile-global-mode))


;;;; helm
(use-package helm
  :init
  (progn
    ;; (helm-mode t)
    ;; (setq helm-idle-delay 0.1)
    ;; (setq helm-input-idle-delay 0.1)
    ;; (setq helm-split-window-in-side-p t)

    ;; (setq helm-M-x-always-save-history t)
    (setq helm-command-prefix-key "M-s")
    (require 'helm-config)

    (define-key helm-command-map (kbd "i") 'helm-imenu)
    (define-key helm-command-map (kbd "h") 'helm-mini)
    (define-key helm-command-map (kbd "g") 'helm-do-grep)
    (define-key helm-command-map (kbd "o") 'helm-occur)
    (define-key helm-command-map (kbd "r") 'helm-register)
    (define-key helm-command-map (kbd "R") 'helm-regexp)
    (define-key helm-command-map (kbd "b") 'helm-c-pp-bookmarks)
    (define-key helm-command-map (kbd "p") 'helm-eproject-projects)
    (define-key helm-command-map (kbd "f") 'helm-eproject-files-in-project)
    (define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)
    ))


(use-package yasnippet
  :init
  (progn
    ;; https://github.com/redguardtoo/emacs.d/blob/master/init-yasnippet.el
    ;; default TAB key is occupied by auto-complete
    (global-set-key (kbd "C-c k") 'yas-expand)
    ;; default hotkey `C-c C-s` is still valid
    (global-set-key (kbd "C-c l") 'yas-insert-snippet)

    (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
    (setq yas-prompt-functions '(yas-ido-prompt))

    ;; When I typed `(global-set`, and press [tab] to use `competion-at-point` to
    ;; complete `global-set-key`, in default YASnippet setting, it will expand `set`
    ;; first if define a snippet `set`.
    ;;   Refer to -> http://ergoemacs.org/emacs/emacs_tip_yasnippet_expand_whole_hyphenated_word.html
    (setq yas-key-syntaxes '("w_" "w_." "w_.()" "^ "))

    (yas-global-mode 1)
    ))


;;;; Auto-Complete
(use-package auto-complete
  :init
  (progn
    (require 'auto-complete-config)
    (ac-config-default)
    ;; (setq ac-dwim nil)
    ;; (setq ac-auto-show-menu 0.3)
    (setq ac-auto-show-menu t)

    (setq ac-use-menu-map t)
    (define-key ac-menu-map (kbd "C-n") 'ac-next)
    (define-key ac-menu-map (kbd "C-p") 'ac-previous)

    (setq popup-isearch-cursor-color (face-foreground 'warning)) ;... is there a better way?
    ))



;;;; Popwin (C-g to hide temp buffer)
(use-package popwin
  :init
  (progn
    (setq display-buffer-function 'popwin:display-buffer)

    ;; Conflict between `popwin' and `Icicles', because of `completion-list-mode'.
    (setq popwin:special-display-config
          '(help-mode
            (compilation-mode :noselect t)
            "*Apropos*"
            "*Shell Command Output*" "*Async Shell Command*"
            "*Compile-Log*" "*TeX Help*"
            (" *undo-tree*" :position bottom)))
    ))


;;;; Coding Stuff
(require 'coding)


;;;; Loading Keybindings
(require 'keybindings)


;;;; Some used plugins
;; (require 'init-plugins)


(require 'test)


;;;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))


;;; init.el ends here
