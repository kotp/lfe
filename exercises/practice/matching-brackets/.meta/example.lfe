(defmodule matching-brackets
  (export (paired? 1)))

(include-lib "lfe/include/clj.lfe")

(defun paired? (string)
  (paired-helper string '()))

(defun paired-helper
  (('() '())
    'true)
  (('() _)
    'false)
  (((cons #\{ string) stack)
    (paired-helper string (cons #\{ stack)))
  (((cons #\[ string) stack)
    (paired-helper string (cons #\[ stack)))
  (((cons #\( string) stack)
    (paired-helper string (cons #\( stack)))
  (((cons #\} string) (cons #\{ stack))
    (paired-helper string stack))
  (((cons #\] string) (cons #\[ stack))
    (paired-helper string stack))
  (((cons #\) string) (cons #\( stack))
    (paired-helper string stack))
  (((cons #\} _) _)
    'false)
  (((cons #\] _) _)
    'false)
  (((cons #\) _) _)
    'false)
  (((cons _ string) stack)
    (paired-helper string stack)))