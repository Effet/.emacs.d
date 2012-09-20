;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-ui.el --- UI setup
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:18:44 2012 (+0800)
;; Last-Updated: Thu Sep  6 14:18:40 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq default-frame-alist
      '(
        ;; (font . "Inconsolata-12")
        ;; (alpha 86 84)
        (height . 45)
        (width . 120)
        (vertical-scroll-bars . nil)
        ;; (vertical-scroll-bars . 'right)
        ;; (menu-bar-lines . 0)
        (tool-bar-lines . 0)))


(setq inhibit-startup-screen t)


;; Modeline Settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)                ;show file size


;; line-number
(global-linum-mode t)
(setq linum-format "%5d ")
;; M-x toggle-truncate-lines


;; (global-hl-line-mode t)                 ;highlight line


;; http://www.emacswiki.org/emacs/FrameTitle#toc4
(setq frame-title-format
      '(buffer-file-name
        "%f"
        (dired-directory dired-directory "%b")))


;; Fringe Show line
(setq default-indicate-empty-lines t
      default-indicate-buffer-boundaries 'left)


;; ;; http://emacswiki.org/emacs/ShowParenMode
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(setq show-paren-style 'mixed)
;; (setq show-paren-style 'expression)


(defun frame-setting ()
  ;; (lispy-parens)
  (when window-system
    ;; http://emacser.com/torture-emacs.htm
    ;; Setting English Font
    (set-face-attribute
     'default nil :font "Inconsolata-12")
    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       (frame-parameter nil 'font)
       charset
       (font-spec :name (if (eq system-type 'windows-nt)
                            "微软雅黑"
                          "WenQuanYi Micro Hei Mono"))))
    )
  )


(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (frame-setting))))
  (frame-setting))


(load-theme 'solarized-dark t)

;; (if window-system
;;     (load-theme 'solarized-dark t))


(provide 'personal-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-ui.el ends here
