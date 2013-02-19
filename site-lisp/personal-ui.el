(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
;; (scroll-bar-mode -1)


(setq inhibit-startup-screen t)


;; Modeline Settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t) ;show file size


;; line-number
;; (global-linum-mode t)
(setq linum-format "%5d ")
;; M-x toggle-truncate-lines


;; (global-hl-line-mode t)


;; http://www.emacswiki.org/emacs/FrameTitle#toc4
(setq frame-title-format
      '(buffer-file-name "%f"
        (dired-directory dired-directory "%b")))


;; Fringe Show line
(setq default-indicate-empty-lines t
      default-indicate-buffer-boundaries 'left)


;; http://emacswiki.org/emacs/ShowParenMode
(show-paren-mode t)


;; Refer:
;;   https://github.com/baohaojun/windows-config/blob/master/.emacs_d/lisp/bhj-fonts.el
(require 'cl)
(defun get-1-font (fonts)
  (find-if
   #'(lambda (font)
       (not (null (x-list-fonts font)))) fonts))

(defun hienke-load-font (en zh)
  (set-default-font (get-1-font en))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset (font-spec :name (get-1-font zh)))))

(if window-system
    (hienke-load-font
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

(provide 'personal-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-ui.el ends here
