(deftheme kuu
  "empty here")

(let ((class '((class color) (min-colors 89)))
      (base00  "#272822")
      (base01  "#383830")
      (base02  "#49483e")
      (base03  "#75715e")
      (base04  "#a59f85")
      (base05  "#f8f8f2")
      (base06  "#f5f4f1")
      (base07  "#f9f8f5")
      (red     "#f92672")
      (orange " #fd971f")
      (yellow  "#f4bf75")
      (green   "#a6e22e")
      (cyan    "#a1efe4")
      (blue    "#66d9ef")
      (magenta "#ae81ff"))

  (custom-theme-set-faces
   'kuu
   ;; Basic Faces
   ;; `(border ((t (:background ,base03))))
   ;; `(header-line ((t (:inherit mode-line :foreground ,base0E :background nil))))
   `(cursor ((t (:background ,red))))
   `(default ((t (:foreground ,base05 :background ,base00))))
   `(error ((,class (:foreground ,red))))
   `(escape-glyph ((t (:foreground ,green))))
   `(fringe ((t (:background ,base02))))
   `(highlight ((t (:background ,base01))))
   `(isearch ((t (:foreground ,yellow :background ,magenta))))
   `(lazy-highlight ((t (:background ,cyan))))
   `(link ((t (:underline t :foreground ,blue))))
   `(link-visited ((t (:underline t :foreground ,magenta))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#2e3436" :background "#d3d7cf"))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((,class (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   `(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground "#eeeeec" :background "#555753" :inherit (mode-line)))))
   `(region ((t (:background ,base02))))
   `(secondary-selection ((t (:background ,yellow))))
   `(success ((,class (:foreground ,green))))
   `(trailing-whitespace ((t (:background ,red))))
   `(warning ((,class (:foreground ,orange))))

   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground "#ad7fa8"))))
   `(font-lock-comment-face ((t (:foreground "#73d216"))))
   `(font-lock-constant-face ((t (:foreground "#e6a8df"))))
   `(font-lock-function-name-face ((t (:foreground "#fce94f"))))
   `(font-lock-keyword-face ((t (:foreground "#b4fa70"))))
   `(font-lock-string-face ((t (:foreground "#e9b96e"))))
   `(font-lock-type-face ((t (:foreground "#8cc4ff"))))
   `(font-lock-variable-name-face ((t (:foreground "#fcaf3e"))))
   )

  (custom-theme-set-variables
   'kuu
   `(ansi-color-names-vector
     [,base00 ,red ,green ,yellow ,blue ,magenta ,cyan ,base05])
   `(ansi-term-color-vector
     [unspecified ,base00 ,red ,green ,yellow ,blue ,magenta ,cyan ,base05])))

(provide-theme 'kuu)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
