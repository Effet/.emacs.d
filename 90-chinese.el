;; input-method
(add-to-list 'load-path "~/.emacs.d/site-lisp/eim")
(require 'eim-extra)

(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-punc-translate-p nil)
(setq eim-use-tooltip nil)

(register-input-method
  "eim-py" "euc-cn" 'eim-use-package
  "拼音" "汉字拼音输入法" "~/.emacs.d/site-lisp/eim/py.txt")

(set-input-method "eim-py")
(setq activate-input-method t)
(toggle-input-method nil)
;(provide 'eim-extension)