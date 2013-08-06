;;; extras.el --- extras emacs configuration


;;;; Dired/Dired+
;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)
;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")
(setq dired-dwim-target t)

(require 'dired-x)

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(eval-after-load 'wdired
  '(define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))


;;;; Ediff
(eval-after-load 'ediff
  '(progn
     (setq ediff-diff-options "-w")
     ;; (setq ediff-split-window-function 'split-window-horizontally)
     (setq ediff-window-setup-function 'ediff-setup-windows-plain)))


;; (midnight-delay-set 'midnight-delay "4:30am")


;;;; Org-mode
;; (setq org-replace-disputed-keys t)
(setq org-startup-indented t)
(setq org-startup-folded 'content)
(setq org-src-fontify-natively t)


;;;; Ido
(require 'ido)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode t))


(global-set-key [remap list-buffers] 'ibuffer)
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (define-key ibuffer-mode-map [remap ibuffer-find-file]
              'ibuffer-ido-find-file)))

(use-package ibuffer-vc
  :ensure ibuffer-vc
  :commands (ibuffer-vc-set-filter-groups-by-vc-root
             ibuffer-do-sort-by-alphabetic)
  :config
  (progn
    (add-hook 'ibuffer-hook
              (lambda ()
                (ibuffer-vc-set-filter-groups-by-vc-root)
                (unless (eq ibuffer-sorting-mode 'alphabetic)
                  (ibuffer-do-sort-by-alphabetic)))))
  )


(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))


;; Quit: C-c C-q, Copy: C-c C-w, ToggleCase: C-c C-c
(require 're-builder)
(setq reb-re-syntax 'string)


;;;; ace-jump-mode
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))


;;;; volatile-highlights
(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))


(use-package projectile
  :disabled t
  :init (projectile-global-mode))


;;;; helm
(use-package helm
  :bind ("C-c h" . helm-mini)
  :init
  (progn
    ;; (helm-mode t)
    ;; (setq helm-idle-delay 0.1)
    ;; (setq helm-input-idle-delay 0.1)
    ;; (setq helm-split-window-in-side-p t)

    ;; (setq helm-M-x-always-save-history t)
    ;; (setq helm-command-prefix-key "M-s")
    (require 'helm-config)
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


;;;; flycheck
;; (after 'flycheck-autoloads
;;   (add-hook 'after-init-hook #'global-flycheck-mode))


;;;; smartparens
(use-package smartparens
  :diminish smartparens-mode
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


;;;; ack-and-a-half
(use-package ack-and-a-half
  :commands (ack-and-a-half
             ack-and-a-half-same
             ack-and-a-half-find-file
             ack-and-a-half-file-file-same)
  :init
  (progn
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))


;;;; guide-key
(use-package guide-key
  :diminish guide-key-mode
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x c" "C-x RET"))
    (guide-key-mode 1)
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)))


;;;; Eshell
(use-package eshell
  :bind ("C-x m" . eshell)
  :init
  (progn
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
  :config
  (progn
    (add-hook 'eshell-mode-hook
              (lambda ()
                (define-key eshell-mode-map (kbd "C-a") 'eshell-maybe-bol)
                (define-key eshell-mode-map (kbd "<return>") 'user-ret)
                (setq scroll-margin 0)
                (setq outline-regexp "^[^#$\n]* [#$] ")
                (outline-minor-mode t)))
    
    (use-package pcmpl-args)
    (use-package pcmpl-git)
    )
  )


;;;; term-mode
(add-hook 'term-mode-hook (lambda() (yas-minor-mode -1)))

(use-package multi-term
  :bind (("C-c m" . multi-term-next)
         ("C-c M" . multi-term))
  :init (setq multi-term-program "/bin/zsh")
  )


;;;; move-text M-S-up, M-S-dowm
(use-package move-text
  :init
  (progn
    (global-set-key [M-S-up] 'move-text-up)
    (global-set-key [M-S-down] 'move-text-down)))


;;;; C-x o rebind
(use-package switch-window
  ;; (global-set-key (kbd "C-x o") 'switch-window)
  )


;;;; Chinese input
(use-package eim
  :commands eim-use-package
  :init
  (progn
    (setq eim-use-tooltip nil)
    (register-input-method
     "eim-py" "Chinese-GB" 'eim-use-package
     "拼音" "汉字拼音输入法" "py.txt")
    ))


(provide 'extras)


;;; extras.el ends here
