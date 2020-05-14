
;;;��ʵ��
(DEFUN C:Con ()
        (SETVAR "CMDECHO" 0)
        (PRINC "SELECT Obj. be ContinuouS: ")
        (SETQ SS (SSGET))
        (COMMAND "CHPROP" SS "" "LT" "CONTINUOUS" "") (SETVAR "CMDECHO" 1) (PRINC)) 


;;;��㻯��
(DEFUN C:Cen ()
        (SETVAR "CMDECHO" 0)
        (PRINC "SELECT Obj. be CEnter: ")
        (SETQ SS (SSGET))
        (COMMAND "CHPROP" SS "" "LT" "CENTER" "") (SETVAR "CMDECHO" 1) (PRINC)) 
;;;������
(DEFUN C:Das ()
        (princ "select object...\n")
        (setq ss (ssget))
        (command "chprop" ss "" "lt" "dashed" "") (princ)) 

;;;˫��ƫ��
(defun c:db( / en m n pon ename et ppp ouse )
  (setvar "cmdecho" 1)
  (COMMAND "OFFSET" PAUSE "")
  (prompt "\n Select Objects to Offset: ")
  (setq en (ssget))
  (setq m (sslength en ))
  (setq n 0)
  (setvar "cmdecho" 0)
  (repeat m 
    (setq ename (ssname en n))
    (setq et  (entget ename))
    (setq ppp (trans (cdr (assoc 10 et)) 0 1))
    (setq ouse (list ename ppp))
    (setq pon  (trans (list (+ (car ppp) 1001) (- (cadr ppp) 1000) ) 0 1 ))
    (command "offset" "" ouse pon "")
    (setq ouse (list (entlast) (trans (cdr (assoc 10 (entget (entlast)))) 0 1)))
    (command "offset" (* (getvar "offsetdist") 2 )  ouse ppp "")
    (command "offset" (/ (getvar "offsetdist") 2 ) "")
    (setq n (+ n 1))
  )
)


;;;���ظ���
(defun c:c()
(setq o1 (ssget))
(command "copy" o1 "" "m"))
;;;��Сһ��
(defun c:k()
(command "_.scale" (ssget) "" (getpoint "\nѡ��������0.5������:") 0.5 "")
)
;;;�Ŵ�һ��
(defun c:kK()
(command "_.scale" (ssget) "" (getpoint "\nѡ��������0.5������:") 2.0 "")
)
;;;�ƶ���һ��ѡ��
(defun c:dd() (princ "\n�ƶ���һ��ѡ��")(command "_.move" "p" ""))
(defun c:cd() (princ "\n������һ��ѡ��")(command "_.copy" "p" ""))
(defun c:ed() (princ "\nɾ����һ��ѡ��")(command "_.erase" "p" ""))

;;;������
(defun c:br ()
(command) 
(princ "\nѡ��Ҫ�жϵ�����:")
(while (setq mid (entsel)) 
(setq old-osmode (getvar "osmode"))
(command "_.break"
   mid
   "F"
   (setq pt1 (getpoint "\n�����жϵ�:"))
   (progn (setvar "osmode" 0) pt1)
)
(setvar "osmode" old-osmode)
)
)

;;;ͼ��ʵ������������
(defun c:zz (/		       YJWSH_CENTERPOINT
		YJWSH_CHANGSCALE       YJWSH_CHANGSCALE_H
		YJWSH_PLOTSCALE	       YJWSH_SCREENHIGN
		YJWSH_SCREENSIZE_Y     YJWSH_VIEWCTR
		YJWSH_VIEWCTR_NEW      YJWSH_VIEWSIZE
	       )
  (princ
    (strcat "\n*** ͼ��ʵ���������������V050308 ***")
  ) ;_ ����princ
  (princ (strcat "\n       [��ɽ֮ʯͼ�ι�������Ʒ]"))
  (princ)

  (setvar "cmdecho" 0)
  (princ (strcat "\n��ѡ����ͼ���ĵ�<�˳�>"))
  (if (setq YJWSh_centerpoint
	     (getpoint)
      ) ;_ ����setq
    (progn
;;;���µõ���ǰ�ӿ�����ͼ�����ĵ�
      (setq YJWSh_viewctr (getvar "viewctr"))
;;;���½��µõ�����ͼ�����ĵ��Ƶ�ԭ�������ĵ�
      (command "pan" YJWSh_centerpoint YJWSh_viewctr)
;;;���µõ���ǰ�ӿڵ���ͼ�߶�
      (setq YJWSh_viewsize (getvar "viewsize"))
;;;���µõ�������Ϊ��λ�洢��ǰ�ӿڵĴ�С��X �� Y ֵ��
      (setq YJWSh_screensize_y (cadr (getvar "screensize")))
;;;240(����)Ϊ�ó���������17����ʾ���Ŀ��Ӹ߶ȣ��ֱ�����Ϊ1024X768��
      (setq YJWSh_screenhign (* 240 (/ YJWSh_screensize_y 768)))
;;;���µõ���ͼ����,Ҳ����ͨ��DIMSCALE�������趨
      (setq YJWSh_plotscale 100)

      (setq YJWSh_changscale_h
	     (/	(/ YJWSh_viewsize YJWSh_screenhign)
		YJWSh_plotscale
	     ) ;_ ����/
      ) ;_ ����setq
      (setq YJWSh_changscale (strcat (rtos YJWSh_changscale_h 2 8) "x"))
      (command "zoom" YJWSh_changscale)
    ) ;_ ����progn
  ) ;_ ����if
  (princ
    (strcat "\n*** ͼ��ʵ���������������V050308 ***")
  ) ;_ ����princ
  (princ (strcat "\n       [��ɽ֮ʯͼ�ι�������Ʒ]"))
  (princ)
) ;_ ����defun


