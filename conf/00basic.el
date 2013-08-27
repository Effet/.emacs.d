(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(if window-system (tooltip-mode -1))

(setq inhibit-startup-screen t)

;; always use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)
