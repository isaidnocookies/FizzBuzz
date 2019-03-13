#lang racket

(define (fizzbuzz start finish)
  (if (equal? start finish)
      (printFizzBuzzString start)
      (begin (printFizzBuzzString start)
             (fizzbuzz (+ 1 start) finish))))


(define (printFizzBuzzString value)
  (if (and (equal? (modulo value 3) 0)
             (equal? (modulo value 5) 0))
        (print "FizzBuzz")
        (if (equal? (modulo value 3) 0)
              (println "Fizz")
              (if (equal? (modulo value 5) 0)
                    (println "Buzz")
                    (println value)))))

(fizzbuzz -50 50)
