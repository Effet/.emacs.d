;;; my-acm-special-conf.el --- My special configs for ACM/ICPC.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:24:34 2012 (+0800)
;; Last-Updated: Tue Aug 14 20:26:43 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; C++ specials
(defun acm-c++-quick-compile()
  "A quick compile funciton for C++"
  (interactive)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))
  )

(defun acm-c++-quick-run()
  (interactive)
  (if (not (file-exists-p "in"))
      (find-file "in")
    (let ((sec 2)
          (buf (get-buffer-create "*Quick Run for ACM*"))
          (cmd (if (eq system-type 'windows-nt)
                   "a.exe < in"
                 "./a.out < in")))
      (async-shell-command cmd buf)
      (run-with-timer sec nil (lambda (buf) (kill-process buf)) buf)
      )
    )
  )
(push '("*Quick Run for ACM*") popwin:special-display-config)

(defun acm-c++-solve()
  (interactive)
  (shell-command "~/Scripts/acm/sov.py")
  )


;; Generals
;; (defun acm-get-desc()
;;   (interactive)
;;   (shell-command "~/Scripts/acm/get_desc.sh")
;;   (find-file "./desc.xml")
;;   )

(defun acm-quick-make-symbol-link-to-contest (oj begin_id label sp)
  (interactive "sWhich oj: 
sBegin problem id: 
sWhich label(A-Z): 
sSpecial option: ")
  (if (y-or-n-p "Link it?")
      (progn
        (let ((cmd (concat "~/Scripts/acm/quick_link.sh "
                           "-o " oj " -i " begin_id " -l " label " " sp)))
          (shell-command cmd)))
    (progn
      (message "Exit!!!")))
  )


(add-hook 'c++-mode-hook
          '(lambda()
             ;; keys for `acm'
             (define-key c++-mode-map [(f9)] 'acm-c++-quick-compile)

             (define-key c++-mode-map (kbd "C-c C-c") 'acm-c++-quick-compile)
             (define-key c++-mode-map (kbd "C-c C-r") 'acm-c++-quick-run)
             (define-key c++-mode-map (kbd "C-c C-s") 'acm-c++-solve)
             ;; (define-key c++-mode-map (kbd "C-c C-g") 'acm-get-desc)

             (define-key c++-mode-map [f5] 'gdb)
             (define-key c++-mode-map [C-f5] 'gud-run)
             (define-key c++-mode-map [S-f5] 'gud-cont)
             (define-key c++-mode-map [f7] 'compile)
             (define-key c++-mode-map [f8] 'gud-print)
             (define-key c++-mode-map [C-f8] 'gud-pstar)
             (define-key c++-mode-map [f9] 'gud-break)
             (define-key c++-mode-map [C-f9] 'gud-remove)
             (define-key c++-mode-map [f10] 'gud-next)
             (define-key c++-mode-map [C-f10] 'gud-until)
             (define-key c++-mode-map [S-f10] 'gud-jump)
             (define-key c++-mode-map [f11] 'gud-step)
             (define-key c++-mode-map [C-f11] 'gud-finish)
             (setq gdb-many-windows t)
             ))

(add-hook 'dired-mode-hook
          '(lambda()
             (define-key dired-mode-map (kbd "C-c C-s") 'acm-c++-solve)
             ;; (define-key dired-mode-map (kbd "C-c C-g") 'acm-get-desc)
             (define-key dired-mode-map (kbd "C-c C-l") 'acm-quick-make-symbol-link-to-contest)
             ))


(provide 'my-acm-special-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my-acm-special-conf.el ends here
