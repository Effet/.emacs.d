;; Hint: C-c & C-s yas-insert-snippet

(require 'yasnippet)

(yas-global-mode 1)

;; https://github.com/redguardtoo/emacs.d/blob/master/init-yasnippet.el
;; default TAB key is occupied by auto-complete
(global-set-key (kbd "C-c k") 'yas-expand)

(setq yas-snippet-dirs (list (expand-file-name "snippets"
                                               user-emacs-directory)))

;; When I typed `(global-set`, and press [tab] to use `competion-at-point` to
;; complete `global-set-key`, in default YASnippet setting, it will expand `set`
;; first if define a snippet `set`.
;;   Refer to -> http://ergoemacs.org/emacs/emacs_tip_yasnippet_expand_whole_hyphenated_word.html
(setq yas-key-syntaxes '("w_" "w_." "w_.()" "^ "))

;; (setq yas-triggers-in-field t)


;; -> http://www.emacswiki.org/emacs/Yasnippet#toc7
;; and -> http://iany.me/2012/03/use-popup-isearch-for-yasnippet-prompt/
(require 'popup)
;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

;; http://www.emacswiki.org/emacs/Yasnippet#toc6
(defun shk-yas/helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
        (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
        (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
        (setq tmpsource
              (list
               (cons 'name prompt)
               (cons 'candidates cands)
               '(action . (("Expand" . (lambda (selection) selection))))
               ))
        (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
        (if (null result)
            (signal 'quit "user quit!")
          (cdr (assoc result rmap))))
    nil))

(require 'dropdown-list)

(setq yas-prompt-functions '(yas-popup-isearch-prompt
                             yas-ido-prompt
                             shk-yas/helm-prompt
                             yas-dropdown-prompt
                             yas-completing-prompt
                             yas-no-prompt))


(defun yas-not-activate ()
  (memq major-mode '(term-mode)))
(setq-default yas-dont-activate (cons #'yas-not-activate yas-dont-activate))
