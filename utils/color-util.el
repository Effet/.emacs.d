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
