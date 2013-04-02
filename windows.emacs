;; truly .emacs under M$.
(setenv "HOME" (getenv "USERPROFILE"))
(load-file (concat (getenv "HOME") "\\.emacs"))
