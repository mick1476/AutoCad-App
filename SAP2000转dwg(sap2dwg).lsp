;;;sap.lsp v0.6  by nixnauy@gmail.com 20130715
;;;��ȡs2k�ļ�����autocad�л��ƽڵ�͸˼��������ϸ��Ա��

(defun xx(s1)  ;;;�ÿո��һ���ַ���s1�ֳɶ���ַ����������������b1,���ַ����еġ�=���滻�ɿո�
   (setq n (strlen s1))
   (setq s2 "" b1 '() i 1)
   (while (<= i n)
     (setq a (substr s1 i 1))
     (cond ((= a " ")  (if (/= s2 "")(setq b1 (cons s2 b1) s2 "")));;;���a�ǿո���s2���������b1
           (T (setq s2 (strcat s2 (if (= a "=")(setq a " ")(setq b a)))))   
     )
     (setq i (+ i 1))
   )
   (setq b1 (cons s2 b1))
);;; end defun xx

(defun zz (s1) ;;;��xx������s1����ַ�����Ȼ�󽫱��е�ÿ���ַ����ٱ�ɱ�
  (setq b2 '())
  (foreach a (xx s1)(setq b2 (cons (reverse (xx a)) b2)))
)


(defun C:sap ()
 (setq joints-list '() frames-list '())
 (setq f1 (open (getfiled "file" "" "s2k" 8) "r"));;;�򿪴������SAP�ļ���
   (while   (setq r1 (read-line f1))  ;;;���ļ�ĩβʱ�˳�;
      
    (if (wcmatch r1 "*JOINT COORDINATES*")   ;;;����ǽڵ�����
        (while (> (strlen (setq r2 (read-line f1))) 2) ;;;�ǿ��������;
            (setq r3 (zz r2) 
                  id (atoi (cadr (assoc "Joint" r3)))
                  x1 (atof (cadr (assoc "GlobalX" r3)))
                  y1 (atof (cadr (assoc "GlobalY" r3)))
                  z1 (atof (cadr (assoc "GlobalZ" r3)))
                  p1 (list x1 y1 z1)
             )
            (setq joints-list (cons (cons id p1) joints-list))     ;;;���ɽڵ��ܱ�
               (command "color" "red")
               (command "point" p1)
               (command "text" p1 "10" "0" id) ;;;д�ڵ��
         );;; end while 
     );;; end if
    (setq joints-list (reverse joints-list))
          
    (if (wcmatch r1 "*CONNECTIVITY - FRAME*")   ;;;����Ǹ˼�����
         (while (> (strlen (setq r2 (read-line f1))) 2) ;;;������ǿ���;
             (setq r3 (zz r2)
                   fid (atoi (cadr (assoc "Frame" r3)))
                   iid (atoi (cadr (assoc "JointI" r3)))
                   jid (atoi (cadr (assoc "JointJ" r3)))
                   i1 (cdr (assoc iid joints-list))  ;;;�˼�ʼ������
                   j1 (cdr (assoc jid joints-list))  ;;;�˼�ĩ������
                   x1 (atof (cadr (assoc "CentroidX" r3)))
                   y1 (atof (cadr (assoc "CentroidY" r3)))
                   z1 (atof (cadr (assoc "CentroidZ" r3)))
                   p2 (list x1 y1 z1) ;;;�˼����ĵ�����
              )
            (setq frames-list (cons (list fid iid jid) frames-list))     ;;;���ɸ˼��ܱ�
                (command "color" "green")
                (command "line" i1 j1 "")
                (command "text" p2 "10" (* (/ 180 3.14)(angle i1 j1)) fid) ;;;д�˼���
          );;; end while 
     );;;end if
    (setq frames-list (reverse frames-list))
   
   );;; end while
  (close f1)
  (command "zoom" "e")
) ;;;  end defun C:sap