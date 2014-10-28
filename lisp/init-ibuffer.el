(use-package ibuffer-vc
  :commands (ibuffer-vc-set-filter-groups-by-vc-root
             ibuffer-do-sort-by-alphabetic)
  :init
  (progn
    (add-hook 'ibuffer-hook
              (lambda ()
                (ibuffer-vc-set-filter-groups-by-vc-root)
                (unless (eq ibuffer-sorting-mode 'alphabetic)
                  (ibuffer-do-sort-by-alphabetic)))))
  )
