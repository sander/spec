; (define-syntax λ
;   (syntax-rules ()
;     ((λ args ...)
;      (lambda args ...))))

(define-macro λ
  (lambda (args . body)
    `(lambda ,args ,@body)))
