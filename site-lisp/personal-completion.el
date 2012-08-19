;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-completion.el --- Completion Stuffs.
;; 
;; Author: Catl Sing
;; Mail: nesuadark@gmail.com
;; 
;; Created: Tue Aug 14 20:21:57 2012 (+0800)
;; Last-Updated: Sat Aug 18 22:12:33 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;;{{{ Auto-Complete

;; M-x package-install RET auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
;; (ac-config-default)

;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "C-g") 'ac-stop)


;; After selecting candidates, `TAB' will behave as `RET'
(setq ac-dwim t)

;; If nothing to complete, `TAB' is become original.
;; (ac-set-trigger-key (kbd "TAB"))
;; (setq ac-trigger-key (kbd "<tab>"))
;; (ac-set-trigger-key "TAB")


(setq ac-auto-start nil)
;; (ac-show-menu-immediately-on-auto-complete t)
;; (setq ac-auto-show-menu 0)
;; (setq ac-delay 0)

(setq ac-use-fuzzy t)


(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer
                ac-source-filename))


;; TODO: need update.
(require 'yasnippet)

(defvar yas-candidates nil)

(defun init-yas-candidates ()
  (let ((table (yas--get-snippet-tables)))
    (if table
        (let (candidates (list))
          (mapcar (lambda (mode)
                    (maphash (lambda (key value)
                               (push key candidates))
                             (yas--table-hash mode)))
                  table)
          (setq yas-candidates candidates)))))


(defvar ac-new-yas-source
  '(	(init . init-yas-candidates)
		(candidates . yas-candidates)
		(action . yas/expand)
		(symbol . "y")))


(add-hook
 'c-mode-common-hook
 '(lambda()
    (setq ac-sources (append
                      '(
                        ac-new-yas-source
                        ;; ac-source-yasnippet
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


;; (setq yas-trigger-key "tab")
;; (setq yas/trigger-key (kbd "<f4>"))


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

;; (setq ac-clang-flags
;;       (mapcar (lambda (item) (concat "-I" item))
;;               (split-string
;;                "
;;  /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4
;;  /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/x86_64-pc-linux-gnu
;;  /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/backward
;;  /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include
;;  /usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include-fixed
;;  /usr/include
;; ")))

(require 'semantic/ia)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
              (semantic-gcc-get-include-paths "c++")))

;;}}}


;;{{{ semantic

(require 'semantic/ia)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
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

;; (defconst yc/inc-dir-list
;;   (append (mode-local-value 'c++-mode 'semantic-dependency-system-include-path) '("./")) "nil")

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
 
(defun yc/update-inc-marks ()
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


;;{{{ Hippie Expand

(global-set-key (kbd "M-/") 'hippie-expand)

(defun he-tag-beg ()
  (let ((p
         (save-excursion 
           (backward-word 1)
           (point))))
    p))

(defun try-expand-tag (old)
  (unless  old
    (he-init-string (he-tag-beg) (point))
    (setq he-expand-list (sort
                          (all-completions he-search-string 'tags-complete-tag) 'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))

(setq hippie-expand-try-functions-list
      '(try-expand-all-abbrevs try-expand-dabbrev
                               try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
                               try-complete-lisp-symbol-partially try-complete-lisp-symbol
                               try-complete-file-name-partially try-complete-file-name try-expand-tag))

;; (global-set-key (kbd "TAB") 'hippie-expand)
(setq hippie-expand-try-functions-list (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))

;;}}}




;; https://github.com/purcell/emacs.d/blob/master/init-auto-complete.el
(setq tab-always-indent 'complete)  ;; use 'complete when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

(setq completion-at-point-functions '(auto-complete))

;; (add-to-list 'completion-at-point-functions 'semantic-completion-at-point-function)


;; http://www.emacswiki.org/cgi-bin/wiki/TabCompletion
;; http://emacsblog.org/2007/03/12/tab-completion-everywhere/
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      ;; (dabbrev-expand arg)
      (complete-symbol arg)
    (indent-according-to-mode)))

(defun indent-or-expand-2 (arg)
  (interactive "*P")
  (if (looking-at "[^ ] ")
  ;; (if (looking-at "\\>")
      (complete-symbol arg)
    (indent-for-tab-command)
    (indent-according-to-mode)
    ))

;; (global-set-key (kbd "TAB") 'indent-or-expand-2)


(global-set-key (kbd "TAB") 'complete-symbol)
(global-set-key (kbd "<M-tab>") 'indent-for-tab-command)

(setq completion-cycle-threshold 5)
(add-to-list 'completion-styles 'substring)

(provide 'personal-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-completion.el ends here
