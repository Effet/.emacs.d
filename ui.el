;;; ui.el --- what emacs look like

(setq inhibit-startup-screen t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L20
;; Add spaces and proper formatting to linum-mode. It uses more room than
;; necessary, but that's not a problem since it's only in use when going to
;; lines.
(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))


;; Modeline Settings
(column-number-mode t)
(size-indication-mode t) ;show file size


(when window-system
  (global-hl-line-mode t))


;; cursor
(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows 'hollow)


(setq custom-theme-directory
      (expand-file-name "themes" user-emacs-directory))


(defun my-x-settings ()
  (tooltip-mode -1)

  (setq frame-title-format
        '("Emacs :: "
          (:eval (if buffer-file-name
                     (abbreviate-file-name buffer-file-name)
                   (buffer-name)))))

  ;;;; Font settings

  ;; -> http://www.emacswiki.org/emacs/SetFonts#toc9
  ;; Assign an available font
  (require 'dash)
  (defun font-candidate (&rest fonts)
    "Return the first available font."
    (--first (find-font (font-spec :name it)) fonts))

;;;----------
;;; http://en.wikipedia.org/wiki/I_Can_Eat_Glass
;;; http://www.columbia.edu/~kermit/utf8.html
;;;--------------------------------------------------
;;; I can eat glass and it doesn't hurt me. 
;;; 我能吞下玻璃而不伤身体。
;;; 我能吞下玻璃而不傷身體。
;;; 私はガラスを食べられます。それは私を傷つけません。
  
  ;; default font
  (set-face-attribute 'default nil
                      :font (font-candidate "ABC"
                                            "DejaVu Sans Mono-9"))

  ;; simplified-chinese font
  (set-fontset-font t 'chinese-gb2312
                    (font-spec
                     :family (font-candidate "Hiragino Sans GB"
                                             "WenQuanYi Micro Hei"
                                             "Microsoft Yahei")))

  ;; rescale some double-wide font to fit width
  (setq face-font-rescale-alist
        '(("Hiragino Sans GB"    . 1.2)
          ("WenQuanYi Micro Hei" . 1.2)
          ("Microsoft Yahei"     . 1.2)))


  (load-theme 'base16-monokai t)
  (set-frame-size (selected-frame) 111 65)
  )


(when window-system
  (my-x-settings))


(provide 'ui)


;;; ui.el ends here
