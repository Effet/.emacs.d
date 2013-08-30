;; C-c <left>, c-c <right>
(winner-mode t)

;; windmove
(assign-keys '("C-c w <left>" "C-c w b" "C-c w h") 'windmove-left)
(assign-keys '("C-c w <right>" "C-c w f" "C-c w l") 'windmove-right)
(assign-keys '("C-c w <up>" "C-c w p" "C-c w k") 'windmove-up)
(assign-keys '("C-c w <down>" "C-c w n" "C-c w j") 'windmove-down)

;; C-x o rebind
(use-package switch-window)
