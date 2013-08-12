;; -> http://www.emacswiki.org/emacs/SetFonts#toc9
;; Assign an available font
(require 'dash)
(defun font-candidate (&rest fonts)
  "Return the first available font."
  (--first (find-font (font-spec :name it)) fonts))

(defun setup-my-font (size ascii-font &optional gbk-font)
  "Assign font for ascii and (if specified) hanzi"
  ;; default font
  (set-face-attribute 'default nil :family ascii-font :height (* size 10))
  ;; hanzi
  (if gbk-font
      (set-fontset-font t 'chinese-gbk (font-spec :family gbk-font))))

(defun setup-my-font--dejavusansmono-wqymicrohei (&optional size)
  "Mix `DejaVu Sans Mono' and `WenQunYi Micro Hei'"
  (interactive "P")
  (setup-my-font (or size 9)
                 "DejaVu Sans Mono" "WenQuanYi Micro Hei")
  (setq face-font-rescale-alist
        '(("WenQuanYi Micro Hei" . 1.2)))
  )

(defun setup-my-font--dejavusansmono-hiraginosansgb (&optional size)
  "Mix `DejaVu Sans Mono' and `WenQunYi Micro Hei'"
  (interactive "P")
  (setup-my-font (or size 9)
                 "DejaVu Sans Mono" "Hiragino Sans GB")
  (setq face-font-rescale-alist
        '(("Hiragino Sans GB" . 1.2)))
  )

(defun setup-my-font--terminus-wqybitmapsong (&optional size)
  "Mix `Terminus' and `WenQuanYi Bitmap Song'"
  (interactive "P")
  (setup-my-font (or size 9)
                 "Terminus" "WenQuanYi Bitmap Song"))

(if (eq window-system 'x)
    (setup-my-font--dejavusansmono-hiraginosansgb))

(provide 'setup-font)

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
