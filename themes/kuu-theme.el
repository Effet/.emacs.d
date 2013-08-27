(deftheme kuu
  "base16-color compatible")

(lexical-let ((class '((class color) (min-colors 89)))
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
              (blue       "#66d9ef")
              (magenta    "#ae81ff")
              (brown      "brown")
              ;; additional
              (pink       "pink")
              (LightGreen "light green")
              (LightCyan  "light cyan")
              (LightBlue  "#007FFF")
              (violet     "violet"))

  ;; xresources color
  (defun get-xresource-palette ()
    (concat "\n*.foreground:  " white
            "\n*.background:  " black
            "\n*.cursorColor: " red
            "\n*.color0:      " black
            "\n*.color1:      " red
            "\n*.color2:      " green
            "\n*.color3:      " orange
            "\n*.color4:      " blue
            "\n*.color5:      " magenta
            "\n*.color6:      " cyan
            "\n*.color7:      " LightGrey
            "\n*.color8:      " DarkGrey
            "\n*.color9:      " pink
            "\n*.color10:     " LightGreen
            "\n*.color11:     " yellow
            "\n*.color12:     " LightBlue
            "\n*.color13:     " violet
            "\n*.color14:     " LightCyan
            "\n*.color15:     " white
            "\n"))

  (custom-theme-set-faces
   'kuu
;;; Basic Faces
   ;; `(border ((t (:background ,grey))))
   ;; `(header-line ((t (:inherit mode-line :foreground ,base0E :background nil))))
   `(cursor ((t (:background ,red))))
   `(default ((t (:foreground ,white :background ,black))))
   `(error ((,class (:foreground ,red))))
   `(escape-glyph ((t (:foreground ,orange :bold t))))
   `(fringe ((t (:background ,DimGrey))))
   `(highlight ((t (:background ,DimGrey))))
   `(isearch ((t (:foreground ,DimGrey :background ,orange :bold t))))
   `(isearch-fail ((t (:background ,red))))
   `(lazy-highlight ((t (:foreground ,DimGrey :background ,cyan :bold t))))
   `(link ((t (:underline t :foreground ,blue))))
   `(link-visited ((t (:underline t :foreground ,magenta))))
   `(minibuffer-prompt ((t (:foreground ,orange))))
   `(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#2e3436" :background "#d3d7cf"))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((,class (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   `(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground "#eeeeec" :background "#555753" :inherit (mode-line)))))
   `(region ((t (:background ,DarkGrey))))
   `(secondary-selection ((t (:background ,grey))))
   `(success ((,class (:foreground ,green))))
   `(trailing-whitespace ((t (:background ,red))))
   `(warning ((,class (:foreground ,orange))))

;;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,violet))))
   `(font-lock-comment-face ((t (:foreground ,DarkGrey))))
   ;; `(font-lock-comment-delimiter-face ((t (:foreground ,grey))))
   `(font-lock-constant-face ((t (:foreground ,brown))))
   `(font-lock-doc-face ((t (:foreground ,grey))))
   `(font-lock-function-name-face ((t (:foreground ,yellow))))
   `(font-lock-keyword-face ((t (:foreground ,magenta))))
   `(font-lock-negation-char-face ((t (:foreground ,red :bold t))))
   `(font-lock-preprocessor-face ((t (:foreground ,grey))))
   ;; `(font-lock-regexp-grouping-construct ((t (:foreground ,zenburn-yellow :weight bold))))
   ;; `(font-lock-regexp-grouping-backslash ((t (:foreground ,zenburn-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,LightGrey))))
   `(font-lock-type-face ((t (:foreground ,blue))))
   `(font-lock-variable-name-face ((t (:foreground ,LightCyan))))
   ;; `(font-lock-warning-face ((t (:foreground ,zenburn-yellow-2 :weight bold))))

;;; Term Mode
   `(term-color-black ((t (:foreground ,black :background ,black))))
   `(term-color-red ((t (:foreground ,red :background ,red))))
   `(term-color-green ((t (:foreground ,green :background ,green))))
   `(term-color-yellow ((t (:foreground ,yellow :background ,yellow))))
   `(term-color-blue ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,magenta :background ,red))))
   `(term-color-cyan ((t (:foreground ,cyan :background ,blue))))
   `(term-color-white ((t (:foreground ,white :background ,white))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black)))))

  (custom-theme-set-variables
   'kuu
   `(ansi-color-names-vector
     [,black ,red ,green ,yellow ,blue ,magenta ,cyan ,white])))

(provide-theme 'kuu)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
