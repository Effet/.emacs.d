;; -*- encoding: utf-8-unix; -*-


;; (require 'auto-complete)
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)


;; Use `yasnippet' backend.
(require 'yasnippet)
(yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")

;; (yas/global-mode 1)

(add-hook 'prog-mode-hook
          '(lambda ()
             (yas/minor-mode)))

(setq yas/trigger-key "TAB")


;; Use `clang' backend.
(require 'auto-complete-clang)


(define-key ac-complete-mode-map "\t"      'ac-complete)
(define-key ac-complete-mode-map "\r"       nil)

(define-key ac-complete-mode-map "\C-n"    'ac-next)
(define-key ac-complete-mode-map "\C-p"    'ac-previous)
(define-key ac-complete-mode-map "\M-/"    'ac-stop)


(global-auto-complete-mode t)

;; After selecting candidates, `TAB' will behave as `RET'
(setq ac-dwim t)

(ac-set-trigger-key "TAB")
(setq ac-delay 0.5)


;; (setq ac-auto-start nil)

(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer
                ac-source-filename
                ))

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/x86_64-pc-linux-gnu
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/backward
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include-fixed
 /usr/include
")))


(add-hook
 'c-mode-common-hook
 '(lambda()
    (setq ac-sources (append
                      '(ac-source-yasnippet
                        ac-source-clang)
                      ac-sources))))


(provide 'ac-conf)
