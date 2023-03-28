;tmp
(define (with-output-to-file name cb) '())
(define fs (node-require "fs"))
(define child-process (node-require "child_process"))
(define (system cmd) (js-invoke child-process "execSync" cmd))

(define (kotlin-project name)
  (with-output-to-file "build.gradle.kts"
    (λ ()
      (display "plugins {
    kotlin(\"jvm\") version \"1.8.10\"
}

group = \"nl.sanderdijkhuis\"
version = \"0.1.0-SNAPSHOT\"

kotlin {
    jvmToolchain(17)
}

repositories {
    mavenCentral()
}
")))
  (with-output-to-file "settings.gradle.kts"
    (λ ()
      (display "rootProject.name = \"")
      (display name)
      (display "\"")
      (newline)))
  (with-output-to-file "gradle.properties"
    (λ ()
      (display "kotlin.code.style=official")
      (newline)))
  (system "gradle wrapper"))

;(define-syntax test
;  (syntax-rules ()
;    ((_ cases* ...) (display (quote (list 'cases cases* ...))))))

(define (check)
  (system "./gradlew check"))
