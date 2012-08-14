;;; personal-ui.el --- UI setup
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:18:44 2012 (+0800)
;; Last-Updated: Tue Aug 14 20:19:34 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(scroll-bar-mode -1)


;; Modeline Settings
(line-number-mode    t)
(column-number-mode  t)
(size-indication-mode t)                ;show file size


;; line-number
(global-linum-mode t)
(setq linum-format "%5d ")
;; M-x toggle-truncate-lines


;; (global-hl-line-mode t) ;; highlight line


;; http://www.emacswiki.org/emacs/FrameTitle#toc4
(setq frame-title-format
          '(buffer-file-name
            "%f"
            (dired-directory dired-directory "%b")))


;; For `Server-Client'.
(setq default-frame-alist
      '(
        ;; (font . "Inconsolata-12")
        ;; (alpha 86 84)
        (height . 45)
        (width . 120)
        (vertical-scroll-bars . nil)
        ;; (vertical-scroll-bars . 'right)
        ;; (menu-bar-lines . 0)
        (tool-bar-lines . 0)
      ))


;; ;; Cursor Setting.
;; (blink-cursor-mode t)


;; ;; http://emacswiki.org/emacs/ShowParenMode
;; (defun lispy-parens ()
;;   "Setup parens display for lisp modes"
;;   (setq show-paren-delay 0)
;;   (setq show-paren-style 'parenthesis)
;;   (make-variable-buffer-local 'show-paren-mode)
;;   (show-paren-mode 1)
;;   (set-face-background 'show-paren-match-face (face-background 'default))
;;   (if (boundp 'font-lock-comment-face)
;;       (set-face-foreground 'show-paren-match-face
;;                            (face-foreground 'font-lock-comment-face))
;;     (set-face-foreground 'show-paren-match-face
;;                          (face-foreground 'default)))
;;   (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold))


;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "WenQuanYi Micro Hei Mono" :size 16)))



(defun frame-setting ()
  ;;   ;; Themes
  ;;   (if window-system
  ;;       (load-theme 'solarized-dark t))
  
  ;; (lispy-parens)
  (when window-system
    ;; http://emacser.com/torture-emacs.htm
    ;; Setting English Font
    (set-face-attribute
     'default nil :font "Inconsolata-12")
    
    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "WenQuanYi Micro Hei Mono" :size 16)))
    )
  )

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (frame-setting))))
  (frame-setting))


;; Change Cursor when Mode.
(require 'cursor-chg)  ; Load the library
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode
(setq curchg-default-cursor-color "wheat2")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 0.5)
 '(blink-cursor-mode t)
 '(cursor-in-non-selected-windows nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default)))
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode t)
 '(echo-keystrokes 0.1)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fill-column 80)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(major-mode (quote text-mode))
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(require-final-newline t)
 '(scroll-margin 3)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "wheat2" :inverse-video t))))
 '(mouse ((t (:background "white")))))


(provide 'personal-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-ui.el ends here
