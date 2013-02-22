;; http://stackoverflow.com/questions/1242352/get-font-face-under-cursor-in-emacs
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun auto-change-cursor ()
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" (face-attribute face :foreground)))
    (if face (set-cursor-color (face-attribute face :foreground)))
    ))

;; (set-cursor-color
;;  (face-attribute face :foreground))

(add-hook 'post-command-hook 'auto-change-cursor)

;; (set-cursor-color "#dddddd")

;; (defun auto-change-cursor ()
;;   "change cursor color according to font-lock."
;;   (set-cursor-color (what-face)))

;; (add-hook 'post-command-hook 'auto-change-cursor)


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

(provide 'test)
