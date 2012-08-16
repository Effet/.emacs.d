;;; personal-completion.el --- Completion Stuffs.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:21:57 2012 (+0800)
;; Last-Updated: Thu Aug 16 16:20:27 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;;{{{ Auto-Complete

;; M-x package-install RET auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (concat dot-emacs-dir "/ac-dict/"))
(ac-config-default)
(global-auto-complete-mode t)

(global-set-key (kbd "TAB") 'ac-start)
(define-key ac-complete-mode-map (kbd "TAB") 'ac-complete)
(define-key ac-complete-mode-map (kbd "RET")  nil)

(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "C-g") 'ac-stop)


;; After selecting candidates, `TAB' will behave as `RET'
(setq ac-dwim t)

;; If nothing to complete, `TAB' is become original.
(ac-set-trigger-key (kbd "TAB"))

(setq ac-auto-start nil)
;; (setq ac-auto-show-menu 0)
;; (setq ac-delay 0)

(setq ac-use-fuzzy t)

(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer
                ac-source-filename))

(add-hook
 'c-mode-common-hook
 '(lambda()
    (setq ac-sources (append
                      '(
                        ac-source-yasnippet
                        ac-source-semantic
                        ac-source-clang
                        )
                      ac-sources))))

;;}}}

;;{{{ YASnippet Setting

;; Use `yasnippet' backend.
;; M-x package-install RET yasnippet
(require 'yasnippet)

;; Modify the variable defined in `yasnippet.el'.
(setq yas-snippet-dirs
      (list personal-snippet-directory
            (when yas--load-file-name
              (concat (file-name-directory yas--load-file-name) "snippets"))))

(yas/global-mode 1)
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (yas/minor-mode)))

;; (setq yas-trigger-key (kbd "TAB"))


;; M-x package-install RET helm
;; (require 'helm)
;; http://emacswiki.org/Yasnippet#toc6
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

;; (setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas/prompt-functions '(shk-yas/helm-prompt))

;;}}}

;;{{{ Clang backend for auto-complete

;; Use `clang' backend.
;; M-x package-install RET auto-complete-clang
(require 'auto-complete-clang)

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/x86_64-pc-linux-gnu
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/backward
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include-fixed
 /usr/include
")))

;;}}}


;;{{{ semantic

(require 'semantic/ia)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
;; (require 'semantic/bovine/clang)
;; (require 'semantic/decorate/include)


;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode))
;; (semantic-mode 1)


;; (global-semantic-highlight-edits-mode (if window-system 1 -1))
;; (global-semantic-show-unmatched-syntax-mode 1)
;; (global-semantic-show-parser-state-mode 1)


;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))


(defconst user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/lib/gcc/mingw32/4.6.2/include"
        "C:/MinGW/lib/gcc/mingw32/4.6.2/include/c++"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;}}}

;;{{{ C/C++ include-files helper

;; http://emacser.com/include_files_helper.htm
;; 输入 inc , 可以自动提示输入文件名称,可以自动补全.
;; Provided by yangyingchao@gmail.com
(mapc
 (lambda (mode)
   (define-abbrev-table mode '(
                               ("inc" "" skeleton-include 1)
                               )))
 '(c-mode-abbrev-table c++-mode-abbrev-table))

(if (eq system-type 'windows-nt)
    (defconst yc/inc-dir-list
      (append (mode-local-value 'c++-mode 'semantic-dependency-system-include-path) '("./")) "nil")
  (defconst yc/inc-dir-list
    (append (semantic-gcc-get-include-paths "c++") '("./")) "nil")
  )

(defvar inc-minibuffer-compl-list nil "nil")

(defun yc/update-minibuffer-complete-table ()
  "Complete minibuffer"
  (interactive)
  (let ((prompt (minibuffer-prompt))
        (comp-part (minibuffer-contents-no-properties)))
    (when (and (string= "Include File:" prompt)
               (> (length comp-part) 0))
      (setq minibuffer-completion-table
            (append minibuffer-completion-table
                    (let ((inc-files nil)
                          (dirname nil)
                          (tmp-name nil))
                      (mapc
                       (lambda (d)
                         (setq dirname (format "%s/%s" d comp-part))
                         (when (file-exists-p dirname)
                           (mapc
                            (lambda (x)
                              (when (not (or (string= "." x)
                                             (string= ".." x)))
                                (setq tmp-name (format "%s/%s" comp-part x))
                                (add-to-list 'inc-files tmp-name)))
                            (directory-files dirname))))
                       yc/inc-dir-list)
                      inc-files)))))
  (insert "/"))
 
(let ((map minibuffer-local-completion-map))
  (define-key map "/" 'yc/update-minibuffer-complete-table))
 
(defun yc/update-inc-marks ( )
  "description"
    (let ((statement (buffer-substring-no-properties
                      (point-at-bol) (point-at-eol)))
          (inc-file nil)
          (to-begin nil)
          (to-end nil)
          (yc/re-include
           (rx "#include" (+ ascii) "|XXX|" (group (+ ascii)) "|XXX|")))
      (when (string-match yc/re-include statement)
        (setq inc-file (match-string 1 statement))
        (if (file-exists-p (format "./%s" inc-file))
            (setq to-begin "\"" to-end "\"")
          (setq to-begin "<" to-end ">")
          )
        (move-beginning-of-line 1)
        (kill-line)
        (insert (format "#include %s%s%s" to-begin inc-file to-end))
        (move-end-of-line 1))))
 
(define-skeleton skeleton-include
  "generate include<>" ""
  > "#include |XXX|"
  (completing-read
   "Include File:"
   (mapcar
    (lambda (f) (list f ))
    (apply
     'append
     (mapcar
      (lambda (dir)
        (directory-files
         dir nil
         "\\(\\.h\\)?"))
      yc/inc-dir-list))))
  "|XXX|"
  (yc/update-inc-marks))

;;}}}



(provide 'personal-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-completion.el ends here
