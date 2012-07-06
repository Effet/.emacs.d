;; * tabbar
(require 'tabbar)
(tabbar-mode 1)

;; * face
(custom-set-variables
 '(tabbar-separator (quote (0.5)))
 '(tabbar-use-images nil))
(defmacro tabbar-customize-faces-macro (foreground background sforeground uforeground ubackground)
`(custom-set-faces
 '(tabbar-button ((t (:inherit tabbar-default))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background ,background :foreground ,foreground :height 0.8))))
 '(tabbar-highlight ((t (:overline ,background))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "background-color-at-point" :foreground ,sforeground))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background ,ubackground :foreground ,uforeground)))))
)


(tabbar-customize-faces-macro 
 "gray50"                               ;foreground
 "gray15"                               ;background
 "yellow"                               ;sforeground
 "gray60"                               ;uforeground
 "gray25"                               ;ubackground
 )

;; * keybind
;; (def-key-s 0
;;   "M-j" 'tabbar-backward-tab
;;   "M-k" 'tabbar-forward-tab
;;     )
;; * all tabs is just one group
;	(setq tabbar-buffer-groups-function
;	      (lambda ()
;	  	(list "All")))
  
;; * group rules
(defun substring-buffer-name (m n &optional x)
  "使用 substring 截取文件名时，在 buffer-name 后面加几个字符，
   防止文件名过短引发错误"
  (substring (concat
              (if x
                  (buffer-file-name)
                (buffer-name))
              (make-string n ?*))
             m n))

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
;   ((or (get-buffer-process (current-buffer))
;        ;; Check if the major mode derives from `comint-mode' or
;        ;; `compilation-mode'.
;        (tabbar-buffer-mode-derived-p
;         major-mode '(comint-mode compilation-mode)))
;    "Process")

    ((member (buffer-name)
             '("*scratch*" "*Messages*"))
     "Common")

    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Help")

    ((eq major-mode 'dired-mode)
     "Dired")

    ((memq major-mode
           '(rmail-mode
             rmail-edit-mode vm-summary-mode vm-mode mail-mode
             mh-letter-mode mh-show-mode mh-folder-mode
             gnus-summary-mode message-mode gnus-group-mode
             gnus-article-mode score-mode gnus-browse-killed-mode))
     "Mail")

    ((string-equal "*vc-" (substring-buffer-name 0 4))
     "VC-mode Buffer")

    ((string-equal "*sdcv*" (substring-buffer-name 0 6))
     "User Buffer")

    ((string-equal "*" (substring-buffer-name 0 1))
     "Emacs Buffer")
;;;;
    ((or (string-equal "emacs" (substring-buffer-name 1 6))
         (string-equal init-dir (substring-buffer-name 0 (length init-dir) t)))
     "Configuration")
;;;;
    (t
     "User Buffer")
    )))

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(provide 'tabbar-settings)
