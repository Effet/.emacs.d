(use-package smartparens
  :diminish smartparens-mode
  :init
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode t)

    (show-smartparens-global-mode t)

    ;; forward-sexp, backward-sexp
    (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
    (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

    ;; backward-up-list, down-list
    (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
    (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)

    ;; forward-list, backward-list
    (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
    (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

    ;; beginning-of-defun, end-of-defun
    (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
    (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)

    (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
    (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

    ;; kill-sexp
    (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)

    ;; append-next-kill
    (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

    ;; transpose-sexps
    (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

    (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
    (define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)

    (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
    (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

    (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
    (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

    ;; paredit
    (define-key sp-keymap (kbd "C-)") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (kbd "C-(") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "C-}") 'sp-forward-barf-sexp)
    (define-key sp-keymap (kbd "C-{") 'sp-backward-barf-sexp)

    (define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
    (define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)
    ))
