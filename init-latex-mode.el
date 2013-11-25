(use-package auctex
  :init
  (progn
    (add-hook 'LaTeX-mode-hook
              (lambda ()
                (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                (setq TeX-command-default "XeLaTeX")

                (setq TeX-auto-untabify t     ; remove all tabs before saving
                      TeX-engine 'xetex       ; use xelatex default
                      ;; TeX-show-compilation t ; display compilation windows
                      )

                (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
                (setq TeX-save-query nil)
                (imenu-add-menubar-index)
                (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

    ;; (setq preview-image-type (quote dvipng))

    (cond
     ((eq system-type 'gnu/linux)
      (add-hook 'LaTeX-mode-hook
                (lambda ()
                  (setq TeX-view-program-selection
                        '((output-pdf "Okular")
                          (output-dvi "Okular"))))))

     ((eq system-type 'windows-nt)
      (add-hook 'LaTeX-mode-hook
                (lambda ()
                  (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                     (output-dvi "Yap"))))))
     )))