;;;ˢ����
(defun c:aa ( / content name_old text_new)  
(repeat 1000
(setq content (cdr(assoc 1 (entget(car(entsel"\n ��ѡ��Դ����:"))))))
(setq name_old(car(entsel"\n ��ѡ��Ŀ������:")))
(setq text_new(entget name_old))
(setq text_new(subst (cons '1 content) (assoc 1 text_new) text_new))
(entmake text_new)
(entdel name_old)
(princ)
)
)

;;;���뵱ǰͿ��
(defun c:cv()
(setq cmd(getvar "cmdecho"))
(setvar "cmdecho" 0)
(setq ss(entsel "\nSelect Dimension:"))
(setq la(cdr(assoc 8(entget(car ss)))))
(setq lb(cdr(assoc 3(entget(car ss)))))
(setvar "clayer" la)
(command "dimstyle" "r" lb)
(setvar "cmdecho" 0)
)


;;;��������
(defun c:J (/ PT0 PTLIST PTLIST0 ss CMDECHO OSMODE)
  (setq	cmdecho	(getvar "cmdecho")
	osmode	(getvar "osmode")
  )
  (while (and (setq ptlist0 (getpoint_list))
	      (> (length ptlist0) 1)
	 )
    (setvar "cmdecho" 0)
    (setvar "osmode" 0)
    (setq pt0	 (car ptlist0)
	  ptlist (cdr ptlist0)
    )
    (command "trim" "")
    (foreach pt	ptlist
      (command "f" pt0 pt "")
      (setq pt0 pt)
    )
    (command "")
    (if	(setq ss (ssget "f" ptlist0))
      (command "erase" ss "")
    )
    (setvar "osmode" osmode)
    (setvar "cmdecho" cmdecho)
  )
  (princ)
)
(defun getpoint_list ( / DIS OUT PT)
  (setq pt (getpoint "\n��ʼ��"))
  (princ "\n����������:")
  (if (= (type pt) 'LIST)
    (progn
      (setq out (list pt)
	    dis (* 0.01 (getvar "viewsize")))
      (while (= 5 (car (setq pt (grread t 4 0))))
	(setq pt (cadr pt))
         (if (> (distance pt (car out)) dis)
	   (progn
	     (grdraw pt (car out) 1)
	     (setq out (cons pt out))
	     )
	   )
	)
      )
    )
  (redraw)
  (reverse out)
  )



;;;ѡ����
(defun c:ss ( / slent f dcl_name lst2 lst1 color tmp index_value flag entl lst3 lst4 code ktmp klst lst4
	        hand fjflt filter kl_pre ;;ԭΪȫ�ֱ���������ʵ���ѡʱ���ϴι��˱����ѡ������ss_saved_lst����
	        ss fjlst ssl attdis strtmp) ;;ss_saved_lst��Ϊȫ�ֱ��������ϴ�ѡ��ı���ֵ����ʽ��(hand fjflt filter kl_pre)
  (setq attdis "Y" kl_pre (last ss_saved_lst) slent "N")
  (while (= slent "N")
      (initget "N")
      (setq slent (entsel (strcat "\n��ѡ������ʵ��(N-�رտ�������ʾ,��ǰ״̬��" (if (= "Y" attdis) "��" "�ر�") "):" )))
      (if (= slent "N") (setq attdis "N") (setq slent (car slent)))
  );;while
 (if slent  ;;;----------------------1
   (progn  ;;;-----------------------1
       (setq fjflt nil filter nil entl (entget slent))     
       (setq lst2 '( 
("ͨ��" ((0 "ʵ������") (6 "ʵ������") (8 "����ͼ��") (48 "���ͱ���") (62 "ʵ����ɫ" ((256 "���") (0 "���") (1 "��ɫ") (2 "��ɫ") (3 "��ɫ") 
         (4 "��ɫ") (5 "��ɫ") (6 "��ɫ") (7 "�ڰ�"))) (370 "ʵ���߿�")))
("ARC" ((-4 "Բ��") (10 "Բ������") (40 "Բ���뾶") (39 "ʵ����") (50 "���Ƕ�") (51 "�յ�Ƕ�")) ("FJ" ("FJ1" "Բ������" (len slent))))
("CIRCLE" ((-4 "Բ��") (10 "Բ������") (40 "Բ�ΰ뾶") (39 "ʵ����")))
("SOLID" ((-4 "SOLID") (39 "ʵ����")))
("POINT" ((-4 "��") (10 "���λ��") (39 "ʵ����") (50 "��ת�Ƕ�")))
("LINE" ((-4 "ֱ�߶�") (10 "�������") (11 "�յ�����") (39 "ʵ����")) ("FJ" ("FJ1" "�߶γ���" (len slent)) 
         ("FJ2" "�߶νǶ�" (REM (ATOF (ANGTOS (ANGLE (DXF 10 slent) (DXF 11 slent)))) 180))))
("ELLIPSE" ((-4 "��Բ") (10 "��Բ����") (11 "����˵�") (40 "�������") (41 "��ʼ����") (42 "��������")))
("INSERT" ((-4 "ͼ��") (10 "ͼ��λ��") (2 "ͼ������") (41 "X �����") (42 "Y �����") (43 "Z �����") (50 "��ת�Ƕ�"))) 
           ;("FJ" ("FJ1" "���Ա�־" (car (attstr slent))) ("FJ2" "������ֵ" (cadr (attstr slent)))))
("LWPOLYLINE" ((-4 "�������") (38 "���߱��") (43 "�̶����") (90 "�������") (39 "���ߺ��") (70 "�Ƿ�պ�" ((0 "���պ�") (1 "�պ�")))) 
               ("FJ" ("FJ1" "���߳���" (len slent))))
("POLYLINE" ((-4 "�ض�����") (70 "�Ƿ�պ�" ((0 "���պ�") (1 "�պ�")))) ("FJ" ("FJ1" "���߳���" (len slent ))))
("HATCH" ((-4 "ͼ�����") (2 "���ͼ��") (41 "������") (52 "���Ƕ�") (71 "�߽����" ((0 "������") (1 "����"))) 
          (76 "ͼ������" ((0 "�û�����") (1 "Ԥ����") (2 "�Զ���")))))
("TEXT" ((-4 "����") (1 "��������") (7 "������ʽ") (10 "����λ��") (40 "���ָ߶�") (41 "���ϵ��") (50 "��ת�Ƕ�") (51 "��б�Ƕ�") 
         (71 "���־���" ((0 "Ĭ��") (2 "���ַ���") (4 "���ֵ���") (6 "������"))) 
         (72 "ˮƽ����" ((0 "�����") (1 "���ж���") (2 "�Ҷ���") (3 "����") (4 "�м�") (5 "���"))) 
         (73 "��ֱ����" ((0 "���߶���") (1 "�׶˶���") (2 "���ж���") (3 "���˶���")))) ("FJ" ("FJ1" "������ֵ" (ATOF (DXF 1 slent)))))
("ATTDEF" ((-4 "���Զ���") (2 "���Ա��") (7 "������ʽ") (10 "����λ��") (40 "���ָ߶�") (50 "��ת�Ƕ�") (51 "��б�Ƕ�") 
           (71 "���־���" ((0 "Ĭ��") (2 "���ַ���") (4 "���ֵ���") (6 "������"))) 
           (72 "ˮƽ����" ((0 "�����") (1 "���ж���") (2 "�Ҷ���") (3 "����") (4 "�м�") (5 "���"))) 
           (73 "��ֱ����" ((0 "���߶���") (1 "�׶˶���") (2 "���ж���") (3 "���˶���")))) ("FJ" ("FJ1" "�����ֵ" (ATOF (DXF 2 slent)))))
("MTEXT" ((-4 "��������") (10 "����λ��") (1 "��������") (7 "������ʽ") (40 "���ָ߶�") (50 "��ת�Ƕ�")))
("SPLINE" ((-4 "��������") (70 "���߱�־") (71 "���߽���") (72 "�ڵ�����") (73 "���Ƶ���") (74 "��ϵ���") 
           (42 "�ڵ㹫��") (43 "�ص㹫��") (44 "��Ϲ���")) ("FJ" ("FJ1" "���߳���" (len slent))))
("DIMENSION" ((-4 "�ߴ��ע") (1 "��ע����") (42 "����ֵ") (3 "��ע��ʽ") (70 "��ע����" ((32 "ˮƽ��ֱ") (33 "�����ע") (34 "�Ƕȱ�ע") 
              (35 "ֱ����ע") (36 "�뾶��ע") (37 "����Ƕ�") (38 "�����ע")))))
) 
);;setq lst2 
  (if (and (= attdis "Y") (= "INSERT" (dxf 0 slent))) (kldc_1)) ;;�Կ�ʵ�壬�������Թ��˱�slent��lst2��Ϊȫ�ֱ�������
  (setq lst3 (car (dxf "ͨ��" lst2)) 
    lst5 (dxf (dxf 0 entl) lst2) 
    lst4 (car lst5) 
    lst5 (cadr lst5) 
  ) 
  (foreach tmp lst3 
    (if (and (not (dxf (car tmp) entl)) (/= (car tmp) 62)) (setq lst3 (vl-remove tmp lst3))) 
  );;foreach 
  (setq dcl_name (strcat (getenv "temp") "\\sel" ".dcl") 
        f (OPEN dcl_name "w")) 
  (write-line "sl:dialog{label=\"�ҵ�ѡ����--By С��\";" f) 
  (write-line ":column{" f) 
  (write-line ":boxed_column{label=\"��������\";" f) 
  (write-line ":boxed_column{label=\"ͨ��\";" f) 
  (foreach tmp lst3 
     (write-line ":row{fixed_width=true;" f) 
     (write-line (strcat ":toggle{key=\"" (itoa (car tmp)) "\";label=\"" (cadr tmp) "\";width=12;}") f) 
     (write-line (strcat ":popup_list{edit_width=5;key=\"pop" (itoa (car tmp)) "\";}") f) 
     (setq ktmp (list (strcat "pop" (itoa (car tmp))) (itoa (car tmp)))) 
    (if  (/= 62 (car tmp)) 
      (progn 
      (setq ktmp (write f ktmp (car tmp) (vl-princ-to-string (dxf (car tmp) entl)) "txt" "16")) 
      (if (= 48 (car tmp)) 
        (setq ktmp (write f ktmp 48 "�ݲ�" "txta" "7")) 
      );;if 
       );;progn 
       (progn 
      (setq color (dxf 62 entl))  (if (not color) (setq color 256)) 
     (setq ktmp (write f ktmp 62 (itoa color) "txt" "16")) 
         (write-line (strcat ":edit_box{value=\"" (vl-princ-to-string (car (dxf color (caddr tmp)))) "\";edit_width=7 ;allow_accept=true;}") f) 
    );progn 
      );;if 
     (write-line "}" f) 
    (setq klst (cons (reverse ktmp) klst)) 
  );;foreach 
  (write-line "}" f) 
  (write-line (strcat ":boxed_column{label=\"" (vl-princ-to-string (car (dxf -4 lst4))) "\";") f) 
  (setq lst4 (cdr lst4)) ;;ȥ��ǰ���-4���� 
  (foreach tmp lst4 
    (setq code (car tmp) ktmp nil) 
    (if (dxf code entl) (progn 
    (write-line ":row{fixed_width=true;" f) 
    (setq ktmp (list (strcat "pop" (itoa code)) (itoa code))) 
    (write-line (strcat ":toggle{key=\"" (itoa code) "\";label=\"" (vl-princ-to-string (cadr tmp)) "\";width=12;}") f) 
    (write-line (strcat ":popup_list{edit_width=5;key=\"pop" (itoa code) "\";}") f) 
    (cond ((or (= code 10) (= code 11)) 
       (setq ktmp (write f ktmp code (vl-princ-to-string (car (dxf code entl))) "txt_x" "6.5")) 
       (setq ktmp (write f ktmp code (vl-princ-to-string (cadr (dxf code entl))) "txt_y" "6")) 
       (setq ktmp (write f ktmp code (vl-princ-to-string (caddr (dxf code entl))) "txt_z" "7")) 
      ) 
      ((member code '(1 2 3 7 90 38 39 40 41 42 43 44 50 51 52 70 71 72 73 74 76)) 
       (setq strtmp (vl-princ-to-string (dxf code entl)))
       (if (= code 1) 
	   (foreach tmp '("\r\n" "\\P" "\\")
               (while (vl-string-search tmp strtmp) (setq strtmp (vl-string-subst " " tmp strtmp)))
           );;foreach ;;;;����acad2005�е�mtext�еĻ��з�(shift+enter)���¶Ի�������
	);;end if code=1
       (setq ktmp (write f ktmp code strtmp "txt" "16")) ;ԭstrtmp=(vl-princ-to-string (dxf code entl))
         (cond ((member code '(38 39 40 41 42 43 44 50 51 52)) 
            (setq ktmp (write f ktmp code "�ݲ�" "txta" "7")) 
               ) 
           ((member code '(70 71 72 73 74 76)) 
            (if (car (dxf (dxf code entl) (cadr (dxf code lst4))))
(write-line (strcat ":edit_box{value=\"" (vl-princ-to-string (car (dxf (dxf code entl) (cadr (dxf code lst4))))) "\";edit_width=7;allow_accept=true;}") f) 
            );if 
           ) 
         );;cond 
      ) 
    );;cond 
    (write-line "}" f) 
    ));;progn & if 
    (if ktmp (setq klst (cons (reverse ktmp) klst))) 
  );;foreach 
  (write-line "}" f) 
  (if lst5 (progn (setq lst5 (cdr lst5) ) ;;ȥ��lst5��һ��Ԫ��"FJ" 
    (write-line ":boxed_column{label=\"���ӹ���\";" f) 
    (foreach tmp lst5 
       (write-line ":row{fixed_width=true;" f) 
       (write-line (strcat ":toggle{key=\"" (car tmp) "\";label=\"" (cadr tmp) "\";width=12;}") f) 
       (write-line (strcat ":popup_list{edit_width=5;key=\"pop" (car tmp) "\";}") f) 
       (setq ktmp (list (strcat "pop" (car tmp)) (car tmp))) 
       (setq ktmp (write f ktmp (car tmp) (vl-princ-to-string (eval (caddr tmp))) "txt" "16")) 
       (setq ktmp (write f ktmp (car tmp) "�ݲ�" "txta" "7")) 
       (setq fjlst (cons (reverse ktmp) fjlst))  ;;fjlst�Ǹ��ӹ��������ı����� 
       (write-line "}" f) 
    );;foreach 
    (write-line "}" f) 
  ));if lst5 
  (write-line "}:row{:boxed_radio_row{label=\"���˷�Χ\";" f) 
  (write-line ":radio_button{label=\"��ѡ\";key=\"hand\";value=\"1\";}" f) 
  (write-line ":radio_button{label=\"Ԥѡ\";key=\"pre\";}" f) 
  (write-line ":radio_button{label=\"ȫͼ\";key=\"all\";}" f) 
  (write-line "}}:row{ok_cancel;}}}" f) 
  (close f) 
  (setq klst (reverse klst)) 
  (setq index_value (load_dialog dcl_name));_����dcl�ļ� 
  (new_dialog "sl" index_value);_��ʼ�¶Ի��� 
  (foreach tmp klst  ;;klstΪ�����������ʼ���б���������ʼֵ 
    ;;�磺'(("0" "pop0" ("txt0" "INSERT")) ("8" "pop8" ("txt8" "_��������")) ("62" "pop62" ("txt62" "256")) 
    ;;("10" "pop10" ("txt_x10" "3431.58") ("txt_y10" "-17355.0") ("txt_z10" "0.0")) ("2" "pop2" ("txt2" "RXF008")) 
    ;;("41" "pop41" ("txt41" "-64.0") ("txta41" "��?.. 
    (cond ((member (car tmp) '("0" "1" "2" "3" "6" "7" "8")) (show_list (cadr tmp) '("=" "<>"))) 
      ((member (car tmp) '("10" "11" "38" "39" "40" "41" "42" "43" "44" "48" "50" "51" "52")) (show_list (cadr tmp) '("=" "<" ">" "<=" ">=" "<>"))) 
      ((member (car tmp) '("62" "70" "71" "72" "73" "74" "76" "90")) (show_list (cadr tmp) '("=" "<" ">" "<=" ">=" "<>" "&" "&="))) 
    );;cond 
  );;foreach ��ʾ����ѡ����Ϣ 
  (if fjlst (foreach tmp fjlst (show_list (cadr tmp) '("=" "<" ">" "<=" ">=" "<>"))));;;;end if fjlst;��ʾ���ӹ�������ѡ����Ϣ 
        ;;;;fjlst�Ǹ��ӹ��������ı�����,�磺'(("FJ3" "popFJ3" ("txtFJ3" "0.0") ("txtaFJ3" "�ݲ�")) ("FJ2" "popFJ2" ("txtFJ2" "0.0") 
                                            ;;("txtaFJ2" "�ݲ�")) ("FJ1" "popFJ1" ("txtFJ1" "0.0") ("txtaFJ1" "�ݲ�"))) 
  (if kl_pre 
    (foreach tmp (cdr kl_pre) 
        (if (= (dxf 0 entl) (car kl_pre)) 
            (set_tile (car tmp) "1") 
            (if (member (car tmp) '("0" "6" "8" "48" "62" "370")) 
            (set_tile (car tmp) "1") 
        );;end if 
    );;end if 
    );;foreach 
  ) ;;���ϴ�ѡ�еĸ�ѡ����Ϊѡ��״̬ 
  (action_tile "accept" "(get_filter) (done_dialog 1)") 
  (setq flag (start_dialog)) 
  (unload_dialog index_value)
);;end progn ;;;-----------------------1
   (setq hand (car ss_saved_lst)
	 fjflt (cadr ss_saved_lst)
	 filter (caddr ss_saved_lst)
   );;setq
);;end if;;;;--------------------------1
  (if filter (progn (princ "\nʹ�ù�������") 
           (princ filter) 
           (cond ((= hand "1") (setq ss (ssget filter))) 
                 ((= hand "2") (setq ss (ssget "p" filter))) 
                 ((= hand "3") (setq ss (ssget "x" filter))) 
           );;cond 
  ));;end if filter 
  (if (and (setq ssl (chsget ss)) fjflt) 
      (foreach slent ssl (if (not (eval fjflt)) (setq ss (ssdel slent ss)))) 
  );;end if
(setq ss_saved_lst (list hand fjflt filter kl_pre)) ;;������ȫ�ֱ���
(if ss (progn
	 (princ (strcat "\n��ѡ����" (itoa (sslength ss)) "��ʵ�塣"))
	 (if (= 0 (getvar "cmdactive")) (command "select" ss "" "pselect" ss ""))
       );;progn
       (princ "\n��ѡ����0��ʵ�塣")
);;if
  ss
);;defun 
(defun get_filter ( / tmp pop txt txt1 rc txt2 txt3 pop_1 pop_2 pop_3) 
  (cond ((= "1" (get_tile "hand")) (setq hand "1"))
	((= "1" (get_tile "pre")) (setq hand "2"))
        ((= "1" (get_tile "all")) (setq hand "3"))
  );;cond
  (foreach tmp klst (if (/= "1" (get_tile (car tmp))) (setq klst (vl-remove tmp klst)))) 
  (foreach tmp fjlst (if (/= "1" (get_tile (car tmp))) (setq fjlst (vl-remove tmp fjlst)))) 
  (setq kl_pre (append (list (dxf 0 entl)) klst fjlst)) ;;���ӹ���ѡ�е����´�ʹ��Ҳ��Ϊȱʡѡ�� 
  (foreach tmp klst 
    (setq pop (get_tile (cadr tmp))) 
    (cond ((member (car tmp) '("0" "1" "2" "3" "6" "7" "8"))
	   (setq txt (get_tile (caaddr tmp)) 
                 txt1 (cadr (caddr tmp)))
	   (if (= txt txt1) (setq txt (dxf (read (car tmp)) entl))) ;;���(car tmp)��Ӧ��ֵδ���û��޸Ĺ���ȡ��ԭ����ֵ 
           (cond ((= pop "0") ;(setq txt (get_tile (caaddr tmp)) 
                    (setq filter (append (cons '(-4 . "<OR") (cons (cons (read (car tmp)) txt) '((-4 . "OR>")))) filter) 
                    );;setq 
                 ) 
                ((= pop "1") ; (setq txt (get_tile (caaddr tmp)) 
                     (setq filter (append (cons '(-4 . "<NOT") (cons (cons (read (car tmp)) txt) '((-4 . "NOT>")))) filter) 
                     );;setq 
                ) 
            );;cond 
          );;end member 
      ((member (car tmp) '("62" "70" "71" "72" "73" "74" "76" "90")) 
          (setq txt (get_tile (caaddr tmp)) 
                        filter (append 
                                   (cons (cons -4 (nth (read pop) '("=" "<" ">" "<=" ">=" "<>" "&" "&="))) (list (cons (read (car tmp)) (read txt)))) 
                                  filter 
                          );;append 
              );;setq 
      ) 
      ((member (car tmp) '("38" "39" "40" "41" "42" "43" "44" "48" "50" "51" "52")) 
           (setq txt (get_tile (caaddr tmp)) 
             txt1 (cadr (caddr tmp)) 
             rc (read (get_tile (car (last tmp)))) 
        );;setq 
        (if (/= txt txt1) (setq txt (atof txt)) (setq txt (dxf (read (car tmp)) entl))) ;;���(car tmp)��Ӧ��ֵδ���û��޸Ĺ���ȡ��ԭ����ʵ����ֵ 
                (if (and (or (= (type rc) 'REAL) (= (type rc) 'INT)) (= pop "0")) ;;����������ݲ��Ϊ��ֵ�ͣ���������Ϊ"="ʱҪ�����ݲ� 
               (setq filter (append ;;�����ݲ� 
                                        (cons '(-4 . "<=") (list (cons (read (car tmp)) (+ txt (abs rc))))) 
                       (cons '(-4 . ">=") (list (cons (read (car tmp)) (- txt (abs rc))))) 
                                       filter 
                                    );;append 
                );;setq 
                    (setq filter (append    ;�������ݲ� 
                                   (cons (cons -4 (nth (read pop) '("=" "<" ">" "<=" ">=" "<>"))) (list (cons (read (car tmp)) txt))) 
                                  filter 
                          );;append 
                    );;setq 
        );;end of if �ݲ� 
      ) 
      ((member (car tmp) '("10" "11")) 
       (setq txt1 (get_tile (caaddr tmp)) 
         txt2 (get_tile (car (cadddr tmp))) 
         txt3 (get_tile (car (last tmp))) 
         pop_1 (nth (read pop) '("=" "<" ">" "<=" ">=" "<>"))
	 pop_2 pop_1
	 pop_3 pop_1
       );;setq
       (if (= txt1 "") (setq pop_1 "*"))
       (if (= txt2 "") (setq pop_2 "*"))
       (if (= txt3 "") (setq pop_3 "*"))
       (if (/= txt1 (cadr (caddr tmp))) (setq txt1 (atof txt1)) (setq txt1 (car (dxf (read (car tmp)) entl))));;��������Ӧ��ֵδ���û��޸Ĺ���ȡ��ԭ����ʵ����ֵ 
       (if (/= txt2 (cadr (cadddr tmp))) (setq txt2 (atof txt2)) (setq txt2 (cadr (dxf (read (car tmp)) entl)))) 
       (if (/= txt3 (cadr (last tmp))) (setq txt3 (atof txt3)) (setq txt3 (caddr (dxf (read (car tmp)) entl)))) 
       (setq filter (append 
                (cons (cons -4 (strcat pop_1 "," pop_2 "," pop_3)) (list (cons (read (car tmp)) (list txt1 txt2 txt3)))) 
                filter   
            ) 
        ) 
      );;end of member (car tmp) '("10" "11") 
    );;cond 
  );;foreach tmp klst 
  (if fjlst (progn 
          (if (null filter) (setq filter (list (assoc 0 entl))))  ;;�����ѡ�еĸ�����������filter��Ϊ����ʵ������ 
          (setq fjflt '(and)) 
          (foreach tmp fjlst 
        (setq pop (get_tile (cadr tmp)) 
              txt (get_tile (caaddr tmp)) 
              txt1 (cadr (caddr tmp)) 
              rc (read (get_tile (car (last tmp)))) 
        );;setq 
        (if (/= txt txt1)
	       (if (/= "INSERT" (dxf 0 slent)) (setq txt (atof txt)));ͼ��ʵ��ĸ��ӹ���Ϊ�ַ��ͣ�����Ϊ��ֵ��
	       (setq txt (eval (cadr (dxf (car tmp) lst5))))
	) ;;���(car tmp)��Ӧ��ֵδ���û��޸Ĺ���ȡ��ԭ����ʵ����ֵ 
                (if (and (or (= (type rc) 'REAL) (= (type rc) 'INT)) (= pop "0")) ;;����������ݲ��Ϊ��ֵ�ͣ���������Ϊ"="ʱҪ�����ݲ� 
               (setq fjflt (append ;;�����ݲ� 
                               fjflt 
                       (list (list 'and 
                          (list '<= (cadr (dxf (car tmp) lst5)) (+ txt (abs rc))) 
                          (list '>= (cadr (dxf (car tmp) lst5)) (- txt (abs rc))) 
                       )) 
                                    );;append 
                );;setq 
                    (setq fjflt (append    ;�������ݲ� 
                                    fjflt 
                    (list (list (read (nth (read pop) '("=" "<" ">" "<=" ">=" "<>"))) (cadr (dxf (car tmp) lst5)) txt)) 
                          );;append 
                    );;setq 
        );;end of if �ݲ� 
          );;foreach fjlst 
  ));;end if fjlst 
);;defun 
(defun show_list ( key lst) 
  (start_list key) 
  (mapcar 'add_list lst) 
  (end_list) 
);;defun 
(defun write (f ktmp code value txt width / tmp) 
   (setq tmp (strcat txt (vl-princ-to-string code))) 
   (write-line (strcat ":edit_box{value=\"" value "\";key=\"" tmp "\";edit_width=" width ";allow_accept=true;}") f) 
   (setq ktmp (cons (list tmp value) ktmp)) 
);;defun 
(defun dxf ( i ent) 
    (if (= (type ent) 'ENAME) 
      (setq ent (entget ent)) 
    ) 
    (cdr (assoc i ent)) 
);;defun
(defun chsget ( c01 / c02 c03 c04 c05) 
   (if c01 (progn 
           (setq c02 0 c03 (sslength c01)) 
           (while (< c02 c03) 
              (setq c04 (ssname c01 c02) 
                    c02 (1+ c02)) 
              (setq c05 (cons c04 c05)) 
           )  ;end of while 
           )  ;end of progn 
    )  ;end of if 
    c05 
)  ;end of defun
(defun len (ent)
  (if (= (type ent) 'ENAME) (setq ent (vlax-ename->vla-object ent)))
  (if (wcmatch (vla-get-ObjectName ent) "AcDbPolyline,AcDbEllipse,AcDbCircle,AcDbArc,AcDbLine,AcDb2dPolyline,AcDbSpline")
      (vlax-curve-getdistatparam ent (vlax-curve-getendparam ent))
  );;if
);;defun
(defun VxGetAtts (Obj) 
(if (= (type Obj) 'ENAME) (setq Obj (vlax-ename->vla-object Obj)))
  (if (= (vla-get-ObjectName obj) "AcDbBlockReference")
  (mapcar 
    '(lambda (Att) 
       (cons (vla-get-TagString Att) 
         (vla-get-TextString Att) 
       ) 
     ) 
    (vlax-invoke Obj "GetAttributes") 
  )
    )
) 
(defun KLDC_1 (/ attl alen lval ltag aflst aa cc a11 a12 a13)
 (setq attl (VxGetAtts slent))
 (if attl (progn
   (setq alen (length attl))
   (while (> alen 0)
    (setq a11 (list (cons 'nth (cons (- alen 1) '((VxGetAtts slent)))))
          a12 (cons 'if (list '(VxGetAtts slent) (cons 'cdr a11)))
          a13 (cons 'if (list '(VxGetAtts slent) (cons 'car a11)))
          lval (list  (strcat "FJ" (rtos (* 2 alen) 2 0))       '"������ֵ" a12)
          ltag (list  (strcat "FJ" (rtos (- (* 2 alen) 1) 2 0)) '"���Ա�־" a13)
          aflst (append (list lval ltag) aflst)
          alen (1- alen))
   );;end while
   (setq aa (assoc "INSERT" lst2)
         cc (list (car aa) (cadr aa) (append '(FJ) (reverse aflst)))
         lst2 (subst cc aa lst2))
  );;progn
 );;if
);;end defun
(if (not (member "acopm.arx" (arx))) (arxload "acopm.arx")) 
(princ)

;;;�Ŀ���ɫ
(defun c:se( / blk blkref blocks doc ent name ss n clo)
 (vl-load-com)
  (princ "\nѡҪ���Ŀ�: ")
(setq ss (ssget '((0 . "INSERT")))
      n	 (sslength ss)
)
  (while (and (setq BLK     (ssname ss (setq n (1- n))))
	  (setq BLKREF  (vlax-ename->vla-object BLK))
	  (not(and(/= (vla-get-objectname BLKREF) "AcDbBlockReference")
	      (princ"\n���ǿ�:"))
	   )
	      (setq clo (acad_colordlg 7))

	  (setq name(vla-get-name BLKREF))
      )
    (progn
          (command"undo""group")
          (setq DOC     (vla-get-activedocument (vlax-get-acad-object))
                BLOCKS  (vla-get-blocks doc)
	        blk     (vla-item BLOCKS name)
          )
           (vlax-for ENT blk
             (vla-put-layer ent "0")
             (vla-put-color ent clo)
           )
        (vla-regen doc acActiveViewport)
        (vlax-release-object blk)
        (vlax-release-object BLOCKS)
        (vlax-release-object DOC)
        (command"undo""end")
        
     )
  )
  (princ"\nUndo����regen.")
(princ))
