(load "syntax.scm")
(load "kotlin.scm")

(kotlin-project "my-project-name")

; (test
;   (case testSum
;     (val expected 42)
;     (call assertEquals expected 42)))

(check)
