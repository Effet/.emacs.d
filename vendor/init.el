;; -> https://github.com/magnars/.emacs.d/blob/master/init.el#L29-L32
;; Add external projects to load path
(dolist (project (directory-files "." t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
