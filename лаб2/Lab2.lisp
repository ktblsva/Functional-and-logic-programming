(defun Task1(n l)
	(cond
		((NULL l) 
			nil
		)
		((NUMBERP (car l)) 
			(cond 
				((>= (car l) 0) (cons (list (car l) n) (Task1 n (cdr l))))
				(t (cons (car l) (Task1 n (cdr l))))
			)
		)
		(t 
			(cons (car l) (Task1 n (cdr l)))
		)
	)
)

(Task1 '* '(1 -6 f a (f -1) -12 53 0)) 

(defun Task11(l1 l2)
	(cond
		((and (NULL l1) (NULL L2))
			nil
		)
		((NUll l1) 
			(cons (car l2) (Task11 l1 (cdr l2)))
		)
		(t 
			(cons (car l1) (Task11 l2 (cdr l1)))
		)
	)
)

(Task11 '(1 3 5) '(2 4 6))

(defun Task21(l)
	(cond
		((NULL l)
			nil
		)
		((NULL (cdr l))
			(cons (car l) nil)
		)
		(t
			(cons (+ (car l) (car (last l))) (Task21 (butlast (cdr l))))
		)	
	)
)

(Task21 '(1 2 3 4 5 6 7 8 9))