(defun my-eclim-settings ()
  ;; (custom-set-variables
  ;;  '(eclim-eclipse-dirs '("~/opt/eclipse-sdk-bin-4.2")))
  (require 'eclim)
  (global-eclim-mode)

  (setq eclim-eclipse-dirs (list (getenv "ECLIPSE_HOME") "~/opt/eclipse"))
  ;; NOTE: =eclim/eclimd-executable= are auto equiped.

  (require 'eclimd)

  ;; (setq help-at-pt-display-when-idle t)
  ;; (setq help-at-pt-timer-delay 0.1)
  ;; (help-at-pt-set-timer)

  (require 'ac-emacs-eclim-source)
  (ac-emacs-eclim-config)

  (require 'company-emacs-eclim)
  (company-emacs-eclim-setup)
  )


(defun my-android-mode-settings ()
  (setq android-mode-sdk-dir (or (getenv "ANDROID_HOME") "~/opt/android-sdk"))
  (android-mode)
  )


(defun my-javadoc-lookup-settings ()
  (global-set-key (kbd "C-h j") 'javadoc-lookup)
  (eval-after-load "java-mode"
    (global-set-key (kbd "C-x I") 'add-java-import)))


(add-hook 'after-init-hook
          '(lambda ()
             (my-eclim-settings)
             (my-android-mode-settings)
             (my-javadoc-lookup-settings)))
