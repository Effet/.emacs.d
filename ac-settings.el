;; -*- encoding: utf-8-unix; -*-

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")

(ac-config-default)

(require 'auto-complete-clang)
(defun ac-configs()
  (setq-default ac-sources
                '(ac-source-abbrev
                  ac-source-dictionary
                  ac-source-words-in-same-mode-buffers))
  (setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/x86_64-pc-linux-gnu
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/backward
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include-fixed
 /usr/include
"
               )))
  (global-auto-complete-mode t))

(eval-after-load "auto-complete"
  '(ac-configs))

(add-hook
 'c-mode-common-hook
 '(lambda()
    (setq ac-sources (append
                      '(ac-source-clang
                        ac-source-yasnippet)
                      ac-sources))))

(provide 'ac-settings)
