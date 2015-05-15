(setq inhibit-startup-screen t)

(tool-bar-mode -1)
;; (menu-bar-mode -1)
(scroll-bar-mode -1)


(setq custom-theme-directory (concat user-emacs-directory "themes"))
(load-theme 'zenburn t)

;; cursor
(setq-default cursor-type 'bar)
(setq-default cursor-in-non-selected-windows 'hollow)

;; modeline
(column-number-mode t)
(size-indication-mode t)
(global-anzu-mode t)

(if window-system
    (setq frame-title-format
          '("Emacs :: "
            (:eval (if buffer-file-name
                       (abbreviate-file-name buffer-file-name)
                     (buffer-name))))))

(setq linum-format (lambda (line)
                     (propertize
                      (format (concat " %"
                                      (number-to-string
                                       (length (number-to-string
                                                (line-number-at-pos (point-max)))))
                                      "d ")
                              line)
                      'face 'linum)))

(when window-system
  (global-hl-line-mode t))


(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :init (volatile-highlights-mode t))


;;; Font Setting
(let ((size 12)
      (ascii-font (font-candidate "PragmataPro"
                                  "Menlo"
                                  "Monaco"
                                  "DejaVu Sans Mono"
                                  "Monospace"))
      (gbk-font (font-candidate "Hiragino Sans GB"
                                "WenQuanYi Micro Hei")))
  (progn
    (set-face-attribute 'default
                        nil
                        :family ascii-font
                        :height (* size 10))
    (if gbk-font
        (set-fontset-font t
                          'chinese-gbk
                          (font-spec :family gbk-font)
                          nil
                          ;; low priority
                          'append))))

;; rescale double-wide fonts
(setq face-font-rescale-alist
      '(("WenQuanYi Micro Hei" . 1.2)
        ("Hiragino Sans GB"    . 1.2)))

;;;---------------------------------------------------\
;;; http://en.wikipedia.org/wiki/I_Can_Eat_Glass      |
;;; http://www.columbia.edu/~kermit/utf8.html         |
;;;---------------------------------------------------|
;;; I can eat glass and it doesn't hurt me.           |
;;; 我能吞下玻璃而不伤身体。                          |
;;; 我能吞下玻璃而不傷身體。                          |
;;; 私はガラスを食べられます。それは私を傷つけません。|
;; --------------------
;; check whether font setting is ok.
