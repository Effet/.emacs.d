;; TRUE `.emacs' in MS-Windows.
(setenv "HOME" (getenv "USERPROFILE"))
(load-file (concat (getenv "HOME") "\\.emacs"))
