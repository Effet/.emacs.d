;;; Efficient Tools

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(require 'iy-go-to-char)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)


(require 'undo-tree)
(global-undo-tree-mode)
;; http://ergoemacs.org/emacs/emacs_best_redo_mode.html
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)


(require 'expand-region)
(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-M-'") 'er/contract-region)


(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; rebind C-x o
(require 'switch-window)


;; ``Time-stamp: <>'' in first 8 lines
(add-hook 'write-file-hooks 'time-stamp)
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format


;;; ---- Header2 (file information) ----
;;  make-{header,revision,divider,box-comment}

(setq
 header-copyright-notice (concat "Copyright (C) 2012 "
                                 user-full-name
                                 " <" user-mail-address ">\n")
 )

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
      '(;; header-mode-line
        ;; header-title
        ;; (lambda ()
        ;;   (insert "hello World"))
        header-file-name
        my-header-blank
        header-author
        my-header-email
        my-header-blank
        ;; header-copyright
        header-creation-date
        header-modification-date
        my-header-blank
        my-header-divider
        ;; header-free-software
        ;; header-code
        header-eof))


;;; Folding

(require 'fold-dwim)
(global-set-key (kbd "C-c =") 'fold-dwim-toggle)
(global-set-key (kbd "C-c -") 'fold-dwim-hide-all)
(global-set-key (kbd "C-c +") 'fold-dwim-show-all)

;; (global-set-key (kbd "C-#") 'hs-toggle-hiding)

(dolist (hook '(emacs-lisp-mode-hook
                c-mode-common-hook
                python-mode))
  (add-hook hook
            '(lambda ()
               (hs-minor-mode 1)
               (hideshowvis-enable)
               (hs-hide-all))))

(hideshowvis-symbols)


;;; ---- Volatile Highlights (visual feedback to some operations) ----

;; M-x package-install RET volatile-highlights
(require 'volatile-highlights)
(vhl/define-extension 'undo-tree 'undo-tree-undo 'undo-tree-redo)
(vhl/install-extension 'undo-tree)
;; (vhl/define-extension 'copy 'kill-ring-save)
;; (vhl/install-extension 'copy)
(vhl/define-extension 'helm-yank 'helm-c-kill-ring-action)
(vhl/install-extension 'helm-yank)

(volatile-highlights-mode t)


(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'volatile-highlights-mode)


;; `ido' (C-x C-f/C-x b)
(require 'ido)
(ido-mode t)
;; (global-set-key (kbd "C-x C-d") 'ido-dired)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; Popwin (C-g to hide temp buffer)
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;       (append '(("*Apropos*") ("*sdic*") ("*Faces*") ("*Colors*"))
;;               popwin:special-display-config))
(push '("*quickrun*") popwin:special-display-config)
(push '("*Backtrace*") popwin:special-display-config)
(push '("*Compile-Log*") popwin:special-display-config)
(push '("*TeX Help*") popwin:special-display-config)
(push '("*Async Shell Command*") popwin:special-display-config)
;; (push '("*Buffer List*") popwin:special-display-config)


;; (setq helm-M-x-always-save-history t)
(global-set-key (kbd "C-c h") 'helm-mini)


(midnight-delay-set 'midnight-delay "4:30am")
