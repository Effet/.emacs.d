;; for unicode
;;  -> http://ergoemacs.org/emacs/emacs_n_unicode.html
(define-abbrev-table 'global-abbrev-table
  '(("8alpha"  "α")
    ("8beta"   "β")
    ("8gamma"  "γ")
    ("8theta"  "θ")
    ("8inf"    "∞")

    ("8irony"  "⸮")                     ;#x2E2E
    ("8kuu"    "φ")                    ;#x03C6
    ))

(setq save-abbrevs nil)
(abbrev-mode 1)
