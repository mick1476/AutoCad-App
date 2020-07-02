;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;���������ֶ���[����/�м�/����]TableMulAlign
;;v1.0 ������� by woyb 20131212
;;v1.1 �Ż������жϵĴ��룬�������ĵ�yֵ���ڿ��y2ֵʱ��������ǰ�����ж� by woyb 20131215
(defun c:BGWZDQ (/ txtss ty lst lst1 lst2 lsti len 
				txt txtpt n i leni pxi pyi txtent pt0
				box pts pt1 pt2 px1 py1 px2 py2
			)
	(vl-load-com)
	(princ "\nѡ��Ҫ������ı�����: ")
	(setq txtss (ssget '((0 . "TEXT"))))
	(initget "s d f")
	(setq ty (getkword "\n����[s]/�м�[d]/����[f]: <d>"))
	(if (not ty) (setq ty "d"))
	(WYB-undob)
	;��������
	(setq lst '() lst1 '() lst2 '() lsti '())
	(setq len (sslength txtss));��������
	(repeat (setq n len)
		(setq txt (ssname txtss (setq n (1- n))))
		(setq txtpt (WYB-GetBoxCenter txt))
		(setq lst1 (cons (list txtpt txt) lst1))
	)
	(setq lst1
		(vl-sort lst1
			(function
				(lambda
					(e1 e2) 
					(< (cadr (car e1)) (cadr (car e2)))
				)
			)
		)
	)
	(setq leni 0) ;���ּ���
	;�����ж�
	(while (/= leni len)
		(setq txt (cadr (car lst1)));�׸�������
		(setq txtpt (car (car lst1)))
		(setq lst1 (cdr lst1))
		(vl-cmdf "boundary" "a" "o" "p" "" txtpt "")
		(setq box (entlast));����
		(setq pts (WYB-GetBox box))
		(entdel box)
		(setq pt1 (car pts) pt2 (cadr pts));����ĵ�����
		(setq px1 (car pt1) py1 (cadr pt1))
		(setq px2 (car pt2) py2 (cadr pt2))
		(setq lsti (cons (list px1 py1 px2 py2) lsti)) ;�������빲����
		(setq lsti (cons txt lsti)) ;�����빲����
		(setq leni (1+ leni))
		(while (/= lst1 nil)
			(setq txt (cadr (car lst1)));�ڶ���������
			(setq txtpt (car (car lst1)))
			(setq pxi (car txtpt) pyi (cadr txtpt));�������ĵ�����
			(if (< pyi py2)
				(progn ;y����
					(if (< px1 pxi px2)
						(progn ;�����빲����
							(setq lsti (cons txt lsti))
							(setq leni (1+ leni))
						)
						(setq lst2 (cons (list txtpt txt) lst2)) ;����������ʱ��
					)
					(setq lst1 (cdr lst1))
				)
				(progn
					(setq lst1 (reverse lst1))
					(setq lst2 (append lst1 lst2))
					(setq lst1 '())
				)
			)
		)
		(setq lsti (reverse lsti))
		(setq lst2 (reverse lst2))
		(setq lst (cons lsti lst)) ;���������кϼ�
		(setq lst1 lst2) ;�ǹ��������з���
		(setq lst2 '())
		(setq lsti '())
	)
	(repeat (length lst) ;�м���ѭ��
		(setq lsti (car lst))
		(setq lst (cdr lst))
		(setq pts (car lsti))
		(setq lsti (cdr lsti))
		(setq px1 (nth 0 pts) py1 (nth 1 pts))
		(setq px2 (nth 2 pts) py2 (nth 3 pts))
		(setq n (length lsti) i 0)
		(setq py (/ (- py2 py1) n))
		(repeat n ;������ѭ��
			(setq tx (car lsti))
			(setq lsti (cdr lsti))
			(setq txtent (entget tx))
			(cond
				((= ty "s");����
					(progn
						(setq txtent (subst (cons 72 0) (assoc 72 txtent) txtent))
						(setq txtent (subst (cons 73 2) (assoc 73 txtent) txtent))
						(setq pt0 (list (+ px1 1) (+ (* py (+ i 0.5)) py1) 0))
						(setq i (1+ i))
						(setq txtent (subst (cons 11 pt0) (assoc 11 txtent) txtent))
					)
				)
				((= ty "d");�м�
					(progn
						(setq txtent (subst (cons 72 4) (assoc 72 txtent) txtent))
						(setq txtent (subst (cons 73 0) (assoc 73 txtent) txtent))
						(setq pt0 (list (* (+ px1 px2) 0.5) (+ (* py (+ i 0.5)) py1) 0))
						(setq i (1+ i))
						(setq txtent (subst (cons 11 pt0) (assoc 11 txtent) txtent))
					)
				)
				((= ty "f");����
					(progn
						(setq txtent (subst (cons 72 2) (assoc 72 txtent) txtent))
						(setq txtent (subst (cons 73 2) (assoc 73 txtent) txtent))
						(setq pt0 (list (- px2 1) (+ (* py (+ i 0.5)) py1) 0))
						(setq i (1+ i))
						(setq txtent (subst (cons 11 pt0) (assoc 11 txtent) txtent))
					)
				)
			)
			(entmod txtent)
		)
	)
	(WYB-undoe)
	(princ "\n�������")
	(princ)
)


;;;;;;;;;;;;;;;;;;;;
;; ��ȡ�������е�
;;(WYB-GetBoxCenter ����)
(defun WYB-GetBoxCenter (e / obj minpoint maxpoint)
    (if (= 'ENAME (type e))
        (setq obj (vlax-ename->vla-object e)) ;ת��ͼԪ��
        (setq obj e)
    )
    (vla-GetBoundingBox obj 'minpoint 'maxpoint) ;ȡ�ð���ͼԪ���������С��
    (setq minpoint (vlax-safearray->list minpoint)) ;�ѱ�������ת��Ϊ��
    (setq maxpoint (vlax-safearray->list maxpoint)) ;�ѱ�������ת��Ϊ��
    (setq p (mapcar '+ minpoint maxpoint))
    (mapcar '(lambda (x) (* 0.5 x)) p)
)
;;;;;;;;;;;;;;;;;;;;
;;ȡ�ö�������ο�
;;By Longxin ����ͨ�� 2005.06
;;(WYB-GetBox ����)
;;����: ((x1 y1 z1)_min (x2 y2 z2)_max)
(defun WYB-GetBox (e / obj minpoint maxpoint)
    (if (= 'ENAME (type e))
        (setq obj (vlax-ename->vla-object e)) ;ת��ͼԪ��
        (setq obj e)
    )
    (vla-GetBoundingBox obj 'minpoint 'maxpoint) ;ȡ�ð���ͼԪ���������С��
    (setq minpoint (vlax-safearray->list minpoint)) ;�ѱ�������ת��Ϊ��
    (setq maxpoint (vlax-safearray->list maxpoint)) ;�ѱ�������ת��Ϊ��
    (setq obj (list minpoint maxpoint))
)
;;;;;;;;;;;;;;;;;;;;
;;��������Ӧ����ʼundo
;;(WYB-undob)
(defun WYB-undob()
    (setvar "cmdecho" 0)
    (command ".undo" "be")
)
;;;;;;;;;;;;;;;;;;;;
;;����������Ӧ������undo
;;(WYB-undoe)
(defun WYB-undoe()
    (command ".undo" "e")
    (setvar "cmdecho" 1)
)