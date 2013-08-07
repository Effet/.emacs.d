(require 'ido)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; (setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el"
                                  ".ini" ".cfg" ".conf"))

(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
  (setq ido-temp-list
        (sort ido-temp-list
              (lambda (a b)
                (time-less-p
                 (sixth (file-attributes (concat ido-current-directory b)))
                 (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
              (lambda (x) (and (char-equal (string-to-char x) ?.) x))
              ido-temp-list))))

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

(defun ido-choose-from-recentf ()
  "Use ido to select a recently visited file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))

  ;;; bind it to "C-c f"
(global-set-key (kbd "C-c f") 'ido-choose-from-recentf)

;; (use-package smex
;;   :init (smex-initialize)
;;   :bind (("M-x" . smex)
;;          ("M-X" . smex-major-mode-commands)))

(global-set-key [(meta x)]
                (lambda ()
                  (interactive)
                  (or (boundp 'smex-cache)
                      (smex-initialize))
                  (global-set-key [(meta x)] 'smex) (smex)))

(global-set-key [(shift meta x)]
                (lambda () (interactive)
                  (or (boundp 'smex-cache) (smex-initialize))
                  (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                  (smex-major-mode-commands)))

(provide 'setup-ido)
