;;; ---- Highlight TODO: FIXME: BUG: ----
;; http://emacs-fu.blogspot.com/2008/12/highlighting-todo-fixme-and-friends.html
;; Warning if a `TODO:', `FIXME:', `BUG:'.
(defun highlight-fixme-todo-bug ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                             1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook
          '(lambda()
             (rainbow-mode)
             (highlight-fixme-todo-bug)))


(dolist (hook '(emacs-lisp-mode-hook
                c-mode-common-hook
                python-mode))
  (add-hook hook
            '(lambda ()
               (hs-minor-mode 1)
               (hideshowvis-enable)
               (hideshowvis-symbols))))



;; C++ specials
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
  '(push '("*Quick Run for ACM*") popwin:special-display-config))

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


(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
  (add-hook hook 'rainbow-mode))


(add-hook 'sgml-mode-hook
          '(lambda()
             (zencoding-mode)
             (local-set-key (kbd "C-c C-j") 'zencoding-expand-line)
             (local-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)))


(defun my-web-settings()
  ;; mmm-mode
  (require 'mmm-auto)

  (setq mmm-global-mode 'auto)

  (setq mmm-submode-decoration-level 0)
  (setq mmm-parse-when-idle t)

  (mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
  (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

  (add-to-list 'auto-mode-alist '("\\.html\\'" . html-erb-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
)


(eval-after-load "html"
  'my-web-settings)


(provide 'init-programmings)
