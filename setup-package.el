(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;; for the first run.
(unless package-archive-contents
  (package-refresh-contents))


(defvar my-packages
  '(
    ace-jump-mode
    ack-and-a-half
    auto-complete
    dired-details
    expand-region
    geiser
    guide-key
    helm
    ibuffer-vc
    ido-at-point
    ido-sort-mtime
    ido-ubiquitous
    jedi
    key-chord
    keyfreq
    magit
    mmm-mode
    move-text
    multi-term
    multiple-cursors
    pcmpl-args
    pcmpl-git
    popwin
    projectile
    smartparens
    smex
    switch-window
    undo-tree
    use-package
    web-mode
    yasnippet
    )
  )

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)


;;; On-demand installation of packages
;; -> https://github.com/purcell/emacs.d/blob/master/init-elpa.el#L61-L73
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;; http://milkbox.net/note/single-file-master-emacs-configuration/
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))


;; -> http://stackoverflow.com/a/14838150
(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `my-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x my-packages))
                                   (not (package-built-in-p x))
                                   (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))


;; `use-package' to maintain packages
(require 'use-package)

(provide 'setup-package)
