(add-tests-with-string-output "fx+1"
  [(fx+1 0) => 1]
  [(fx+1 -1) => 0]
  [(fx+1 1) => 2]
  [(fx+1 -100) => -99]
  [(fx+1 1000) => 1001]
  [(fx+1 536870910) => 536870911]
  [(fx+1 -536870912) => -536870911]
  [(fx+1 (fx+1 0)) => 2]
  [(fx+1 (fx+1 (fx+1 (fx+1 (fx+1 (fx+1 12)))))) => 18])

(add-tests-with-string-output "fixnum->char and char->fixnum"
   [(fixnum->char 65) => #\A]
   [(fixnum->char 97) => #\a]
   [(fixnum->char 122) => #\z]
   [(fixnum->char 90) => #\Z]
   [(fixnum->char 48) => #\0]
   [(fixnum->char 57) => #\9]
   [(char->fixnum #\A) => 65]
   [(char->fixnum #\a) => 97]
   [(char->fixnum #\z) => 122]
   [(char->fixnum #\Z) => 90]
   [(char->fixnum #\0) => 48]
   [(char->fixnum #\9) => 57]
   [(char->fixnum (fixnum->char 12)) => 12]
   [(fixnum->char (char->fixnum #\x)) => #\x])

(add-tests-with-string-output "fixnum?"
   [(fixnum? 0) => #t]
   [(fixnum? 1) => #t]
   [(fixnum? -1) => #t]
   [(fixnum? 37287) => #t]
   [(fixnum? -23873) => #t]
   [(fixnum? 536870911) => #t]
   [(fixnum? -536870912) => #t]
   [(fixnum? #t) => #f]
   [(fixnum? #f) => #f]
   [(fixnum? ()) => #f]
   [(fixnum? #\Q) => #f]
   [(fixnum? (fixnum? 12)) => #f]
   [(fixnum? (fixnum? #f)) => #f]
   [(fixnum? (fixnum? #\A)) => #f]
   [(fixnum? (char->fixnum #\r)) => #t]
   [(fixnum? (fixnum->char 12)) => #f])

(add-tests-with-string-output "fxzero?"
   [(fxzero? 0) => #t]
   [(fxzero? 1) => #f]
   [(fxzero? -1) => #f])

(add-tests-with-string-output "null?"
   [(null? ()) => #t]
   [(null? #f) => #f]
   [(null? #t) => #f]
   [(null? (null? ())) => #f]
   [(null? #\a) => #f]
   [(null? 0) => #f]
   [(null? -10) => #f]
   [(null? 10) => #f])

(add-tests-with-string-output "boolean?"
   [(boolean? #t) => #t]
   [(boolean? #f) => #t]
   [(boolean? 0) => #f]
   [(boolean? 1) => #f]
   [(boolean? -1) => #f]
   [(boolean? ()) => #f]
   [(boolean? #\a) => #f]
   [(boolean? (boolean? 0)) => #t]
   [(boolean? (fixnum? (boolean? 0))) => #t])

(add-tests-with-string-output "char?"
   [(char? #\a) => #t]
   [(char? #\Z) => #t]
   [(char? #\newline) => #t]
   [(char? #t) => #f]
   [(char? #f) => #f]
   [(char? ()) => #f]
   [(char? (char? #t)) => #f]
   [(char? 0) => #f]
   [(char? 23870) => #f]
   [(char? -23789) => #f])

(add-tests-with-string-output "not"
  [(not #t) => #f]
  [(not #f) => #t]
  [(not 15) => #f]
  [(not ()) => #f]
  [(not #\A) => #f]
  [(not (not #t)) => #t]
  [(not (not #f)) => #f]
  [(not (not 15)) => #t]
  [(not (fixnum? 15)) => #f]
  [(not (fixnum? #f)) => #t])
