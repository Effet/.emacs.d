;; ;; Use if not use ~/.emacs.d
;; (setq user-emacs-directory "~/dotEmacs/")
;; (load-file "~/dotEmacs/init.el")

(when (eq system-type 'windows-nt)
  (setenv "HOME" (getenv "USERPROFILE")))
