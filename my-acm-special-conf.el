;;; my-acm-special-conf.el --- My special configs for ACM/ICPC.
;; 
;; Author: n4k0master
;; Mail: nesuadark@gmail.com
;; 
;; Created: Thu Jul 19 20:59:16 2012 (+0800)
;; Last-Updated: Wed Jul 25 21:18:52 2012 (+0800)
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
    (async-shell-command "timeout 2 ./a.out < in"))
  )

(defun acm-c++-solve()
  (interactive)
  (shell-command "~/Scripts/acm/sov.py")
  )


;; Generals
(defun acm-get-desc()
  (interactive)
  (shell-command "~/Scripts/acm/get_desc.sh")
  (find-file "./desc.xml")
  )

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
             (define-key c++-mode-map (kbd "C-c C-g") 'acm-get-desc)

             (setq gdb-many-windows t)
             ))

(add-hook 'dired-mode-hook
          '(lambda()
             (define-key dired-mode-map (kbd "C-c C-s") 'acm-c++-solve)
             (define-key dired-mode-map (kbd "C-c C-g") 'acm-get-desc)
             (define-key dired-mode-map (kbd "C-c C-l") 'acm-quick-make-symbol-link-to-contest)
             ))


(provide 'my-acm-special-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my-acm-special-conf.el ends here
