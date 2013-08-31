(when nil
  ;; (custom-set-variables
  ;;  '(eclim-eclipse-dirs '("~/opt/eclipse-sdk-bin-4.2")))
  (require 'eclim)
  (global-eclim-mode)

  (setq eclim-eclipse-dirs '("~/Develops/eclipse/eclipse"))
  (setq eclim-executable "~/Develops/eclipse/eclipse/eclim")

  (require 'eclimd)

  (require 'ac-emacs-eclim-source)
  (ac-emacs-eclim-config)
  )
