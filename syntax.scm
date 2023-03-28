(define-syntax λ
  (syntax-rules ()
    ((λ args ...)
     (lambda args ...))))
