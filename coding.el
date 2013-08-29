;;;; Common
;; (add-hook 'prog-mode-hook
;;           'highlight-fixme-todo-bug)

;;;; Emacs Lisp
(define-key emacs-lisp-mode-map (kbd "C-c .") 'find-function-at-point)

;; https://github.com/milkypostman/dotemacs/blob/master/init.el#L919-L924
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)


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
