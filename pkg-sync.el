;;; pkg-sync.el --- Prepair packages.
;; 
;; Author: n4k0master
;; Mail: nesuadark@gmail.com
;; 
;; Created: Thu Jul 19 20:59:58 2012 (+0800)
;; Last-Updated: Sat Jul 28 20:01:09 2012 (+0800)
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
    ;; language-modes
    lua-mode
    markdown-mode
    graphviz-dot-mode                   ;`C-cc' compile, `C-cp' show pictrue.

    ;; effective tools
    undo-tree
    ace-jump-mode
    autopair
    rect-mark
    highlight-parentheses
    highlight-symbol
    header2
    quickrun
    helm                                ;fork of `anything'

    ;; ;; misc
    pos-tip
    popwin
    ;; popup-kill-ring
    ;; browse-kill-ring
    ;; sunrise-commander              ;`midnight-commander'-like files manager

    rainbow-delimiters                  ;`rainbow-parentheses'-like mode
    rainbow-mode

    solarized-theme

    ;; eye-candy
    cursor-chg
    fill-column-indicator
    ;; powerline
    ;; pretty-mode

    ;; Completions
    auto-complete
    auto-complete-clang
    yasnippet

    ;; ;; git
    ;; magit

    ;; TeX
    auctex

    ;; test to use
    ;; tabbar
    ))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'pkg-sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pkg-sync.el ends here
