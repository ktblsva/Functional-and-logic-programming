;(defun Task1P (l1 l2)
;	(cond
;		((and (null l1) (null l2))
;			t
;		)
;		((member (car l1) l2)		
;			(Task1P (cdr l1) (remove (car l1) l2))
;		)
;		(t
;			nil
;		)	
;	)
;)

;(defun Task4 (l1 l2)
;	(cond
;		((or (null l1) (null l2))
;			'nil
;		)
;		((member (car l1) l2)		
;			(cons (car l1) (Task4 (cdr l1) (remove (car l1) l2)))
;		)
;		(t
;			(Task4 (cdr l1) l2)
;		)	
;	)
;)

(defun EqualA&LP (l1 l2)
	(cond
		((and (atom l1) (atom l2))
			(equal l1 l2)
		)
		((or (and (atom l1) (listp l2)) (and (atom l2) (listp l1)))
			nil
		)
		((or (and (null l1) (not (null l2))) (and (null l2) (not (null l1))))
			nil
		)
		((EqualA&LP (car l1) (car l2))
			(EqualA&LP (cdr l1) (cdr l2))
		)
		(t
			nil
		)
	)
)

(defun MemberP (e l1)
	(cond
		((or (null e) (null l1))
			nil
		)
		((EqualA&LP e (car l1))
			t
		)
		(t
			(MemberP e (cdr l1))
		)
	)
)

(defun RemoveFirst (e l)
	(cond
		((null e)
			nil
		)
		((null l)
			nil
		)
		((EqualA&LP (car l) e)
			(cdr l)
		)
		(t
			(cons (car l) (RemoveFirst e (cdr l)))
		)
	)
)

(defun Task1P (l1 l2)
	(cond
		((and (null l1) (null l2))
			t
		)
		((MemberP (car l1) l2)		
			(Task1P (cdr l1) (RemoveFirst (car l1) l2))
		)
		(t
			nil
		)	
	)
)

(Task1P '(1 1 (2 3 (4 (2))) 5) '(5 (2 3 (4 2)) 1 1))

(defun Task4 (l1 l2)
	(cond
		((or (null l1) (null l2))
			'nil
		)
		((MemberP (car l1) l2)		
			(cons (car l1) (Task4 (cdr l1) (RemoveFirst (car l1) l2)))
		)
		(t
			(Task4 (cdr l1) l2)
		)	
	)
)

(Task4 '(1 2 3 4 4 (5 6 (7))) '(9 8 (5 6 (7)) 4  3 2 1))

(defun Task9(n l d)
	(cond
		((NULL l) 
			nil
		)
		((funcall d (car l)) 
			(append (list  n (car l)) (Task9 n (cdr l) d))
		)
		(t 
			(cons (car l) (Task9 n (cdr l) d))
		)
	)
)

(Task9 '* '(1 0 f -1) #'(lambda (x) (and (numberp x) (>= x 0))))
(Task9 '* '(1 0 4) #'evenp)
(Task9 '* '(1 0 f) #'(lambda (x) (equal x 'f)))