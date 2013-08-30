(use-package ack-and-a-half
  :commands (ack-and-a-half
             ack-and-a-half-same
             ack-and-a-half-find-file
             ack-and-a-half-file-file-same)
  :init
  (progn
    (defalias 'ack 'ack-and-a-half)
    (defalias 'ack-same 'ack-and-a-half-same)
    (defalias 'ack-find-file 'ack-and-a-half-find-file)
    (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)))
