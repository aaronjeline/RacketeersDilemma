#lang racket

(provide readdb writedb lookup)

(define (readdb name)
	(define dbname (string-append name ".db"))
	(if (file-exists? dbname)
		(read (open-input-file dbname))
		'()))

(define (lookup name db)
	(match (assoc name db)
		[(cons _ res) res]
		[_ #f]))

(define (writedb name contents)
	(define dbname (string-append name ".db"))
	(write contents (open-output-file dbname)))
