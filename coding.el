;;;; Common
(add-hook 'prog-mode-hook
          'highlight-fixme-todo-bug)


;;;; Python
(use-package jedi
  :commands jedi:setup
  :init
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:setup-keys t)
    (setq jedi:complete-on-dot t)))


;;;; Java
;; ;; (custom-set-variables
;; ;;  '(eclim-eclipse-dirs '("~/opt/eclipse-sdk-bin-4.2")))
;; (with-package emacs-eclim-autoloads
;;   (require 'eclim)
;;   (global-eclim-mode)

;;   (setq eclim-eclipse-dirs '("~/Develops/eclipse/eclipse"))
;;   (setq eclim-executable "~/Develops/eclipse/eclipse/eclim")

;;   (require 'eclimd)

;;   (with-package auto-complete-config
;;     ;; (message "----> ac-emacs-eclim <----")
;;     (require 'ac-emacs-eclim-source)
;;     (ac-emacs-eclim-config))
;;   )


;;;; C++ specials
(defun my-c++-quick-compile()
  "A quick compile funciton for C++"
  (interactive)
  (save-buffer)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg")))

(defun my-c++-quick-run()
  (interactive)
  (if (not (file-exists-p "in"))
      (find-file "in")
    (let ((sec 2)
          (buf (get-buffer-create "*Quick Run for ACM*"))
          (cmd (if (eq system-type 'windows-nt)
                   "a.exe < in"
                 "./a.out < in")))
      (async-shell-command cmd buf)
      (run-with-timer sec nil (lambda (buf) (kill-process buf)) buf))))

(eval-after-load 'popwin
  '(push "*Quick Run for ACM*" popwin:special-display-config))

;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)


(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(add-hook 'c++-mode-hook
          '(lambda()
             (c-toggle-hungry-state)
             (c-toggle-auto-state)

             (local-set-key (kbd "C-c C-c") 'my-c++-quick-compile)
             (local-set-key (kbd "C-c C-r") 'my-c++-quick-run)

             (local-set-key (kbd "M-n") 'next-error)
             (local-set-key (kbd "M-p") 'previous-error)
             ))


;;;; if interactive enable `rainbow-mode', M-o M-o to refontify.
(use-package rainbow-mode
  :commands rainbow-mode
  :init
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))))


;;;; web-mode
(use-package web-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    ))

;;;; mmm-mode
(use-package mmm-mode
  :disabled t
  :init
  (progn
    (require 'mmm-auto)
    (setq mmm-global-mode 'buffers-with-submode-classes)
    (setq mmm-submode-decoration-level 0)
    (setq mmm-parse-when-idle t)

    (mmm-add-mode-ext-class 'html-mode nil 'html-js)
    (mmm-add-mode-ext-class 'html-mode nil 'html-css)

    ;; jsp
    (add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
    (mmm-add-mode-ext-class 'html-mode "\\.jsp\\'" 'jsp)))


;; (require-package 'skewer-mode)
;; (skewer-setup)


;;;; Latex
;; (with-package* auctex
;;   (add-hook 'LaTeX-mode-hook
;;             (lambda ()
;;               (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;;               (setq TeX-command-default "XeLaTeX")

;;               (setq TeX-auto-untabify t     ; remove all tabs before saving
;;                     TeX-engine 'xetex       ; use xelatex default
;;                     ;; TeX-show-compilation t ; display compilation windows
;;                     )

;;               (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
;;               (setq TeX-save-query nil)
;;               (imenu-add-menubar-index)
;;               (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))


;;   ;; (setq preview-image-type (quote dvipng))

;;   (cond
;;    ((eq system-type 'gnu/linux)
;;     (add-hook 'LaTeX-mode-hook
;;               (lambda ()
;;                 (setq TeX-view-program-selection
;;                       '((output-pdf "Okular")
;;                         (output-dvi "Okular"))))))

;;    ((eq system-type 'windows-nt)
;;     (add-hook 'LaTeX-mode-hook
;;               (lambda ()
;;                 (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
;;                                                    (output-dvi "Yap"))))))
;;    )
;;   )


(provide 'coding)
