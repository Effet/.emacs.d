(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; https://github.com/technomancy/emacs-starter-kit
(when (not package-archive-contents)
  (package-refresh-contents))


;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))

(defun packages-install (packages)
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))


(packages-install
 '(
   ace-jump-mode
   auctex
   autopair
   browse-kill-ring
   dash
   diminish
   dired+
   evil
   expand-region
   fill-column-indicator
   fold-dwim
   google-c-style
   header2
   helm
   hideshowvis
   ido-ubiquitous
   iy-go-to-char
   js2-mode
   lua-mode
   markdown-mode
   mmm-mode
   move-text
   multi-term
   multiple-cursors
   popwin
   quickrun
   rainbow-mode
   session
   smex
   solarized-theme
   switch-window
   undo-tree
   volatile-highlights
   yasnippet
   zenburn-theme
   zencoding-mode
   slime
   slime-fuzzy
   slime-repl
   )
 )


(provide 'init-package)
