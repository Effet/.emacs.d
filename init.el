(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "plugins/"))

(setq custom-file (concat user-emacs-directory "custom.el"))


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; https://github.com/technomancy/emacs-starter-kit
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    ace-jump-mode
    auctex
    autopair
    browse-kill-ring
    change-inner
    diminish
    expand-region
    fill-column-indicator
    google-c-style
    header2
    helm
    smart-forward
    hideshowvis
    ido-ubiquitous
    iy-go-to-char
    lua-mode
    markdown-mode
    multi-term
    multiple-cursors
    org
    popwin
    quickrun
    rainbow-mode
    smex
    solarized-theme
    switch-window
    undo-tree
    volatile-highlights
    yasnippet
    zenburn-theme
    zencoding-mode
    )
  )

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(require 'init-general)
(require 'init-general-2)
(require 'init-tools)
(require 'init-prog)
(require 'init-yas)
;; (require 'init-ac)

(eval-after-load 'org '(require 'init-org))
(eval-after-load 'auctex '(require 'init-auctex))
(eval-after-load 'eshell '(require 'init-eshell))

(require 'init-shortcut)
(require 'init-gui)

;; (when (file-exists-p user-lisp-directory)
;;   (mapc 'load (directory-files user-lisp-directory nil "^[^#].*\\.el$")))
