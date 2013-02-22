;; Refer:
;;   https://github.com/baohaojun/windows-config/blob/master/.emacs_d/lisp/bhj-fonts.el
(require 'cl)
;;;###autoload
(defun get-1-font (fonts)
  (find-if
   #'(lambda (font)
       (not (null (x-list-fonts font)))) fonts))

;;;###autoload
(defun load-font (en zh)
  (set-default-font (get-1-font en))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :name (get-1-font zh)))))

(if window-system
    (load-font
     '("DejaVu Sans Mono-10.5" "Monospace-10")
     '("Hiragino Sans GB-12" "WenQuanYi Micro Hei-12" "Microsoft Yahei-12")))

;; (setq face-font-rescale-alist
;;       '(("Hiragino Sans GB"  . 1.3)
;;         ("WenQuanYi Zen Hei" . 1.2)))


(if window-system
    (progn
      (load-theme 'solarized-dark t)
      (add-to-list 'default-frame-alist (cons 'width 95))
      (add-to-list 'default-frame-alist (cons 'height 50))))
