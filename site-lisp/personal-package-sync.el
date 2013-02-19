;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-package-sync.el --- Prepair packages.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:19:51 2012 (+0800)
;; Last-Updated: Thu Sep  6 14:37:36 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; Use `elpa'(offical) package manager.
(require 'package)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; See https://github.com/technomancy/emacs-starter-kit
(when (not package-archive-contents)
  (package-refresh-contents))


(defvar my-packages
  '(
    ace-jump-mode
    auctex
    autopair
    diminish
    expand-region
    fill-column-indicator
    header2
    helm
    hideshowvis
    ido-ubiquitous
    iy-go-to-char
    lua-mode
    markdown-mode
    multi-term
    multiple-cursors
    org
    popwin
    rainbow-mode
    smex
    solarized-theme
    switch-window
    undo-tree
    volatile-highlights
    yasnippet
    zencoding-mode
    ))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'personal-package-sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-package-sync.el ends here
