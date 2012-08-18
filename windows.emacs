;;; -*- coding: utf-8 mode: emacs-lisp -*-
;; TRUE `.emacs' in MS-Windows.

(setenv "HOME" (getenv "USERPROFILE"))
(load-file (concat (getenv "HOME") "\\.emacs"))
