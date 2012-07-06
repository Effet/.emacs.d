

(require 'powerline)
;; (require 'cl)

;; (setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;; (setq powerline-arrow-shape 'arrow14) ;; best for small fonts

(setq powerline-color1 "#657b83")
(setq powerline-color2 "#839496")

(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#859900"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :box nil)


(provide 'powerline-settings)
