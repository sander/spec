(load "dependencies.scm")

(define value 0)

(define dependency "dependency.scm")
(js-invoke (node-require "fs") "writeFileSync" dependency
  (format "~s"
    '(begin
      (set! value (+ value 1))
      (display "loaded dependency!")
      (newline))))

(load-once "dependency.scm")
(load-once "dependency.scm")

(if (not (= value 2)) (display 'failure))
(newline)

(delete-file dependency)
