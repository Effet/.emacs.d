
;; C++ specials
(defun acm-c++-quick-compile()
  "A quick compile funciton for C++"
  (interactive)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -pg"))
  )
(defun acm-c++-quick-run()
  (interactive)
  (shell-command "./a.out < in"))
(defun acm-c++-solve()
  (interactive)
  (shell-command "~/Scripts/acm/sov.py"))


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

             (define-key c++-mode-map "\C-cc" 'acm-c++-quick-compile)
             (define-key c++-mode-map "\C-cr" 'acm-c++-quick-run)
             (define-key c++-mode-map "\C-cs" 'acm-c++-solve)
             (define-key c++-mode-map "\C-cg" 'acm-get-desc)
             ))

(add-hook 'dired-mode-hook
          '(lambda()
             (define-key dired-mode-map "\C-cs" 'acm-c++-solve)
             (define-key dired-mode-map "\C-cg" 'acm-get-desc)
             (define-key dired-mode-map "\C-cl" 'acm-quick-make-symbol-link-to-contest)
             ))


(provide 'my-acm-special-conf)
