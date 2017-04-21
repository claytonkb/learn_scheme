; Hello world as a variable
;(define vhello "Hello world")
;
;; Hello world as a function
;(define fhello (lambda ()
;		 "Hello world"))
;
;;(write vhello)
;
;(write (fhello))

; (write (read))

;(define fourteen 14)
;(write fourteen)

;(define triple 
;  (lambda (x)
;    (list x x x)))
;(write (triple 3))

;(define (four-times x) (* 4 x)) 
;(write (four-times 3))

;(define cube
;  (lambda (x)
;    (* x x x)))
;(write (cube 3))

;(define (fee age)
;  (cond
;   ((or (<= age 3) (>= age 65))    0)
;   ((<= 4 age 6)                   0.5)
;   ((<= 7 age 12)                  1.0)
;   ((<= 13 age 15)                 1.5)
;   ((<= 16 age 18)                 1.8)
;   (else                           2.0)))
;(write (fee 14))

;(define abs
;  (lambda (x)
;    (if (< x 0) (- 0 x) x)))
;(write (abs -17))

;(define if-tester 
;  (lambda (x)
;    (if x "I'm True!" "I'm False!")))
;(write (if-tester #f))

;(define min
;  (lambda (a b)
;    (if (< a b) a b)))
;(write (min 10 7))

;(define shorter
;  (lambda (a b)
;    (if (< (length a) (length b)) a b)))
;(write (shorter (list 1 2 3) (list 4 5)))

;(write (atom? (quote ())))

;(define (type-tester obj)
;  (cond
;   ((symbol?    obj) "symbol")
;   ((port?      obj) "port")
;   ((boolean?   obj) "boolean")
;   ((null?      obj) "null")
;   ((procedure? obj) "procedure")
;   ((vector?    obj) "vector")
;   ((char?      obj) "char")
;   ((pair?      obj) "pair")
;   ((string?    obj) "string")
;   ((char?      obj) "char")
;   (else            "unknown")))
;(write (type-tester "Hello"))

;(define foo 17)
;(write 'foo)
;(write (quote foo))
;(write foo)

;(write (atom? '*abc$))
;(write (list? '(*abc$)))

;(printf "Hello, world\n")

;(pretty-print *catalog*)

;; let, set!
;(let ((x 17))
;  (set! x 42)
;  (write x))

;(define x 'a)
;  (write (list x x))

;(let ((x 'b))
;  (write (list x x)))

;(let ((let 'let)) 
;  (write let))

;(define f
;  (lambda (x)
;    (g x)))
;(define g
;  (lambda (x)
;    (+ x x)))
;(write (f 3))

;(write (lambda (x) (+ x 3)))

;(write ((lambda (x) (+ x 3)) 7))

;(write ((lambda (x y) (* x (+ x y))) 7 13))

;(write ((lambda (f x) (f x x)) + 11))

;(write ((lambda () (+ 3 4))))

;(write 
;  ((lambda (x . y) (list x y)) 
;   28 37))
;(newline)
;(write 
;  ((lambda (x . y) (list x y))
;   28 37 47 28))
;(newline)
;(write 
;  ((lambda (x y . z) (list x y z))
;   1 2 3 4))
;(newline)
;(write 
;  ((lambda x x) 7 13))
;(newline)

;syntax: (let ((var val) ...) exp1 exp2 ...) 
;returns: the value of the final expression
;
;let establishes local variable bindings. Each variable var is bound to the
;value of the corresponding expression val. The body of the let, in which the
;variables are bound, is the sequence of expressions exp1 exp2 ....
;
;The forms let, let*, and letrec are similar but serve slightly different
;purposes. With let, in contrast with let* and letrec, the expressions val ...
;are all outside the scope of the variables var .... Also, in contrast with
;let*, no ordering is implied for the evaluation of the expressions val ....
;They may be evaluated from left to right, from right to left, or in any other
;order at the discretion of the implementation.  Use let whenever the values are
;independent of the variables and the order of evaluation is unimportant.
;
;The body of a let expression may begin with a sequence of definitions, which
;establish bindings local to the body of the let.

;(write 
;  (let ((x (* 3.0 3.0)) (y (* 4.0 4.0)))
;    (sqrt (+ x y))))
;(newline)
;(write
;  (let ((x 'a) (y '(b c)))
;    (cons x y)))
;(newline)
;(write
;  (let ((x 0) (y 1))
;    (let ((x y) (y x))
;      (list x y))))
;(newline)

;let* is similar to let except that the expressions val ... are evaluated in
;sequence from left to right, and each of these expressions is within the scope
;of the variables to the left. Use let* when there is a linear dependency among
;the values or when the order of evaluation is important.
;
;Any let* expression may be converted to a set of nested let expressions. 

;(write
;  (let* ((x (* 5.0 5.0))
;       (y (- x (* 4.0 4.0))))
;  (sqrt y)))
;(newline)
;(write
;  (let ((x 0) (y 1))
;    (let* ((x y) (y x))
;      (list x y))))
;(newline)

;letrec is similar to let and let*, except that all of the expressions val ...
;are within the scope of all of the variables var .... letrec allows the
;definition of mutually recursive procedures.
;
;The order of evaluation of the expressions val ... is unspecified, so it is an 
;error to reference any of the variables bound by the letrec expression before 
;all of the values have been computed. (Occurrence of a variable within a 
;lambda expression does not count as a reference, unless the resulting procedure 
;is applied before all of the values have been computed.)
;
;Choose letrec over let or let* when there is a circular dependency among the
;variables and their values and when the order of evaluation is unimportant.
;
;A letrec expression of the form
;
;(letrec ((var val) ...) body)
;
;may be expressed in terms of let and set! as
;
;(let ((var #f) ...)
;  (let ((temp val) ...)
;    (set! var temp) ...
;    (let () body)))
;
;where temp ... are unique variables, one for each (var val) pair. The outer let
;expression establishes the variable bindings. The initial value given each
;variable is unimportant, so any value suffices in place of #f. The bindings are
;established first so that the values may contain occurrences of the variables,
;i.e., so that the values are computed within the scope of the variables. The
;middle let evaluates the values and binds them to the temporary variables, and
;the set! expressions assign each variable to the corresponding value. The inner
;let is present in case body contains internal definitions.
;
;This transformation does not enforce the restriction that the values must not
;directly reference one of the variables.

;(write
;  (letrec ((sum (lambda (x)
;    (if (zero? x)
;      0
;      (+ x (sum (- x 1)))))))
;  (sum 5)))

;(write (let ((x 3) (y 4))
;  (set! x 5)
;  (+ x y)))
;(newline)
;(define f
;  (lambda (x y)
;    (cons x y)))
;(write (f 'a 'b))
;(newline)
;(set! f
;  (lambda (x y)
;    (cons y x)))
;(write (f 'a 'b))
;(newline)

;;; MACROS
;(defmacro foo ()
;  (list '+ 1 2))
;(write (foo))

;(defmacro foo (x)
;  (list '+ 1 x))
;(write (foo 7))

; To create a macro:
;   First, write out what you want the final result to be
;   Then, put (list ...) around it
;   Quote the operators, etc.
;   Wrap it in (defmacro <name> (arg-list) ... )
;   Tada!

;(write 
;  (map + '(1 2 3) '(4 5 6)))
;(newline)
;(write 
;  (map (lambda (x) (* x x)) '(1 2 3)))
;(newline)

;(printf "Hello, world %d\n" 10)

(define (summer x)
  (if (null? x)
    0
    (+ (car x) (summer (cdr x)))))
(write (summer (list 1 2 3 4)))





















