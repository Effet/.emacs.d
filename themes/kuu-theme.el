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
      (WhiteSmoke "#eee8d5")
      (white      "#fdf6e3")
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
      (LightBlue  "#268bd2")
      (violet     "violet"))

  (custom-theme-set-faces
   'kuu
;;; Basic Faces
   ;; `(border ((,class (:background ,grey))))
   ;; `(header-line ((,class (:inherit mode-line :foreground ,base0E :background nil))))
   `(cursor ((,class (:background ,red))))
   `(default ((,class (:foreground ,white :background ,black))))
   `(error ((,class (:foreground ,red))))
   `(escape-glyph ((,class (:foreground ,orange :weight bold))))
   `(fringe ((,class (:background ,DimGrey))))
   `(highlight ((,class (:background ,DimGrey))))
   `(isearch ((,class (:foreground ,DimGrey :background ,orange :weight bold))))
   `(isearch-fail ((,class (:background ,red))))
   `(lazy-highlight ((,class (:foreground ,DimGrey :background ,cyan :weight bold))))
   `(link ((,class (:underline t :foreground ,blue))))
   `(link-visited ((,class (:underline t :foreground ,magenta))))
   `(minibuffer-prompt ((,class (:foreground ,orange))))
   `(mode-line ((,class (:box (:line-width -1 :color nil :style released-button) :foreground ,black :background ,WhiteSmoke))))
   ;; `(mode-line-buffer-id ((,class (:weight bold))))
   ;; `(mode-line-emphasis ((,class (:weight bold))))
   ;; `(mode-line-highlight ((,class (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   `(mode-line-inactive ((,class (:weight light :box (:line-width -1 :color nil :style released-button) :foreground ,WhiteSmoke :background ,black :inherit (mode-line)))))
   `(region ((,class (:background ,DarkGrey))))
   `(secondary-selection ((,class (:background ,grey))))
   `(success ((,class (:foreground ,green))))
   `(trailing-whitespace ((,class (:background ,red))))
   `(warning ((,class (:foreground ,orange))))
   `(shadow ((,class (:foreground ,DarkGrey))))

;;; Font Lock
   `(font-lock-builtin-face ((,class (:foreground ,cyan))))
   `(font-lock-comment-face ((,class (:foreground ,DarkGrey))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,DimGrey))))
   `(font-lock-constant-face ((,class (:foreground ,pink))))
   `(font-lock-doc-face ((,class (:foreground ,grey))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,magenta))))
   `(font-lock-negation-char-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,grey))))
   ;; `(font-lock-regexp-grouping-construct ((,class (:foreground ,zenburn-yellow :weight bold))))
   ;; `(font-lock-regexp-grouping-backslash ((,class (:foreground ,zenburn-green :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,gainsboro))))
   `(font-lock-type-face ((,class (:foreground ,orange))))
   `(font-lock-variable-name-face ((,class (:foreground ,cyan))))
   ;; `(font-lock-warning-face ((,class (:foreground ,zenburn-yellow-2 :weight bold))))

;;; Ido
   `(ido-indicator ((,class (:foreground ,red :background ,yellow))))
   `(ido-only-match ((,class (:foreground unspecified :inherit success))))
   `(ido-subdir ((,class (:foreground unspecified :inherit font-lock-function-name-face))))

;;; Org
   `(org-agenda-dimmed-todo-face ((,class (:foreground ,DarkGrey))))
   `(org-agenda-done ((,class (:foreground ,green))))
   `(org-agenda-restriction ((,class (:background ,blue))))
   `(org-agenda-structure ((,class (:background ,LightBlue))))
   `(org-clock-overylay ((,class (:background ,blue))))
   `(org-column ((,class (:background ,grey))))
   `(org-column-title ((,class (:background ,grey))))
   `(org-date ((,class (:foreground ,cyan))))
   `(org-date-selected ((,class (:foreground ,pink))))
   `(org-dawer ((,class (:foreground ,LightBlue))))
   `(org-document-info ((,class (:foreground ,LightCyan))))
   `(org-document-title ((,class (:foreground ,LightCyan))))
   `(org-done ((,class (:foreground ,green))))
   `(org-ellipsis ((,class (:foreground ,WhiteSmoke))))
   `(org-footnote ((,class (:foreground ,cyan))))
   `(org-formula ((,class (:foreground ,orange))))
   `(org-hide ((,class (:foreground ,black))))
   `(org-scheduled ((,class (:foreground ,green))))
   `(org-scheduled-previously ((,class (:foreground ,orange))))
   `(org-scheduled-today ((,class (:foreground ,green))))
   `(org-sexp-date ((,class (:foreground ,cyan))))
   `(org-table ((,class (:foreground ,LightBlue))))
   `(org-time-grid ((,class (:foreground ,yellow))))
   `(org-todo ((,class (:foreground ,pink))))
   `(org-upcoming-deadline ((,class (:foreground ,orange))))

;;; Match
   `(match ((,class (:foreground ,orange :background nil :weight bold))))
   ;; `(match ((,class (:background ,solarized-hl :foreground ,solarized-emph :weight bold))))
   
;;; Paren
   `(show-paren-match ((,class (:background ,blue))))
   `(show-paren-mismatch ((,class (:foreground unspecified :background ,violet))))
   ;; smartparens
   `(sp-show-pair-match-face ((,class (:background unspecified :inherit show-paren-match))))
   `(sp-show-pair-mismatch-face ((,class (:foreground unspecified :background unspecified :inherit show-paren-mismatch))))

;;; Popup
   `(popup-face ((,class (:foreground ,WhiteSmoke :background ,DarkGrey))))
   `(popup-isearch-match ((,class (:background unspecified :inherit lazy-highlight))))
   `(popup-menu-mouse-face ((,class (:foreground ,white :background ,blue))))
   `(popup-menu-selection-face ((,class (:foreground ,WhiteSmoke :background ,orange))))
   `(popup-scroll-bar-background-face ((,class (:background ,DimGrey))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,LightGrey))))
   `(popup-tip-face ((,class (:foreground ,gainsboro :background ,DimGrey))))

;;; Auto Complete

;;; Company
   `(company-preview ((,class (:foreground ,WhiteSmoke :background ,blue))))
   `(company-preview-common ((,class (:foreground ,red))))
   `(company-preview-search ((,class (:background unspecified :inherit lazy-highlight))))
   `(company-tooltip ((,class (:foreground ,WhiteSmoke :background ,DarkGrey))))
   `(company-tooltip-common ((,class (:foreground ,red))))
   `(company-tooltip-common-selection ((,class (:foreground ,red))))
   `(company-tooltip-selection ((,class (:background ,orange))))

