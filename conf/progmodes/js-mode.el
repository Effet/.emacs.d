(use-package js2-mode
  :commands js2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))
