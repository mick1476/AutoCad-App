;;; ������         ����ͬˢ��v2.0
;;; ====================================================================
;;; ���ܣ���Դ����Ϊ���ֻ����ԣ���Ŀ�����֡����ԡ�������������ˢ��ͬ����
;;;       ��Դ����Ϊ�������֣���ˢĿ����������������ͬ��(��֧��������������)
;;;       ��Դ����ΪԲ����Ŀ��Բ��Сˢ��ԴԲ�Ĵ�С��
;;;       ��Դ����Ϊ�飬��Ŀ���ˢ��Դ��һ����
;;;       ��Դ����Ϊ����ߣ���Ŀ���ߡ�Բ��Բ��������ߵ�ˢ��ͬ�߿�
;;;       ��Դ����Ϊ�ߡ��ߴ硢��䡢Բ������Ŀ������ƥ��
;;; ʹ�ã����xts��ѡ��һ��Դ���󣬳����Զ��жϣ���ѡ��
;;; ���ߣ�langjs           qq:59509100         ����:2013��6��
(defun c:xts (/ #errxts $orr buk en1 ent i name name1 snap ss tp ty uu)
  (defun #errxts (s)         ; ���������
    (redraw name 4)
    (setvar "nomutt" 0)
    (setvar "PICKBOX" buk)
    (setvar "osmode" snap)
    (command ".UNDO" "E")
    (setq *error* $orr)
    (princ)
  )
  (setq $orr *error*)
  (setq *error* #errxts)
  (vl-load-com)          ; ������ʼ
  (setvar "cmdecho" 0)
  (command ".UNDO" "BE")
  (setq snap (getvar "osmode"))
  (setvar "osmode" 0)
  (setq buk (getvar "PICKBOX"))
  (setvar "PEDITACCEPT" 1)        ; �������ѡ����ʵ�Դ������ûѡ������ѡ
  (while (not (and
  (setq name1 (nentsel "\nѡ��Դ����:"))
  (setq name (car name1))
  (setq ent (entget name))
  (setq ty (cdr (assoc 0 ent)))
  (member ty '("TEXT" "MTEXT"
    "LWPOLYLINE" "CIRCLE"
    "INSERT" "LINE"
    "ARC" "HATCH"
    "DIMENSION" "ATTRIB"
    "TCH_ARROW" "TCH_TEXT"
    "TCH_DRAWINGNAME" "TCH_MULTILEADER"
    "TCH_ELEVATION"
   )
  )
       )
  )
    (if (= 52 (getvar "errno"))
      (vl-exit-with-error "")
    )
  )           ; ����������һ���жϣ����Դ����ѡ����ǿ飬�Ҳ������Ի��߿������֣�����Ϊѡ����ǿ�
  (if (and
(not (member ty '("TEXT" "MTEXT"
        "ATTRIB"
       )
      )
)
(= (type (car (last name1))) 'ename)
(= (cdr (assoc 0 (entget (car (last name1))))) "INSERT")
      )
    (setq name (car (last name1))
   ent (entget name)
   ty (cdr (assoc 0 ent))
    )
  )
  (redraw name 3)
  (setvar "nomutt" 1)
  (setvar "PICKBOX" (fix (+ 1 (* 1.2 buk))))
  (cond           ; 1�� ���Դ���������֡��������ֻ��߿������ֻ������ԣ���ִ�С�����
    ((member ty '("TEXT" "MTEXT"
       "ATTRIB" "TCH_TEXT"
       "TCH_ARROW" "TCH_DRAWINGNAME"
       "TCH_MULTILEADER" "TCH_ELEVATION"
      )
     )
      (setq uu (cdr (assoc 1 ent)))
      (princ (strcat "\nѡ��Ŀ�����:<������ͬ>  T = " "\"" uu "\""))
      (while t
(setq ss (ssget ":S" '((0 . "TEXT,MTEXT,INSERT,TCH_ARROW,TCH_TEXT,TCH_DRAWINGNAME,TCH_MULTILEADER,TCH_ELEVATION"))))
(if (= (caar (setq name1 (ssnamex ss 0))) 1) ; ���Ŀ�������ǵ�ѡ�������ֻ������Ի���ͨ���֣���ִ�С�����
   (progn
     (setq ent (ssname ss 0)
    en1 (car (nentselp (trans (cadr (last (car name1))) 0 1)))
    tp (cdr (assoc 0 (entget en1)))
     )
     (cond
       ((member tp '("TEXT" "MTEXT"
   "ATTRIB"
         )
        )
  (vla-put-textstring (vlax-ename->vla-object en1) uu)
  (entupd en1)
  (entupd ent)
       )
       ((member tp '("TCH_TEXT" "TCH_ELEVATION"
   "TCH_ARROW"
         )
        )
  (vlax-put-property (vlax-ename->vla-object en1) 'text uu)
       )
       ((= tp "TCH_DRAWINGNAME")
  (vlax-put-property (vlax-ename->vla-object en1) 'nametext uu)
       )
       ((= tp "TCH_MULTILEADER")
  (vlax-put-property (vlax-ename->vla-object en1) 'uptext uu)
       )
     )
   )
   (progn         ; ���Ŀ�����ֶ�ѡ������ͨ���֣���ѭ��������������
     (repeat (setq i (sslength ss))
       (setq ent (entget (setq en1 (ssname ss (setq i (1- i))))))
       (setq tp (cdr (assoc 0 ent)))
       (cond
  ((member tp '("TEXT" "MTEXT"))
    (entmod (subst
       (cons 1 uu)
       (assoc 1 ent)
       ent
     )
    )
  )
  ((member tp '("TCH_TEXT" "TCH_ELEVATION"
     "TCH_ARROW"
    )
   )
    (vlax-put-property (vlax-ename->vla-object en1) 'text uu)
  )
  ((= tp "TCH_DRAWINGNAME")
    (vlax-put-property (vlax-ename->vla-object en1) 'nametext uu)
  )
  ((= tp "TCH_MULTILEADER")
    (vlax-put-property (vlax-ename->vla-object en1) 'uptext uu)
  )
       )
     )
   )
)
      )
    )
    ((member ty '("CIRCLE" "ARC"))     ; 3�� ���Դ������Բ����ѭ������Ŀ��Բ��ֱ��
      (setq uu (cdr (assoc 40 ent)))
      (princ (strcat "\nѡ��Ŀ�����:<�뾶��ͬ>  R = " (rtos uu 2 2)))
      (repeat (setq i (sslength (setq ss (ssget '((0 . "CIRCLE,ARC"))))))
(setq ent (entget (ssname ss (setq i (1- i)))))
(entmod (subst
    (cons 40 uu)
    (assoc 40 ent)
    ent
  )
)
      )
    )
    ((= ty "INSERT")         ; 4�� ���Դ�����ǿ飬�򿽱�Դ�鵽Ŀ����λ�ã�ɾ��Ŀ���
      (princ " \nѡ��Ŀ�����:<����ͬ>")
      (setq uu (cdr (assoc 10 ent)))
      (repeat (setq i (sslength (setq ss (ssget '((0 . "INSERT"))))))
(setq ent (entget (ssname ss (setq i (1- i)))))
(command "COPY" name "" uu (cdr (assoc 10 ent)))
      )
      (command "ERASE" ss "")
    )
    ((= ty "LWPOLYLINE")        ; 5�� ���Դ�����Ƕ����ߣ���ת��Ŀ�������߿�
      (if (not (setq uu (cdr (assoc 43 ent))))
(setq uu (cdr (assoc 40 ent)))
      )
      (princ (strcat "\nѡ��Ŀ�����:<�߿���ͬ>   W = " (rtos uu 2 2)))
      (repeat (setq i (sslength (setq ss (ssget '((0 . "LINE,ARC,POLYLINE,LWPOLYLINE,CIRCLE"))))))
(setq name1 (ssname ss (setq i (1- i)))
       tp (cdr (assoc 0 (setq ent (entget name1))))
)
(cond
   ((member tp '("LINE" "ARC"))
     (command "pedit" name1 "w" uu "x")
   )
   ((member tp '("POLYLINE" "LWPOLYLINE"))
     (command "pedit" name1 "w" uu "x")
   )
   ((= tp "CIRCLE")
     (command "donut" (- (* (cdr (assoc 40 ent)) 2) uu) (+ (* (cdr (assoc 40 ent)) 2) uu) (cdr (assoc 10 ent)) "")
     (entdel name1)
   )
)
      )
    )           ; 6��������һЩ��������������ƥ������
    ((member ty '("LINE" "HATCH"
       "DIMENSION"
      )
     )
      (princ "\nѡ��Ŀ�����:<����ƥ��>")
      (command "matchprop" name (ssget (list (cons 0 ty))) "")
    )
  )
  (redraw name 4)
  (setvar "nomutt" 0)
  (setvar "PICKBOX" buk)
  (setvar "osmode" snap)
  (command ".UNDO" "E")
  (setq *error* $orr)
  (princ)
)