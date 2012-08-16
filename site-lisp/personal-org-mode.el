;;; personal-org-mode.el --- org-mode configuration.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:23:31 2012 (+0800)
;; Last-Updated: Wed Aug 15 10:33:34 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; (require 'htmlize)

(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org/"
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
         :base-directory "~/org/"
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

(provide 'personal-org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-org-mode.el ends here
