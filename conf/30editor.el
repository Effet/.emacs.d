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


;; -> https://github.com/bbatsov/prelude/blob/master/core/prelude-editor.el#L329-#L365
;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes
  '(LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).
Only modes that don't derive from `prog-mode' should be listed here.")

(defvar yank-indent-blacklisted-modes
  '(python-mode slim-mode haml-mode)
  "Modes for which auto-indenting is suppressed.")

(defvar yank-advised-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur.")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) yank-advised-indent-threshold)
      (indent-region beg end nil)))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes,
indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (not (member major-mode yank-indent-blacklisted-modes))
           (or (derived-mode-p 'prog-mode)
               (member major-mode yank-indent-modes)))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes,
indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (not (member major-mode yank-indent-blacklisted-modes))
           (or (derived-mode-p 'prog-mode)
               (member major-mode yank-indent-modes)))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))
