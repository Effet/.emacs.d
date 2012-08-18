;;; personal-package-sync.el --- Prepair packages.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:19:51 2012 (+0800)
;; Last-Updated: Sat Aug 18 16:27:09 2012 (+0800)
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
    highlight-parentheses
    ;; highlight-symbol
    volatile-highlights
    header2
    quickrun
    helm                                ;`anything'

    ;; ;; misc
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

    ;; Completions
    auto-complete
    auto-complete-clang
    yasnippet

    ;; TeX
    auctex

    org

    ))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'personal-package-sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-package-sync.el ends here
