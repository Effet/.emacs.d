;; Personal Information
(setq user-full-name "Catl Sing"
      user-mail-address "nesuadark@gmail.com")


(setq user-lisp-directory
      (concat user-emacs-directory
              (convert-standard-filename "elisp/")))

(add-to-list 'load-path user-lisp-directory)
(add-to-list 'load-path (concat user-lisp-directory "plugins/"))

(setq custom-file (concat user-lisp-directory "custom.el"))


;; Load Stuffs
(when (file-exists-p user-lisp-directory)
  (mapc 'load (directory-files user-lisp-directory nil "^[^#].*el$")))
