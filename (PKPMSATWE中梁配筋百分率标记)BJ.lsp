;;;���ܣ�         SATWE�������ٷ��ʱ��
;
;
;
;
;
;;;˵����1.�������21000ͼ���ϵ�ʵ�塣
;        2.����������ʵ������Ϊ��ɫ������дͼ�㡣
;        3.������ֵ�н���һ�����������ͱ�ǡ�
;        4.�����С��1.6%��ʱ���ð�ɫ����1.6%~2.0%֮������ɫ��2.0%~2.5%֮���û�ɫ������2.5%�ú�ɫ
(defun C:bj ()
   (setq old_cm (getvar "CMDECHO"))
   (setvar "CMDECHO" 0)
   (setq wz_list (list (cons 0 "TEXT") (cons 8 "21000")(cons 1 "*-*-*")))
   (setq ss (ssget wz_list))
   (setq i 0)
   (setq n 0)
   (setq nn (sslength ss))
   (repeat nn
      (setq ssn (ssname ss i))
      (setq ssdata (entget ssn))
      (setq text_P1 (vl-string-position (ascii "-") (cdr (assoc 1 ssdata))))        
      (setq text_P2 (vl-string-position (ascii "-") (cdr (assoc 1 ssdata)) nil T))
      (setq text_P3 (vl-string-position (ascii "(") (cdr (assoc 1 ssdata))))
      (setq text_P11 (+ text_P1 2))
      (setq text_P21 (+ text_P2 2))
      (setq text_P1_2 (- text_P2 text_P1 1))
      (setq text_P2_3 (- text_P3 text_P2 1))
      (setq hh1 (atof (substr (cdr (assoc 1 ssdata)) 1 text_P1)))
      (setq hh2 (atof (substr (cdr (assoc 1 ssdata)) text_P11 text_P1_2)))
      (setq hh3 (atof (substr (cdr (assoc 1 ssdata)) text_P21 text_P2_3)))
      (setq hh_max (max hh1 hh2 hh3))
      (if (>= hh_max 2.5)
          (command ".chprop" ssn "" "c" "1" "")
      )
      (if (and (>= hh_max 2.0) (< hh_max 2.5))
          (command ".chprop" ssn "" "c" "2" "")
      )
      (if (and (>= hh_max 1.6) (< hh_max 2.0))
          (command ".chprop" ssn "" "c" "3" "")
      )
      (setq i (+ i 1))
   )
   (setvar "CMDECHO" old_cm)
   (princ)
)