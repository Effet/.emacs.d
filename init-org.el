;;; ---- org-mode ----

;; (require 'htmlize)
;; (require 'org-publish)

(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/Dropbox/Linux/org/"
         :base-extension "org"
         
         :publishing-directory "~/public_html/"
         :publishing-function org-publish-org-to-html

         :htmlized-source t
         :auto-index t
         :style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\" />"

         :recursive t
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/Dropbox/Linux/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))

;; (setq org-export-htmlize-output-type 'css)

(setq org-src-fontify-natively t)
;; (setq org-export-html-preamble nil)

;; (setq org-export-html-use-infojs t)


(provide 'init-org)
