;; Refer:
;;   https://github.com/baohaojun/windows-config/blob/master/.emacs_d/lisp/bhj-fonts.el
(eval-when-compile (require 'cl))
(defun get-1-font (fonts)
  (find-if
   #'(lambda (font)
       (not (null (x-list-fonts font)))) fonts))

(defun load-font-alist (en zh)
  (set-default-font (get-1-font en))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :name (get-1-font zh)))))
