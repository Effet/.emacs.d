;; -*- mode: emacs-lisp; mode: rainbow -*-

(deftheme atomtic "my custom theme")


(let ((bg "gray15")
      (bg-1 "gray22")
      (fg "#dcdccc")
      (fg-1 "#eeeeec")

      (dir-bg "gray10")
      (dir-fg "#729fcf")
      (file-bg "gray15")
      (file-fg "#dcdccc")
      (exec-bg "gray15")
      (exec-fg "#dcdccc")
      (sym-bg "gray15")
      (sym-fg "DarkOrange")
      (inv-sym-bg "black")
      (inv-sym-fg "red")
      
      (mark-bg "#74749A")
      (mark-fg "#eeeeec")
      
      (blue-1 "#729fcf")
      (blue-2 "#334b7d")
      (yellow-1 "#FFAA00")
      (yellow-2 "#fce94f")
      (green "#8ae234")
      (green-1 "#0d4519")
      (green-2 "#006E29")
      (cyan-1 "#729fcf")
      (cyan "#2aa198")
      (magenta "#d33682")
      (violet "#6c71c4")
      )
  (custom-theme-set-faces
   'atomtic
   ;; basic
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background "#fce94f"))))
   `(fringe ((t (:background ,bg-1))))
   `(region ((t (:background ,green-1))))
   `(link ((t (:foreground ,cyan-1))))

   `(minibuffer-prompt ((t (:foreground ,yellow-1 :bold t))))

   ;; modeline (steal from -> cofi-dark-theme)
   `(mode-line ((t (:background ,blue-2 :foreground ,fg :box (:line-width -1 :style released-button)))))
   `(mode-line-inactive ((t (:background ,bg :foreground ,fg :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer ((t (:bold t :foreground ,yellow-1))))
   `(mode-line-major-mode ((t (:bold t :foreground "gold"))))
   `(mode-line-minor-mode ((t (:foreground "khaki"))))

   `(header-line ((t (:background "gray3" :foreground ,yellow-2
                                  :box (:line-width -1 :style released-button)))))

   ;; helm (anything)
   `(helm-source-header ((t (:background ,blue-2 :foreground ,fg-1 :height 1.2))))
   `(helm-selection ((t (:background ,bg-1 :underline t))))
   `(helm-candidate-number ((t (:background ,yellow-1 :foreground ,bg))))
   `(helm-visible-mark ((t (:background "#74749A" :foreground ,fg-1))))
   
   `(helm-ff-directory ((t (:background ,dir-bg :foreground ,dir-fg))))
   `(helm-ff-executable ((t (:background ,exec-bg :foreground ,exec-fg))))
   `(helm-ff-file ((t (:background ,file-bg :foreground ,file-fg))))
   `(helm-ff-invalid-symlink ((t (:background ,inv-sym-bg :foreground ,inv-sym-fg))))
   `(helm-ff-prefix ((t (:background "yellow" :foreground "black"))))
   `(helm-ff-symlink ((t (:background ,sym-fg :foreground ,sym-fg))))

      ;; dired
   `(dired-directory ((t (:background ,dir-bg :foreground ,dir-fg))))
   `(dired-flagged ((t (:inherit error))))
   `(dired-header ((t (:inherit font-lock-type-face))))
   `(dired-mark ((t (:background ,mark-bg :foreground ,mark-fg))))
   `(dired-marked ((t (:background ,mark-bg :foreground ,mark-fg))))
   `(dired-symlink ((t (:background ,sym-bg :foreground ,sym-fg))))
   
   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground "#729fcf"))))
   `(font-lock-comment-face ((t (:foreground "#888a85"))))
   `(font-lock-constant-face ((t (:foreground "#e6a00f"))))
   `(font-lock-doc-face ((t (:foreground "#888a85"))))
   `(font-lock-doc-string-face ((t (:foreground "#ad7fa8"))))
   `(font-lock-function-name-face ((t (:foreground "#edd400"))))
   `(font-lock-keyword-face ((t (:foreground "#729fcf"))))
   `(font-lock-reference-face ((t (:foreground "violet red"))))
   `(font-lock-string-face ((t (:foreground "#ad7fa8"))))
   `(font-lock-type-face ((t (:foreground"#8ae234"))))
   `(font-lock-variable-name-face ((t (:foreground "violet red"))))
   `(font-lock-warning-face ((t (:foreground "#d33682" :bold t))))

   ;; show paren mode
   `(show-paren-match ((t (:background ,green-2))))
   `(show-paren-mismatch ((t (:background "#d33682" :foreground "white"))))

   ;; highlight
   `(lazy-highlight ((t (:background "paleturquoise4" :foreground "white"))))

   ;; org
   `(org-hide ((t (:foreground ,bg))))
   ))

(provide-theme 'atomtic)