;;; Helm
   `(helm-bookmark-addressbook ((,class (:foreground ,brown))))
   `(helm-bookmark-file ((,class (:foreground nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((,class (:foreground ,magenta))))
   `(helm-bookmark-info ((,class (:foreground ,green))))
   `(helm-bookmark-man ((,class (:foreground ,orange))))
   `(helm-bookmark-w3m ((,class (:foreground ,yellow))))
   `(helm-buffer-not-saved ((,class (:foreground ,orange))))
   `(helm-buffer-saved-out ((,class (:foreground ,red :background ,black :inverse-video t))))
   `(helm-buffer-size ((,class (:foreground ,DimGrey))))
   `(helm-candidate-number ((,class (:foreground ,black :background ,yellow :weight bold))))
   `(helm-ff-directory ((,class (:foreground unspecified :background unspecified :inherit dired-directory))))
   `(helm-ff-executable ((,class (:foreground ,green))))
   `(helm-ff-file ((,class (:inherit default))))
   `(helm-ff-invalid-symlink ((,class (:background nil :foreground nil :inherit error :slant italic))))
   `(helm-ff-prefix ((,class (:foreground ,black :background ,yellow))))
   `(helm-ff-symlink ((,class (:foreground nil :background nil :inherit dired-symlink))))
   `(helm-grep-file ((,class (:foreground ,violet))))
   `(helm-grep-finish ((,class (:foreground ,green))))
   `(helm-grep-lineno ((,class (:foreground ,orange))))
   `(helm-grep-running ((,class (:foreground ,red))))
   `(helm-moccur-buffer ((,class (:foreground ,cyan))))
   `(helm-selection ((,class (:background unspecified :inherit highlight))))
   `(helm-selection-line ((,class (:background ,red))))
   `(helm-separator ((,class (:foreground ,red))))
   `(helm-source-header ((,class (:foreground ,black :background ,blue))))
   `(helm-visible-mark ((,class (:foreground ,magenta :background nil :weight bold))))

;;; Term Mode
   `(term-color-black ((,class (:foreground ,black :background ,DarkGrey))))
   `(term-color-red ((,class (:foreground ,red :background ,pink))))
   `(term-color-green ((,class (:foreground ,green :background ,LightGreen))))
   `(term-color-yellow ((,class (:foreground ,orange :background ,yellow))))
   `(term-color-blue ((,class (:foreground ,blue :background ,LightBlue))))
   `(term-color-magenta ((,class (:foreground ,magenta :background ,violet))))
   `(term-color-cyan ((,class (:foreground ,cyan :background ,LightCyan))))
   `(term-color-white ((,class (:foreground ,LightGrey :background ,white)))))

  (custom-theme-set-variables
   'kuu
   `(ansi-color-names-vector
     [,black ,red ,green ,yellow ,blue ,magenta ,cyan ,white])))

(provide-theme 'kuu)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; truncate-lines: t
;; End:
