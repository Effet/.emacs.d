;; Refer:
;;   https://github.com/baohaojun/windows-config/blob/master/.emacs_d/lisp/bhj-fonts.el
(require 'cl)
;;;###autoload
(defun get-1-font (fonts)
  (find-if
   #'(lambda (font)
       (not (null (x-list-fonts font)))) fonts))

;;;###autoload
(defun load-font-list (en zh)
  (set-default-font (get-1-font en))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :name (get-1-font zh)))))

(if window-system
    (progn
      (load-font-list
       '("DejaVu Sans Mono-10.5" "Monospace-10")
       '("Hiragino Sans GB-12" "WenQuanYi Micro Hei-12" "Microsoft Yahei-12"))
      ;; (setq face-font-rescale-alist
      ;;       '(("Hiragino Sans GB"  . 1.3)
      ;;         ("WenQuanYi Zen Hei" . 1.2)))

      ;; (load-theme 'solarized-dark t)
      (load-theme 'zenburn t)
      ;; (add-to-list 'default-frame-alist (cons 'width 95))
      ;; (add-to-list 'default-frame-alist (cons 'height 50))
      (set-frame-size (selected-frame) 111 39)
      )
  )


(provide 'init-gui)
