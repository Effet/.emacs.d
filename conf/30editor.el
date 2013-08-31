;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; C-x f to set local value
(setq-default fill-column 78)

(setq-default require-final-newline t)

(delete-selection-mode t)
(global-subword-mode t)

;; narrow (C-x n n, C-x n p, C-x n d)
;;  (C-x n w) -> widen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; C-x C-u, C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(setq recentf-save-file "~/.emacs.d/.recentf")
(recentf-mode 1)

;; undo/redo
(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))


(use-package magit
  :bind ("C-x g" . magit-status))


;; `dired' in single buffer by type `a'
(put 'dired-find-alternate-file 'disabled nil)
;; (setq dired-listing-switches "-AlXh --group-directories-first")
(setq dired-listing-switches "-Alh")
(setq dired-dwim-target t)

(require 'dired-x)

(use-package dired-details
  :init
  (progn
    (setq dired-details-hidden-string "")
    (dired-details-install)))

;; dired C-a
(defun dired-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (move-beginning-of-line nil)
    (if (= p (point))
        (dired-move-to-filename))))

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "C-a") 'dired-maybe-bol))
(eval-after-load 'wdired
  '(define-key wdired-mode-map (kbd "C-a") 'dired-maybe-bol))


(require 'ido)

(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el"
                                  ".ini" ".cfg" ".conf"))

(use-package ido-sort-mtime
  :init (ido-sort-mtime-mode 1))

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode t))

(use-package ido-at-point
  :init (ido-at-point-mode))


(use-package smex
  :disabled t
  :init
  (progn
    (setq smex-save-file "~/.emacs.d/.smex-items")
    (smex-initialize))
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))


;; -> http://www.emacswiki.org/emacs/InteractivelyDoThings#toc17
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (ido-find-file-in-dir default-directory))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (define-key ibuffer-mode-map [remap ibuffer-find-file]
              'ibuffer-ido-find-file)))

(use-package ibuffer-vc
  :commands (ibuffer-vc-set-filter-groups-by-vc-root
             ibuffer-do-sort-by-alphabetic)
  :init
  (progn
    (add-hook 'ibuffer-hook
              (lambda ()
                (ibuffer-vc-set-filter-groups-by-vc-root)
                (unless (eq ibuffer-sorting-mode 'alphabetic)
                  (ibuffer-do-sort-by-alphabetic)))))
  )


(use-package auto-complete
  :disabled t
  :init
  (progn
    (require 'auto-complete-config)
    (ac-config-default)
    ;; (setq ac-dwim nil)
    ;; (setq ac-auto-show-menu 0.3)
    (setq ac-auto-show-menu t)

    (setq ac-use-menu-map t)
    ;; (define-key ac-menu-map (kbd "C-n") 'ac-next)
    ;; (define-key ac-menu-map (kbd "C-p") 'ac-previous)

    (setq popup-isearch-cursor-color (face-foreground 'warning)) ;... is there a better way?
    ))


(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.3)

