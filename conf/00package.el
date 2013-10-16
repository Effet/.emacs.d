(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Some package like `geiser' only in this archive
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


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


(package-initialize)

;; for the first run.
(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages
  '(
    ace-jump-mode
    ack-and-a-half
    android-mode
    anzu
    auctex
    auto-complete
    company
    dictionary
    dired-details
    dropdown-list
    emacs-eclim
    expand-region
    fill-column-indicator
    flycheck
    geiser
    guide-key
    helm
    ibuffer-vc
    ido-at-point
    ido-sort-mtime
    ido-ubiquitous
    javadoc-lookup
    jedi
    js2-mode
    js2-refactor
    key-chord
    keyfreq
    magit
    mmm-mode
    move-text
    multi-term
    multiple-cursors
    page-break-lines
    pcmpl-args
    pcmpl-git
    popwin
    projectile
    rainbow-mode
    region-bindings-mode
    smartparens
    smex
    solarized-theme
    switch-window
    undo-tree
    use-package
    visual-regexp
    volatile-highlights
    web-mode
    yasnippet
    zenburn-theme
    zoom-frm
    )
  )

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)


;; `use-package' to maintain some package
(require 'use-package)
