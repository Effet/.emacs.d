;;; auctex-conf.el --- Tex configs.
;; 
;; Author: n4k0master
;; Mail: nesuadark@gmail.com
;; 
;; Created: Thu Jul 19 21:01:27 2012 (+0800)
;; Last-Updated: Tue Jul 24 19:10:04 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


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
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince"))))))
 
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))
 )


(provide 'auctex-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auctex-conf.el ends here
