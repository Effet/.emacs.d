(global-set-key [remap list-buffers] 'ibuffer)

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
  :ensure ibuffer-vc
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
