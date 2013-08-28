(require 'ido)

(ido-mode t)
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

(defun ido-choose-from-recentf ()
  "Use ido to select a recently visited file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))

  ;;; bind it to "C-c f"
(global-set-key (kbd "C-c f") 'ido-choose-from-recentf)

(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

(provide 'setup-ido)
