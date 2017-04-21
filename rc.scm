; My Scheme rc file...

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

;(define nil #null)

(require 'printf)
(require 'pretty-print)
(require 'macro)

