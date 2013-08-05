;;;; Font settings

;; -> http://www.emacswiki.org/emacs/SetFonts#toc9
;; Assign an available font
(require 'dash)
(defun font-candidate (&rest fonts)
  "Return the first available font."
  (--first (find-font (font-spec :name it)) fonts))


(defun setup-my-font (ascii-font &optional gbk-font)
  "Assign font for ascii and (if specified) hanzi"
  ;; default font
  (set-face-attribute 'default nil :font ascii-font)
  ;; hanzi
  (if gbk-font
      (set-fontset-font t 'chinese-gbk (font-spec :family gbk-font))))



(defun setup-my-font-dejavusansmono-wqymicrohei ()
  "Mix `DejaVu Sans Mono' and `WenQunYi Micro Hei'"
  (setup-my-font "DejaVu Sans Mono-9" "WenQuanYi Micro Hei")
  (setq face-font-rescale-alist
        '(("WenQuanYi Micro Hei" . 1.2)))
  )


(defun setup-my-font-terminus-wqybitmapsong ()
  "Mix `Terminus' and `WenQuanYi Bitmap Song'"
  (setup-my-font "Terminus-9" "WenQuanYi Bitmap Song"))


(if (eq window-system 'x)
    (setup-my-font-terminus-wqybitmapsong))


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
;; check if font is ok.