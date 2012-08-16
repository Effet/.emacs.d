;;; personal-eshell.el --- Configs and functions for `eshell'.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:21:23 2012 (+0800)
;; Last-Updated: Thu Aug 16 12:14:05 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; http://www.emacswiki.org/emacs/EshellFunctions


(require 'eshell)
(require 'pcomplete)

(setq
 eshell-save-history-on-exit   t
 eshell-history-size           512
)

(setq
 eshell-cp-interactive-query   t
 eshell-ln-interactive-query   t
 eshell-mv-interactive-query   t
 eshell-rm-interactive-query   t
 
 eshell-mv-overwrite-files     nil
 )

(setq
 eshell-cmpl-ignore-case 	   t
 eshell-cmpl-cycle-completions t
 )


(setq eshell-prompt-function
      (lambda ()
        (concat
         "[" (eshell/pwd) "]\n"
         ;; (if (= (user-uid) 0) "# " "$ "))
         (if (= (user-uid) 0) "Δ " "λ "))
        ))

;; (setq eshell-prompt-regexp "^[^#$]*[$#] ")
(setq eshell-prompt-regexp "^[^Δλ\n]*[Δλ] ")


(add-hook 'eshell-mode-hook
          (lambda()
            ;; `Usage'
            ;;    "C-c @ C-t" hide-body
            ;;    "C-C @ C-a" show-all
            ;;    "C-c @ C-c" hide-entry
            ;;    "C-c @ C-e" show-entry
            ;;    "C-c @ C-o" hide-other (hide other into single)
            (outline-minor-mode t)
            (setq outline-regexp "^[^Δλ\n]*[Δλ] "
                  scroll-margin 0
                  )
            (define-key eshell-mode-map (kbd "<return>") 'user-ret)

            ;; ;; https://github.com/emacs-helm/helm/wiki#wiki-helmeshellcompletion
            ;; (require 'helm-files)
            ;; (define-key eshell-mode-map [remap pcomplete] 'helm-esh-pcomplete)
            ;; (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
            ))


;; Command path environment
;; http://ergoemacs.org/emacs/eshell.html
(setenv "PATH"
        (let ((home-dir (getenv "HOME")))
          (concat
           home-dir "/Scripts" ":"
           home-dir "/Scripts/acm" ":"
           (getenv "PATH"))))

;; (add-hook 'emacs-startup-hook #'(lambda ()
;;                                   (let ((default-directory (getenv "HOME")))
;;                                     (command-execute 'eshell)
;;                                     (bury-buffer))))


;; (C-x C-x) (C-u C-x C-x)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-c C-x") 'eshell)


;; ;; Use `emacs <filename1,[filename2,...]>' command in eshell.
;; ;; http://www.emacswiki.org/emacs/EshellFunctions#toc2
;; (defun eshell/emacs (&rest args)
;;   "Open a file in emacs. Some habits die hard."
;;   (if (null args)
;;       ;; If I just ran "emacs", I probably expect to be launching
;;       ;; Emacs, which is rather silly since I'm already in Emacs.
;;       ;; So just pretend to do what I ask.
;;       (bury-buffer)
;;     ;; We have to expand the file names or else naming a directory in an
;;     ;; argument causes later arguments to be looked for in that directory,
;;     ;; not the starting directory
;;     (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))


;; `C-a' to beginning of line, and `C-a C-a' to beginning of command line.
;; http://www.emacswiki.org/emacs/EshellFunctions#toc6
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))
(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))


;; Delete backup files(*~).
;; http://www.emacswiki.org/emacs/EshellFunctions#toc9
(defun eshell/ro ()
  "Delete files matching pattern \".*~\" and \"*~\""
  (eshell/rm (directory-files "." nil "^\\.?.*~$" nil)))


;; Clear command for eshll.
;; http://www.khngai.com/emacs/eshell.php
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; Completion for git command in eshll.
;; http://www.masteringemacs.org/articles/2012/01/16/pcomplete-context-sensitive-completion-emacs/
(defconst pcmpl-git-commands
  '("add" "bisect" "branch" "checkout" "clone"
    "commit" "diff" "fetch" "grep"
    "init" "log" "merge" "mv" "pull" "push" "rebase"
    "reset" "rm" "show" "status" "tag" )
  "List of `git' commands")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE"
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let ((ref-list))
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
        (add-to-list 'ref-list (match-string 1)))
      ref-list)))

(defun pcomplete/git ()
  "Completion for `git'"
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)  
  ;; complete files/dirs forever if the command is `add' or `rm'
  (cond
   ((pcomplete-match (regexp-opt '("add" "rm")) 1)
    (while (pcomplete-here (pcomplete-entries))))
   ;; provide branch completion for the command `checkout'.
   ((pcomplete-match "checkout" 1)
    (pcomplete-here* (pcmpl-git-get-refs "heads")))))


;; Open image files in eshell.
;; https://github.com/ran9er/init.emacs/blob/master/_extensions/%2Beshell.el
(defun eshell/img(img)
  (propertize "Image" (quote display) (create-image (expand-file-name img))))


;; tests

(defun user-ret ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (progn
          (insert "ls")
          (eshell-send-input))
      (progn
        (cond
         ((string-match "^\\.+$" input)
          (let ((len (length input))(n 2)(p ".."))
            (while (> len n )
              (setq n (1+ n))(setq p (concat p "/..")))
            (eshell-bol)(kill-line)
            (insert p)
            (eshell-send-input)))
         (t
          (eshell-send-input))))
      )))


(provide 'personal-eshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-eshell.el ends here
