;���ߣ�����   QQ��2363673534  ��ַ:http://xuanxiang.ys168.com 
(defun xx-layhb(O_Lay D_Lay)
     (setvar "cmdecho" 0) ;ָ��ִ�й��̲���Ӧ
(command "_.change" (ssget "x" (list (cons 8 O_Lay))) "" "p" "la" D_Lay "")
(command "_.purge" "la" O_Lay "n")
(princ))

(defun xx-get-dxf (code ename) 
(cdr (assoc code (entget ename)))) 


(defun c:TCHB ()
     (setvar "cmdecho" 0) ;ָ��ִ�й��̲���Ӧ
     (PRINC "\n������CAD�����---�ϲ�ͼ�㹦��")(PRINC) 
(progn 
(setq ent (entsel "\n��ѡ��Ŀ����ϵĶ���:"))
(setq la (cdr(assoc 8 (entget (car ent)))))
)
     (PRINC "\n��ѡҪ�ϲ��Ĳ�")
  (setq	ss (SSGET)
	i  -1
  )
  (while (setq s1 (ssname ss (setq i (1+ i))))
    (setq tx (xx-get-DXF 8 s1))
 (xx-layhb tx la))

(princ)
)

