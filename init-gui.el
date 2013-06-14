(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)


;; Refer to ->
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


(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))

(if window-system
    (progn
      (load-font-alist
       '("DejaVu Sans Mono-9" "Monospace-10")
       '("Hiragino Sans GB-10.5" "WenQuanYi Micro Hei-12" "Microsoft Yahei-12"))
      ;; (setq face-font-rescale-alist
      ;;       '(("Hiragino Sans GB"  . 1.3)
      ;;         ("WenQuanYi Zen Hei" . 1.2)))

      ;; (require-package 'zenburn-theme)
      ;; (load-theme 'zenburn t)
      ;; (load-theme 'atomtic t)
      (load-theme 'base16-monokai t)
      ;; (load-theme 'cofi-dark t)
      (set-frame-size (selected-frame) 111 41)
      ))


(provide 'init-gui)
