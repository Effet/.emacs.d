;; input-method [eim] (C-\)
;; `https://github.com/viogus/eim.git'
(add-to-list 'load-path (concat user-emacs-directory "plugins/eim"))
(autoload 'eim-use-package "eim" "Another emacs input method")

;; (setq eim-punc-translate-p nil)
;; (setq eim-use-tooltip t)
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" (concat user-emacs-directory "/py.txt"))
(set-input-method "eim-py")
;; (activate-input-method "eim-py")
(toggle-input-method nil)

;; ;; 用 ; 暂时输入英文
;; (require 'eim-extra)
;; (global-set-key ";" 'eim-insert-ascii)


(add-to-list 'load-path (concat user-emacs-directory "plugins/youdao-dict"))
(autoload 'youdao-dict "youdao-dict")

(provide 'init-plugins)
