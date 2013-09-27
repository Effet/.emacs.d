(defun my-cedet-settings ()

  (semantic-mode 1)

  ;; (require 'sematic/ia)

  (global-semantic-idle-completions-mode t)
  (global-semantic-decoration-mode t)
  (global-semantic-highlight-func-mode t)
  (global-semantic-show-unmatched-syntax-mode t)

  (semanticdb-enable-gnu-global-databases 'java-mode)
  )
