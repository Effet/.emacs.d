;;;; Autoload defuns
(defvar defuns-dir (expand-file-name "defuns" user-emacs-directory))
(add-hook 'load-path defuns-dir)

(defvar defuns-autoload-file
  (expand-file-name "loaddefs.el" defuns-dir))

(defun update-defuns-autoload-file ()
  (interactive)
  (let ((generated-autoload-file defuns-autoload-file))
    (update-directory-autoloads defuns-dir)))

(add-hook 'kill-emacs-hook 'update-defuns-autoload-file)

(unless (file-exists-p defuns-autoload-file)
  (update-defuns-autoload-file))

;; loaddefs.el
(load-file defuns-autoload-file)
