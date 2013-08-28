(deftheme kuu
  "base16-color compatible, monokai-modified")

(let ((class '((class color) (min-colors 89)))
      ;; base16 color (base00-0F)
      (black      "#1d1f21")
      (DimGrey    "#282a2e")
      (DarkGrey   "#373b41")
      (grey       "#969896")
      (LightGrey  "#b4b7b4")
      (gainsboro  "#c5c8c6")
      (WhiteSmoke "#e0e0e0")
      (white      "#ffffff")
      (red        "#f92672")
      (orange     "#fd971f")
      (yellow     "#f4bf75")
      (green      "#a6e22e")
      (cyan       "#a1efe4")
      (blue       "#33a9dd")
      (magenta    "#ae81ff")
      (brown      "brown")
      ;; additional
      (pink       "pink")
      (LightGreen "light green")
      (LightCyan  "#00ffff")
      (LightBlue  "#007FFF")
      (violet     "violet"))

  (custom-theme-set-faces
   'kuu
;;; Basic Faces
   ;; `(border ((t (:background ,grey))))
   ;; `(header-line ((t (:inherit mode-line :foreground ,base0E :background nil))))
   `(cursor ((t (:background ,red))))
   `(default ((t (:foreground ,white :background ,black))))
   `(error ((,class (:foreground ,red))))
   `(escape-glyph ((t (:foreground ,orange :weight bold))))
   `(fringe ((t (:background ,DimGrey))))
   `(highlight ((t (:background ,DimGrey))))
   `(isearch ((t (:foreground ,DimGrey :background ,orange :weight bold))))
   `(isearch-fail ((t (:background ,red))))
   `(lazy-highlight ((t (:foreground ,DimGrey :background ,cyan :weight bold))))
   `(link ((t (:underline t :foreground ,blue))))
   `(link-visited ((t (:underline t :foreground ,magenta))))
   `(minibuffer-prompt ((t (:foreground ,orange))))
   `(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground ,black :background ,WhiteSmoke))))
   ;; `(mode-line-buffer-id ((t (:weight bold))))
   ;; `(mode-line-emphasis ((t (:weight bold))))
   ;; `(mode-line-highlight ((,class (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   `(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground ,WhiteSmoke :background ,black :inherit (mode-line)))))
   `(region ((t (:background ,DarkGrey))))
   `(secondary-selection ((t (:background ,grey))))
   `(success ((,class (:foreground ,green))))
   `(trailing-whitespace ((t (:background ,red))))
   `(warning ((,class (:foreground ,orange))))

;;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,cyan))))
   `(font-lock-comment-face ((t (:foreground ,DarkGrey))))
   ;; `(font-lock-comment-delimiter-face ((t (:foreground ,DimGrey))))
   `(font-lock-constant-face ((t (:foreground ,pink))))
   `(font-lock-doc-face ((t (:foreground ,grey))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,magenta))))
   `(font-lock-negation-char-face ((t (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,grey))))
   ;; `(font-lock-regexp-grouping-construct ((t (:foreground ,zenburn-yellow :weight bold))))
   ;; `(font-lock-regexp-grouping-backslash ((t (:foreground ,zenburn-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,gainsboro))))
   `(font-lock-type-face ((t (:foreground ,orange))))
   `(font-lock-variable-name-face ((t (:foreground ,cyan))))
   ;; `(font-lock-warning-face ((t (:foreground ,zenburn-yellow-2 :weight bold))))

;;; Term Mode
   `(term-color-black ((t (:foreground ,black :background ,DarkGrey))))
   `(term-color-red ((t (:foreground ,red :background ,pink))))
   `(term-color-green ((t (:foreground ,green :background ,LightGreen))))
   `(term-color-yellow ((t (:foreground ,orange :background ,yellow))))
   `(term-color-blue ((t (:foreground ,blue :background ,LightBlue))))
   `(term-color-magenta ((t (:foreground ,magenta :background ,violet))))
   `(term-color-cyan ((t (:foreground ,cyan :background ,LightCyan))))
   `(term-color-white ((t (:foreground ,LightGrey :background ,white)))))

  (custom-theme-set-variables
   'kuu
   `(ansi-color-names-vector
     [,black ,red ,green ,yellow ,blue ,magenta ,cyan ,white])))

(provide-theme 'kuu)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
