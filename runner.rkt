#lang racket/load

(define (playn a b n)
	(foldr 
		(lambda (i prev)
			(match (cons prev (play a b))
				[(cons (cons olda oldb) (cons newa newb))
					(cons (+ olda newa) (+ oldb newb))]))
		(cons 0 0)
		(build-list  n identity)))
		

(define (sumcons a b)
	(match (cons a b)
		[(cons (cons x y) (cons z w)) (cons (+ x z) (+ y w))]))

(define (play a b)
	(load a)
	(define agent-a (create))
	(load b)
	(define agent-b (create))
	(match (cons (agent-a b) (agent-b a))
		[(cons 'coop 'coop) (cons 1 1)]
		[(cons 'coop 'defect) (cons 10 0)]
		[(cons 'defect 'coop) (cons 0 10)]
		[(cons 'defect 'defect) (cons 5 5)]
		[_ (error "Agent produced non standard response")]))


(define r (playn "players/jesus.rkt" "players/luc.rkt" 100))

(display r)
