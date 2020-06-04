
;;;********************************************************ͼ�ν�������-jz
(defun c:cc (/ p1 p2 s e cn)
 ;__________________ 
  (defun ttt (ss n / m)
    (setq ee e
	  ns (ssadd)
    )
    (while (setq ee (entnext ee))
      (setq ns (ssadd ee ns))
    )
    (command "erase" ns "")
    (command "copy" ss "" "m" "non" p1)
    (setq m 0)
    (repeat (atoi n)
      (setq m (1+ m))
      (cond
	((= "/" (substr n (strlen n)))
	 (command
	   "non"
	   (mapcar '(lambda (x y) (+ x (* m (/ (- y x) (atof n)))))
		   p1
		   p2
	   )
	 )
	)
	(t
	 (command "non"
		  (mapcar '(lambda (x y) (+ x (* m (- y x)))) p1 p2)
	 )
	)
      )
    )
    (command)
  )
 ;__________________ 
    (princ "\nѡ��Ҫ���Ƶ�����:")
  (setq s (ssget))
  (setq p1 (getpoint "\n���Ƶ����:"))
  (setq p2 (getpoint p1 "\n���Ƶ��յ�:"))
  (setq e (entlast))
  (command "copy" s "" "non" p1 "non" p2)
  (while (/= 0
	     (atof (setq cn (getstring "\n����(�� / ����Ϊ�ȷ�):")))
	 )
    (ttt s cn)
  )
  (princ)
)



(defun c:c1 (/ p1 p2 s e cn a1 d1 ns cnn)
 ;__________________ 
  (defun ttt (ss n / m)
    (setq ee e
	  ns (ssadd)
    )
    (while (setq ee (entnext ee))
      (setq ns (ssadd ee ns))
    )
    (command "erase" ns "")
    (command "copy" ss "" "m" "non" p1)
    (if	(member (substr n (strlen n)) '("/" "*"))
      (progn
	(setq m 0)
	(repeat	(atoi n)
	  (setq m (1+ m))
	  (cond
	    ((= "/" (substr n (strlen n)))
	     (command
	       "non"
	       (mapcar '(lambda (x y) (+ x (* m (/ (- y x) (atof n)))))
		       p1
		       p2
	       )
	     )
	    )
	    ((= "*" (substr n (strlen n)))
	     (command "non"
		      (mapcar '(lambda (x y) (+ x (* m (- y x)))) p1 p2)
	     )
	    )
	  )
	)
      )
      (command "non" (setq p2 (polar p1 a1 (atof n))))
    )
    (command)
  )
 ;__________________ 
  (princ "\nѡ��Ҫ���Ƶ�����:")
  (setq s (ssget))
  (setq p1 (getpoint "\n���Ƶ����:"))
  (command "undo" "be" "line" p1 p1 "")
  (setq e (entlast))
  (command "copy" s "" "non" p1 pause)
  (setq	p2 (getvar "lastpoint")
	a1 (angle p1 p2)
	d1 (distance p1 p2)
  )
  (setq cn "1*")
  (while cn
    (ttt s cn)
    (initget 128)
    (princ
      "\n��������=�����յ�                         ������ֵ=�޸ļ�� "
    )
    (princ
      "\n������ֵn���� / ����=����ڵȷ�n�θ���    ������ֵn���� * ����=����ิ��n�� "
    )
    (setq cnn (getpoint "\n�밴��ʾ����<�˳�>:"))
    (if	(= 'LIST (type cnn))
      (setq p2 cnn
	    a1 (angle p1 p2)
	    d1 (distance p1 p2)
      )
      (setq cn cnn)
    )
  )
  (entdel e)
  (command "undo" "e")
  (princ)
)


(defun c:c2 (/ p1 p2 s e cn)
 ;__________________
  (defun ttt (ss n / m)
    (setq ee e
	  ns (ssadd)
    )
    (while (setq ee (entnext ee))
      (setq ns (ssadd ee ns))
    )
    (command "erase" ns "")
    (command "copy" ss "" "m" "non" p1)
    (setq m 0)
    (repeat (atoi n)
      (setq m (1+ m))
      (cond
	((= "/" (substr n (strlen n)))
	 (command
	   "non"
	   (mapcar '(lambda (x y) (+ x (* m (/ (- y x) (atof n)))))
		   p1
		   p2
	   )
	 )
	)
	(t
	 (command "non"
		  (mapcar '(lambda (x y) (+ x (* m (- y x)))) p1 p2)
	 )
	)
      )
    )
    (command)
  )
 ;__________________
  (princ "\nѡ��Ҫ���Ƶ�����:")
  (setq s (ssget))
  (setq p1 (getpoint "\n���Ƶ����:"))
  (setvar "lastpoint" p1)
					;(setq p2 (getpoint p1 "\n���Ƶ��յ�:"))
  (setq e (entlast))
  (command "copy" s "" "non" p1 pause)
  (if (not (equal p1 (setq p2 (getvar "lastpoint"))))
    (while (/= 0
	       (atof (setq cn (getstring "\n����(�� / ����Ϊ�ȷ�):")))
	   )
      (ttt s cn)
    )
  )
  (princ)
)


;;;|��ǿ����
(defun c:c3 (/ getpt getpt1 ss ptx pty db n x y gtin)
  (setq	getpt1 (acet-ss-drag-move
		 (setq ss (ssget))
		 (setq getpt (getpoint "\n&��ȡ����:"))
		 1
	       )
  )
  (setq	ptx (- (car getpt1) (car getpt))
	pty (- (cadr getpt1) (cadr getpt))
	y   0
  )
  (vl-cmdf ".copy" ss "" getpt getpt1)
  (while (setq gtin (- (getint "\n�ظ�����:") 1))
    (vl-cmdf ".undo" "e")
    (if	(/= y 0)
      (vl-cmdf ".u")
    )
    (setq n  1
	  x  0
	  db nil
    )
    (if	(/= y 0)
      (vl-cmdf ".u")
    )
    (vl-cmdf ".undo" "be")
    (repeat gtin
      (setq db (cons (list (+ (* n ptx) (car getpt1))
			   (+ (* n pty) (cadr getpt1))
			   0.0
		     )
		     db
	       )
      )
      (setq n (1+ n))
    )
    (repeat (length db)
      (vl-cmdf ".copy" ss "" getpt (nth x (reverse db)))
      (setq x (1+ x))
    )
    (vl-cmdf ".undo" "e")
    (vl-cmdf ".undo" "be")
    (setq y (1+ y))
  )
  (princ)
)



