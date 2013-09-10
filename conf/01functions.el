;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L95
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


;; https://github.com/biern/.emacs.d/blob/master/conf-fullscreen.el#L1
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))


;; http://yesybl.org/blogen/?p=25
(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L20-#L27
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode -1)))


(defun ido-choose-from-recentf ()
  "Use ido to select a recently visited file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el#L150
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))


(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (save-excursion
    (if (region-active-p)
        (duplicate-region arg)
      (duplicate-current-line arg))))

(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (goto-char start)
    (dotimes (i num)
      (insert region))))

(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol))))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L29-32
(defun open-line-and-indent ()
  (interactive)
  (newline-and-indent)
  (end-of-line 0))

;; https://github.com/magnars/.emacs.d/blob/master/defuns/editing-defuns.el#L3-34
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun new-line-in-between ()
  (interactive)
  (newline)
  (save-excursion
    (newline)
    (indent-for-tab-command))
  (indent-for-tab-command))

(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{") (looking-at "}"))
                             (and (looking-back ">") (looking-at "<"))
                             (and (looking-back "\\[") (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))


(defun copy-whole-line (&optional arg)
  (interactive "p")
  (or arg (setq arg 1))
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (1+ arg)))
  (if (> arg 1)
      (message "%d lines copied" arg)))

(defun copy-region-or-whole-line (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-whole-line arg)))

(defun kill-region-or-to-beginning-of-line ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (save-excursion (beginning-of-line) (point))
                 (point))))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/editing-defuns.el#L198-202
(defun kill-and-retry-line ()
  "Kill the entire current line and reposition point at indentation"
  (interactive)
  (back-to-indentation)
  (kill-line))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/editing-defuns.el#L204-209
(defun camelize-buffer ()
  (interactive)
  (goto-char 0)
  (ignore-errors
    (replace-next-underscore-with-camel 0))
  (goto-char 0))


(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))


;; http://www.masteringemacs.org/articles/2011/12/15/find-nearest-colors-emacs-24/
(defun find-nearest-color (color &optional use-hsv)
  "Finds the nearest color by RGB distance to `color'.
If called with a universal argument (or if `use-hsv' is set) use HSV instead of RGB.
Runs \\[list-colors-display] after setting `list-colors-sort'"
  (interactive "sColor: \nP")
  (let ((list-colors-sort `(,(if (or use-hsv current-prefix-arg)
                                 'hsv-dist
                               'rgb-dist) . ,color)))
    (if (color-defined-p color)
        (list-colors-display)
      (error "The color \"%s\" does not exist." color))))

(defun find-nearest-color-at-point (pt)
  "Finds the nearest color at point `pt'.
If called interactively, `pt' is the value immediately under `point'."
  (interactive "d")
  (find-nearest-color (with-syntax-table (copy-syntax-table (syntax-table))
                        ;; turn `#' into a word constituent to help
                        ;; `thing-at-point' find HTML color codes.
                        (modify-syntax-entry ?# "w")
                        (thing-at-point 'word))))


;; http://stackoverflow.com/questions/1242352/get-font-face-under-cursor-in-emacs
(defun what-face (pos)
  (interactive "d")
  (message "%s"
           (or (get-char-property (point) 'read-face-name)
               (get-char-property (point) 'face)
               'default)))


(defun get-foreground-of-face (face)
  (if (or (null face)
          (equal face 'unspecified))
      (setq face 'default))
  (let ((color (face-attribute face :foreground)))
    (if (equal color 'unspecified)
        (get-foreground-of-face (face-attribute face :inherit))
      color)))

(defun auto-change-cursor ()
  "Auto change the cursor color adjust to under text.
Like the way of KDE's KWrite/Kate."
  (interactive "d")
  (let ((face (or (get-char-property (point) 'face)
                  'default)))
    (let ((color (get-foreground-of-face face)))
      (set-cursor-color color))))


(defun term16-colors ()
  "Use ansi-term-color-vector to generate
Xresoures' 16-color."
  (let ((list (cdr (mapcar #'(lambda (face)
                               (cons (face-foreground face)
                                     (face-background face)))
                           ansi-term-color-vector))))
    (append (mapcar 'car list) (mapcar 'cdr list))))


(defun assign-keys (keys cmd)
  "Map multi-keys to one command."
  (mapc #'(lambda (key)
            (global-set-key (kbd key) cmd))
        keys))


;; http://www.emacswiki.org/emacs/IncrementNumber
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))


;; -> http://www.emacswiki.org/emacs/InteractivelyDoThings#toc17
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                              (if (buffer-live-p buf)
                                  (with-current-buffer buf
                                    default-directory)
                                default-directory))))
     (ido-find-file-in-dir default-directory))))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/file-defuns.el#L03-31
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el#L22-35
(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    ))


;; https://github.com/magnars/.emacs.d/blob/master/defuns/misc-defuns.el#L108-L124
(defun region-as-string ()
  (buffer-substring (region-beginning)
                    (region-end)))

(defun isearch-forward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-forward))

(defun isearch-backward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-backward))


;;; Font Function
;; http://www.emacswiki.org/emacs/SetFonts#toc9
;; Assign an available font
(require 'dash)
(defun font-candidate (&rest fonts)
  "Return the first available font."
  (--first (find-font (font-spec :name it)) fonts))
