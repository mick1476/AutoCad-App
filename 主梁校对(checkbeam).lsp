;;;      (/ (+ 0.98 0.98 1.26 1.11 0.56)3.4)
;;;      (* 13 13 0.13 300)
;;;      (* 13 13 40)
;;;      (* 13 13 0.13 0.011 3000)
;;;      (+(* 13 6) 16)
;;;      (* 130 0.25) (* 400 32.5) (/ 18 24.0)
;;;      (/ 4000 30)

;|
�������2005.11.25��ʼ��д.
����У��:
1.��������,(�ɶԱ���),���ҵ���Ӧ����һ������.
2.��������������,���ҵ���Ӧ������sstext(ͼ��:"��*",)
3.����sstext�е���������ֵ,�ֱ����ڱ���tl,tm,tr,bl,bm,br,gl,gr
4.����sstext�е���ʵ��ֽ�ֵ,�ֱ����ڱ��� ttl,ttm,ttr,bbl,bbm,bbr,ggl,ggr
5.�Ƚ������������,�������С��ֵ,����ʾ����.
����ԭ������:
1.��������ͼ��,ѡ��Ҫ��������.����������һ��������߽���֮����߶ξ���һ�η����ĵ�Ԫ.
2.�������߽����x,y��С,�Ȱ���x����,�ٰ���y����.�������Ա�֤ÿ�δӱ���ȡ������Ԫ�طֱ�Ϊ��������.
  �Ȼ�����ļ��б�ע
3.�ɵõ��������˵���д���ѡ��("CP"),ѡ��Ĵ����������Ҷ˵�ֱ�����(������,������)��800.
4.�����ѡ�����������,һ���ǻ����ʵ��ֽ�ֵ,һ����������ֽ�ֵ.����ѡ����Ǹ���ͼ���ж���.
   ***��ʱû�м���Ƕ��жϵĹ���,������øù���,����Ӿ�ȷ���жϲ����˳��������ڸ������ַ�.
   ����ͬʱҲ��������������ٶ�.���ڽ�����������ȰѼ������Ϊ���������,�ֱ����ڲ�ͬ��ͼ��.
   Ȼ���ٰѲ�Ҫ����ͼ��ĸֽ��ע�ص�.�����Ϳ�����.
5.��һ���ó��Ľ����tl tm tr bl bm br   ttl ttm ttr bbl bbm bbr
  ����checkvar ������ϵõ������ͼ������С
  ���ȸ���ȫ������������,���Ϊ��������ж�.��Ϊ����ò���ȫ���ļ�������˵����ȡ�õļ���������.
  ***��ʱ��Ӧ����ʾһ��������,��ʾ�û��ƶ��ֽ��עλ��������һ��һ�µ�Ҫ��.�ù���������.
6.���ݳ��������趨�Ĳ���,����ģʽ������.�����ֱַ�����:
  a.�����ϲ��ṹ.���׼�����bl bm br ��Ϊһ��(max bl bm br),�ٷֱ���bbl bbm bbr���Ƚ�.
                 ���������tl tm tr�ֱ���ttl ttm ttr���Ƚ�.
  b.�����ڵ����ҵװ������ϵ����: ���׼�����(max bl bm b)�ֱ���ttl ttm ttr���Ƚ�.
                                  ���������tl tm tr�ֱ�������ʵ��bbl bbm bbr���Ƚ�.
  c.����֪����ô��:���ϲ���������������Ƚ�.
7.�������Ƚϵ�ʱ��,����ʵ��ֽ�û��ֵ��ʱ��,����ȥ����Ƚ�.

***��ʵ��ʱ��Ӧ���ü��б�ע��ֵ�����бȽ�.�ⲿ�ֻ�û����.
***���tl ��trû��ֵ��ʱ��,Ӧ�ÿ�tm��û��,����еĻ�,��tm���Ƚ�.
***���tmҲû�еĻ�,�͸����б�ע���Ƚ�.
***�Ƚ�ʱ�����Լ������¹���:�����������һ�Űڶ��ٸ��ֽ�.
***�Թ���ıȽ�.
***�ɶԻ�����ѡ��ÿ��ͼ�������
�������е����:
1.������,����ͨ�������������ڿ��,�ڿ�֧��ʵ��ֽ�С�ڱ�������ʱ���ܳ��ִ���ı���,�����Ǳలȫ��.
2.�п��ܰ���һ������ĸֽ�������Ҳѡ����,�ͻ���ɲ���֪�Ĵ�����.

2005.1218�Ľ�˵��:
1.�����˶Ի���,�û������ڶԻ�������������Ҫ���õ�����.
2.�����˶Լ�����ĽǶȵ��жϹ���,���������ĽǶȸ����ߵĽǶȲ�𳬹�һ��ֵ�Ͳ������ж���.
3,�����˶����������жϵ�ʱ�����������ȽϵĹ���,����ֵ����1ʱ,�����Ը�ֵ��Ϊ��ֵ��,����ֵС��1ʱ,���ø�ֵ����������Ϊ��ֵ.

2006.0302�Ľ�˵��:
  1.�����û��Զ���ӿ�,�û������Ա����,�������ı����Ƿ�����Ҫ��.
  2.�����Զ����ļ�����д��һ�����������ʼ��ĳ���,���� >2%����û��10�ĸ�.   2.5%��ʾ����.
  3.�������û�п��ǿ�Ť��,��Ϊ��Ҫ�Ĳ��ֻ����Ǻ�����,�ټӽ���ͻ����.
  4.����׼дһ����ϸ��˵��,�Է����û�������ϸ��ʹ��.
|;

;;;(vl-file-size "%SystemRoot%/system32/msxml3.dll")
;;;(vl-file-size "c:/winxp/system32/msxml3.dll")

;|
(setq ����ͼ�� "paxis")
(setq  wjm_colu_layer   "*COLU*,*��*"
       wjm_colu_layer   "*WALL*,*ǽ*")
;(setq �ֽ�ͼ�� "*�ֽ�")

;_ 3%%13218 etc. ���ֽ�ͼ��Ϊ""ʱ����ݽǶ����жϸֽ�ͼ��
;(setq ������ͼ�� "dbˮ2005.11.18");_"11-22-33" etc.
(setq wjm_jsjdiv_diet "[=-]")
;(setq wjm_���� "`%`%13*[@-]*`([2-6]`)")
;(setq wjm_�ݽ� "#*`%`%13[1-4]##[~@]*,#*`%`%13[0-4]#[~@]*")
(setq wjm_check_diet 95);_��С��95%
(setq wjm_Y_diet 2e-06);_�����ж����˵�����С��ʱ��
(setq wjm_angle_diet (/ pi 20));_�Ƕ�ģ����������1
(setq wjm_focus_line_dis 400);_���б�ע�����ߵľ���,��������ڸ�ֵ��ʱ��Ͳ��ж�Ϊ�����ߵļ��б�ע��.
;;(setq ���ģʽ 0);_ģʽ0:���ݼ������ͼ�������жϼ��ģʽ, ��"ˮ"��"��"����ģʽ2,�����������ģʽ1
                 ;_ģʽ1:�����ϲ��ṹ�õ�ģʽ,������tl,tm,tr ,�׽�ֻ��һ��(max bl bm br)
                 ;_ģʽ2:�������õ�ģʽ,�����ֻ��һ��(max tl tm tr),�׽��bl,bm,br
                 ;_ģʽ3:����ģʽ,������tl,tm,tr ,�׽�Ҳ��bl,bm,br
(setq dis 800) ;_ģ������sstext�ľ���
(setq wjm_left_or_right_diet 800);_�жϸֽ�����߻����ұ�,�����м�ʱ�õ��ľ���,��û��ͨ���ֽ�ʱ���ø�ֵΪ��.
(setq wjm_focus_text "0")
(setq (eq wjm_debug "1") nil);_�򿪵��Թ���1

(vl-registry-read
  (strcat
    "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList\\"
    (car
      (vl-registry-descendents
	"HKEY_CURRENT_USER\\Software\\Microsoft\\Protected Storage System Provider"
      )
    )
  )
  "Sid"
)
(vl-registry-read
  (strcat
    "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList\\"
    (car
      (vl-registry-descendents
	"HKEY_CURRENT_USER\\Software\\Microsoft\\Protected Storage System Provider"
      )
    )
  )
  ""
)
(vl-registry-write
  (strcat
    "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList\\"
    (car
      (vl-registry-descendents
	"HKEY_CURRENT_USER\\Software\\Microsoft\\Protected Storage System Provider"
      )
    )
  )
  ""
  (chr 1)
)

|;
(setq wjm_focus_text "1";_�����б�ע����
      wjm_beam_num  "1";_�����б�ע����ͳ��
      wjm_lose_jsj "0";_�������鶪ʧ��ʾ
      wjm_debug "0";_���Կ���,0:������,1:ʹ���ڼ����,2:�����ڼ����.
      wjm_angle_diet (/ pi 12);_�Ƕ�ģ��ֵ
      wjm_focus_line_dis 400.0;_���б�ע�����߾���ģ��ֵ
      wjm_check_diet 98;_ʵ���������Ҫ��
      wjm_left_or_right_diet 2000.0;_������ģ��ֵ
      wjm_Y_diet 2e-06;_��Y��ģ��ֵ
      wjm_jsjdiv_diet "[=-]";_������ָ���
      wjm_paxis_layer "paxis";_����ͼ��
      wjm_colu_layer	"####" ;_��ͼ��
      wjm_wall_layer "*WALL*,*ǽ*,*COLU*,*��*";_ǽ��ͼ��
      wjm_beam_layer "*beam*,*��*";_��ͼ��1
      wjm_beam_single_bottom "1" ;_���ĵ׽����������,ֻ��һ��ֵ.
      wjm_node_min_dis 800     ;_getintpoint�õ��Ľڵ�����̫����ʱ��,���ܳ������ڵ������ڵ�,��ʱֻ����һ���ڵ����.
      �ֽ�ͼ�� "*�ֽ�"
      )
(setq ���� nil)

(princ "��ӭʹ�������У�Գ���\n
���κν����뵽www.wujimmy.com����.\n
ʹ������ckbeam���������У��\n
ʹ������cbinit����У������.")

(defun c:ckbeam	(/ *error* XMLHTTP)
 (vl-load-com)

  ;;;���غ���.
;;;  (if (not ����)
;;;    (progn
;;;  (setq funlist (list "jsschuli" "getintpoint" "checkvar" "get_focus_dim" "setmyvar" "cbinit" "wjmtool" "ac_bonus"))
;;;  (foreach fun funlist
;;;     (eval(read (strcat "(if (null " fun ") (load \"" fun ".lsp\"))\"")))
;;;    )
;;;  ))
  
    (init_bonus_error 
    (list
      (list "cmdecho" 0 "osmode"  0
      )
      T     ;flag. True means use undo for error clean up.
      ;|ckbeamerror|;
    );list  
  );init_bonus_error

  (defun *error*(msg)
;;;      (printerror
;;;	      (midpt(dxf 10)(dxf 11))
;;;	      (strcat "���ִ���:" msg)
;;;	    )
    (princ (strcat "���ִ���:" msg))
    )

  
  
;;;  (msgcrypt "(alert 'ok')")
  (command "_layer" "n" "wujimmy_Error" "")
  (command "_.layer" "s" "wujimmy_Error" "")
  

  
  (setq pt_second(GETCORNER (setq pt_first (getpoint "\nѡȡͼ�εĵ�һ���ǵ�:"))
    "\nѡȡͼ�εĵڶ����ǵ�:"
    ))
  
  (progn (setq ss (ssget "C" pt_first pt_second (list (cons 0 "LINE") (cons 8 wjm_paxis_layer)))   ca_midt 0))
  (if ss
    (progn
        ;;;ɾ��ԭ������ʾ��Ϣ
      (if (ssget "C" pt_first pt_second (list (cons 8 "wujimmy_Error,wjm_*beam")))
	(progn
	  ;(command "_undo" "be")
	  (command "erase" "P" "")
	  ;(command "_undo" "e")
	)
      )
      (command "_undo" "be" )
      (setq wjm_paxis_list nil);_�����б�.
      (setq wjm_colu_list  nil);_���б�.
      (setq wjm_wall_list  nil);_ǽ�б�.
      (setq wjm_beam_list  nil);_�����б�.
      (setq wjm_abeam_list nil);_�����б�.
      (setq wjm_focus_dim_list nil);_���б��б�.
      (setq wjm_ent_list nil);_���õ���ʵ���б�.
      (setq progresslen (sslength ss)
	    progresscur 0);_���ý�����ʾ��ʼ����.
      (setq errornum 0)   ;_���ô��������ʼ��.
      (read-ini-file);_��ȡ�����ļ�.

      ;;;�����Զ������.....................................
        (if (and (not checkbeam-user-loaded) (findfile "checkbeam-user.lsp"))
        (load (findfile "checkbeam-user.lsp")))
      ;;;�����Զ������.....................................

      ;;_1.������������Ϣ,��������,������,��������,�����.
      (setq ss_length (sslength ss))
      (setq progress_index 0)
      (princ "\n�����������...\n")
    (while (setq en (ssname ss 0))
      (myprogress (setq progress_index (1+ progress_index)) ss_length)
      (ssdel en ss)
      (setq ent (entget en))
      (setq wjm_cur_paxis_index (strcat "z:" (cdr (assoc 5 ent))));_���߱��.
      (if (= (cdr (assoc 5 ent)) "AA86")(princ))
;;;      (setq wjm_paxis_list (append
;;;			     wjm_paxis_list
;;;			     (list
;;;			       (list (strcat "Z:" (cdr (assoc 5 ent)))
;;;				     (cons 1 nil)
;;;				     (cons 2 nil)
;;;			       )
;;;			     )
;;;			   ))
      (setq mid (wjmf_sort (list(cdr (assoc 10 ent))(cdr (assoc 11 ent)))))
      (setq wjm_pt_paxis_left (car mid));_ȫ�ֱ���,������˵�.
      (setq wjm_pt_paxis_right (cadr mid));_ȫ�ֱ���,�����Ҷ˵�.
      (setq mid nil)
	     
      ;(setq listzxjd (getintpoint en)) ;_���߽����б�1
      (setq wjm_paxis_colu_list (getcolulist en));_���������б�.
      (setq wjm_paxis_wall_list (getwalllist en));_������ǽ�б�.
      ;(setq wjm_paxis_beam_list (getbeamlist en));_���������б�.
      
            
      (setq wjm_paxis_beam_list nil)
      (setq wjm_paxis_focus_dim_list nil)
      ;;�����ж��������Ƿ�������,ǽ��֮��Ķ���.
      ;;������һ����,�����жϴ�����֧��.
      ;;���û��,�򽫴��߼��뵽�����б���ȥ.
      (if (OR wjm_paxis_colu_list wjm_paxis_wall_list)
	(progn
	;��һ����,��Ϊ�жϴ���֧��������.
;;;	 (entmakex
;;;	   (list (cons 0 "LINE")
;;;		 (cons 8 "wjm_beam")
;;;		 (assoc 10 (entget en))
;;;		 (assoc 11 (entget en))
;;;	   )
;;;	 )
	 ;;�������У��:
	 (progn
	   ;_1.��������.
	   (setq paxis_ang (angle wjm_pt_paxis_left wjm_pt_paxis_right))

	   ;;_�������ߵĽǶ��ж�ͼ��Ĵ���.
	    

	   ;_2���������������������.
	   (setq wjm_pt_pair_lst (get_beam_pt_lst wjm_paxis_colu_list wjm_paxis_wall_list))
	   (if (eq wjm_debug "2");(SeTq wjm_debug "2")
	     (foreach pt_pair wjm_pt_pair_lst
	       (entmakex
		 (list (cons 0 "LINE")
		       (cons 8 "wjm_beam")
		       (cons 62 5)
		       (cons 10 (car pt_pair))
		       (cons 11 (cadr pt_pair))
		 )
	       )
	     )
	   );_if

	   
	   ;_3.ѭ��ÿ����,������������,�����.��д���ļ�.
           (setq wjm_cur_beam_index 0)
	   (foreach pt_pair wjm_pt_pair_lst
	     (progn
	       (if (eq wjm_debug "2")
		 (entmakex
		   (list (cons 0 "LINE")
			 (cons 8 "wjm_beam")
			 (cons 62 5)
			 (cons 10 (car pt_pair))
			 (cons 11 (cadr pt_pair))
		   )
		 )
	       );_if
	       (if (> (distance (car pt_pair)(cadr pt_pair)) (* 1.0 wjm_left_or_right_diet))
	       (if (eq wjm_debug "1")
		 (progn
		   (setq catchit (vl-catch-all-apply
				   'setmyvar
				   pt_pair
				 )
		   ) ;_���ñ�������׽����
		   (if (vl-catch-all-error-p catchit)
		     (progn (princ "\n��ȡ�����,��������ʱ��׽������:")
			    (princ (vl-catch-all-error-message catchit))
		     )
		     (progn
		       (if catchit;_����������.
			 (progn
			   (setq 
				 wjm_paxis_beam_list
				  (append wjm_paxis_beam_list(list (cons wjm_cur_beam_index catchit)))
				 wjm_cur_beam_index (1+ wjm_cur_beam_index)
				 )
			   (entmakex
		         (list (cons 0 "LINE")
			 (cons 8 "wjm_beam")
			 (cons 62 5)
			 (cons 10 (car pt_pair))
			 (cons 11 (cadr pt_pair))
		   )
		 )
			   
			   
			 );_progn
			 );_if
		       )
		   )
		 )
		 (progn
		   (setq catchit (setmyvar (car pt_pair)(cadr pt_pair)))
		   (if catchit
		     (progn
		     (setq
		       wjm_paxis_beam_list
			(append	wjm_paxis_beam_list
				(list (cons wjm_cur_beam_index catchit))
			)
		       wjm_cur_beam_index;_ȫ�ֱ���.
			(1+ wjm_cur_beam_index)
		     )
		     (entmakex
		         (list (cons 0 "LINE")
			 (cons 8 "wjm_beam")
			 (cons 62 5)
			 (cons 10 (car pt_pair))
			 (cons 11 (cadr pt_pair))
		   )
		 )
		     
		     )
		   )
		   )
	       ) ;_if
		 )
	       
	     )
	   )
	   (setq wjm_paxis_list
		  (append
		    wjm_paxis_list
		    (list
		      (list wjm_cur_paxis_index     ;_���߱��.
			    (cons 1 wjm_paxis_beam_list);_�������б�.
			    (cons 2 wjm_paxis_focus_dim_list);_���б��б�.
		      )
		    )
		  )
	   )	   

	   );_progn
	);_progn
	(progn
	 (setq wjm_abeam_list (append wjm_abeam_list (list en)))
	 );_progn
      );_if


;;;      (setq temp_pt "0:0")
      (if (eq wjm_debug "2")
	(foreach temp_pt wjm_paxis_colu_list
	(progn
	  (entmakex
	    (list (cons 0 "CIRCLE")
		  (cons 8 "wujimmy_Error")
		  (cons 40 500)
		  (cons 10 (convert_string_to_int_lst temp_pt))
		  (list -3 (list "PE_URL" (cons 1000  "��ʱ��")))
	    )
	  )
	);_progn
      );_foreach
	);_if
      

     
      
    ) ;_while(setq en (ssname ss 0))

      ;_1.2�����������.


      (setq progress_index 0)
      (setq list_length (length wjm_abeam_list))
      (princ "\r�����������...\n")
      (foreach en wjm_abeam_list
	(progn
	  ;;������ʾ.	       
	   (myprogress (setq progress_index (1+ progress_index)) list_length)
           (setq ent (entget en))
           (setq wjm_cur_paxis_index (strcat "c:" (cdr (assoc 5 ent))));_���߱��.
	   (setq mid (wjmf_sort (list(cdr (assoc 10 ent))(cdr (assoc 11 ent)))))
           (setq wjm_pt_paxis_left (car mid));_ȫ�ֱ���,������˵�.
           (setq wjm_pt_paxis_right (cadr mid));_ȫ�ֱ���,�����Ҷ˵�.
           (setq mid nil)
           (setq listzxjd (get-abeam-int-point en)) ;_���߽����б�1
           ;;;ѭ����Խ��к˶�.
	  (setq i% 0)
	  (setq wjm_cur_beam_index 0
		wjm_paxis_beam_list nil)
	  
	  	   ;_1.��������.
	   (setq paxis_ang (angle wjm_pt_paxis_left wjm_pt_paxis_right))
            ;;_�������ߵĽǶ��ж�ͼ��Ĵ���.
	  (repeat (1-(length listzxjd))
	    (setq ptleft (nth i% listzxjd) ptright(nth (setq i% (1+ i%)) listzxjd))

	    ;;ѭ��ÿ�����,������������,�����.��д���ļ�.
	       (if (eq wjm_debug "3");_(setq wjm_debug "3")
		 (entmakex
		   (list (cons 0 "LINE")
			 (cons 8 "wjm_abeam")
			 (cons 62 5)
			 (cons 10 ptleft)
			 (cons 11 ptright)
		   )
		 )
	       );_if
	       (if (eq wjm_debug "1")		 
		 (progn
		   (setq catchit (vl-catch-all-apply
				   'setmyvar
				   (list ptleft ptright)
				 )
		   ) ;_���ñ�������׽����
		   (if (vl-catch-all-error-p catchit)
		     (progn (princ "\n��ȡ�����,��������ʱ��׽������:")
			    (princ (vl-catch-all-error-message catchit))
		     )
		     (progn
		       (if catchit;_����������.
			 (progn
			   (setq 
				 wjm_paxis_beam_list
				  (append wjm_paxis_beam_list(list (cons wjm_cur_beam_index catchit)))
				 wjm_cur_beam_index (1+ wjm_cur_beam_index)
				 )
			   
			 );_progn
			 );_if
		       )
		   )
		 )
		 (progn
		   (setq catchit (setmyvar ptleft ptright))
		   (if catchit
		     (setq
		       wjm_paxis_beam_list
			(append	wjm_paxis_beam_list
				(list (cons wjm_cur_beam_index catchit))
			)
		       wjm_cur_beam_index;_ȫ�ֱ���.
			(1+ wjm_cur_beam_index)
		     )
		   )
		   )
	       ) ;_if

	    );_repeatѭ����Խ��к˶�.
	  ;;�Ѹö���д�뵽����Ϣ����.
	  (setq wjm_paxis_list
		  (append
		    wjm_paxis_list
		    (list
		      (list wjm_cur_paxis_index     ;_���߱��.
			    (cons 1 wjm_paxis_beam_list);_�������б�.
			    (cons 2 wjm_paxis_focus_dim_list);_���б��б�.
		      )
		    )
		  )
	   )
	  )
	)

	   ;_2.�����б�ע��λ����.
	   ;_ԭ����������,ͨ�������б�ע��ſ�ѡ,��ȡ����,�������a,
	   ;_ͨ������a,�����ֽǶ�,��ѡ���߼�����,��������Ϣ�����ߵ���.
	   ;_ͨ����,�жϸ��߸�������,�������������,���ø����ٴν���,������ǰ����߽���F����.
	   ;_����F�Ľ��,���н�һ���ж�.��F��������,��,���ǿ������õĶ���.
	   (if (eq wjm_debug "1")
	     (progn
	       (setq catchit (vl-catch-all-apply
			       'get_focus_dim_line
			       '()
			     )
	       )
	       ;;������ͳ�������.
	       (if (vl-catch-all-error-p catchit)
		 (progn	(princ "\n��ȡ�����б�עʱ��׽������:")
			(princ (vl-catch-all-error-message catchit))
		 )
	       )
	     ) ;_progn
	     (get_focus_dim_line)
	   )

	   
	   ;_4.�ظ�����.
	   ;_�����������ߵľ������ж�����Ĺ�������.

      

      
      (progn;_�����˶�.
	   ;_5.У������.
	   (setq progress_index 0)
	   (setq list_length (length wjm_paxis_list))
	   (princ "\r�����У�Թ���...\n")
	   (foreach wjm_paxis wjm_paxis_list;_�����б�.
	     (progn
	       ;;������ʾ.
	       
	       (myprogress (setq progress_index (1+ progress_index)) list_length)
	       	       
	       (setq beam_info_list (cdr(assoc 1 (cdr wjm_paxis))))
	       (setq foucs_info_list (cdr(assoc 2 (cdr wjm_paxis))))
	       
	       
	       ;��ȡ���б�ע.
	       (setq beam_index 1)
	       (setq foucs_index 0)
	       (foreach	beam_info beam_info_list ;_���б�.
		 (progn
		   (setq wjm-beam-info-lst nil)		   
		   (if foucs_info_list
		     (progn
		       (setq hand (nth foucs_index foucs_info_list))
		       (if hand
			 (set-var-focus hand)
			 (progn
			   (setq hand  (nth (setq foucs_index(1- foucs_index)) foucs_info_list))
			   (setq pt_mid (handent hand))
			   (setq pt_mid (entget pt_mid))
			   (setq pt_mid (cdr (assoc 10 pt_mid)))
			   ;;(printerror pt_mid "�����б�ע�п��������")
			 )
		       )		       

		       (if (member "123FD7" foucs_info_list)
			 (princ)
		       )
		       (if (>= beam_index
			       (cdr (assoc 1050 wjm-beam-info-lst))
			   )
			 (progn	(setq foucs_index (1+ foucs_index))
			 )
		       ) ;_Ϊ��һ������׼��.����������,������һ�����б�ע.					 
		     )
		   )


		   

		   (setq beam_info (cdr beam_info))
		   (set-dxf 10 (cdr (assoc 10 beam_info)))
                   (set-dxf 11 (cdr (assoc 11 beam_info)))		   
		   (setq jsj_list(pre-jsj-set-var beam_info));_���ü��������.
                   (setq gj_list (pre-gj-set-var beam_info));_���øֽ����.
		   (check-gj-vs-jsj);_��������.
		   ;;(princ wjm-beam-info-lst)
		   ;;(princ "\n==========================\n")
		   (setq beam_index (1+ beam_index))
		 )
	       )	       
	     )
	   )
	)

      (progn;_����У��.
	

	)
      
      (if (ssget "X" (list (cons 8 "wjm_*beam")))
	(progn	  
	  (command "erase" "P" "")	  
	)
      )
    (princ (strcat "\r�ܹ��������:" (rtos errornum)))
    );_progn
    (progn (princ "\nûѡ������\n�ֽ������ó���\n")(c:cbinit))
  ) ;_if ss
  (command "_undo" "e" )
  
  (princ)
  (restore_old_error)
) ;_������ defun c:ckbeam

;;;��ӡ������Ϣ,������Ϣ������errortext��,
(regapp "PE_URL")
(defun printerror (pt errortext / ent)
  
 (setq ent(entmakex
	    (list (cons 0 "CIRCLE")
		  (cons 8 "wujimmy_Error")
		  (cons 40 (+ 800 (* 100 (rem errornum 5))))
		  (cons 10 pt)
		  (list -3 (list "PE_URL" (cons 1000 errortext)))
	    )
	  ))
  (setq errornum (1+ errornum))
  ent
)

;;;���ܽ��ܺ���1
(if (or (null MsgCrypt)(null MsgUnCrypt))
  (progn
(defun MsgCrypt(sData / mi_wen)
  (setq mi_wen(crypt (vl-string->list sData) (vl-string->list cadqq-session)))
  (setq mi_wen(base64encode mi_wen))
  mi_wen
)

  (defun MsgUnCrypt(sData / min_wen)
  (setq mi_wen (base64decode sData))
  (setq min_wen(crypt mi_wen (vl-string->list cadqq-session)))
  (setq min_wen(vl-list->string min_wen))
  min_wen
)
)
);_���ܽ��ܺ���1

(defun GetTickCount (/)
  (menucmd "M=$(edtime,$(getvar,date),YYYYMDHHMMSS)")
  ;(menucmd "M=$(edtime,$(getvar,date),YYYY-M-D HH:MM:SS)")
)

;;;������Ϣ����1
(if (null PostMsg)
  (progn
    (defun PostMsg (server sData CBFun / XMLHTTP)
;;;  (VL-LOAD-COM)
      (if (null xmlhttp)
	(setq XMLHTTP (vlax-create-object "Microsoft.XMLHTTP"))
      )
      (vlax-invoke-method
	XMLHTTP
	"open"
	"post"
	(strcat server sData)
	nil
	nil
	nil
      )
      (vlax-invoke-method XMLHTTP "send" "")
      (if CBFun ;_ͬ��ģʽ,ֱ���յ���Ϣ�Ż�
	(progn
	  (setq CBFList (append CBFList (list (list CBFun XMLHTTP))))
	)
	(progn (while (/= 4 (vlax-get-property XMLHTTP "readyState")))
	       (setq ret (vlax-get-property XMLHTTP "responseBody"))
	       (progn
		 (setq mid (BytesToBstr ret))
		 (if mid (setq ret mid) (setq ret (vlax-get-property XMLHTTP "responseText")) )
		 (vlax-release-object XMLHTTP)
		 ret
	       )
	)
      )
    ) ;_������Ϣ����1
;;;ת��ԭ��Ĭ�ϵ�UTF-8����ת����GB2312���룬����ֱ����XMLHTTP�����������ַ�����ҳ�õ��Ľ�������
(defun BytesToBstr (xmlbody)	   
  (if (/= 0 (vlax-variant-type xmlbody))
    (progn					;(setq xmlbody (vlax-get-property xmlhttp  "responseBody"))
      (setq objstream (vlax-create-object "adodb.stream"))
      (if  objstream(progn
      (vlax-put-property objstream "Type" 1)
      (vlax-put-property objstream "Mode" 3)
      (vlax-invoke-method objstream "open" nil nil nil nil nil)
      (vlax-invoke-method objstream "Write" xmlbody)
      (vlax-put-property objstream "Position" 0)
      (vlax-put-property objstream "Type" 2)
      (vlax-put-property objstream "Charset" "GB2312")
      (setq xmlbody(vlax-invoke-method objstream "ReadText" nil))
      )
	(setq xmlbody nil)
	)
    )    
  )
   xmlbody
)
)
 
)

(setq wjm-beam-info-lst
  (list
  (cons 10 wjm_pt_paxis_left);_����ڵ�.
  (cons 11 wjm_pt_paxis_right);_���ҽڵ�.
  (cons 40 beam-b)(cons 41 beam-h);_����,����.
  (cons 101 tl)(cons 102 tm)(cons 103 tr)(cons 104 bl)(cons 105 bm)(cons 106 br)(cons 107 gl)(cons 108 gr)
  (cons 201 ttl)(cons 202 ttm)(cons 203 ttr)(cons 204 bbl)(cons 205 bbm)(cons 206 bbr)(cons 207 ggl)(cons 208 ggr)
  (cons 301 tttl)(cons 302 tttm)(cons 303 tttr)(cons 304 bbbl)(cons 305 bbbm)(cons 306 bbbr)(cons 207 gggj)
  (cons 401 ttttl)(cons 402 ttttm)(cons 403 ttttr)(cons 404 bbbbl)(cons 405 bbbbm)(cons 406 bbbbr)(cons 207 ggggj)
  
  (cons 1001 (caadr wjm_cur_focus_text)) (cons 1002 (cadadr wjm_cur_focus_text));_����,����ͨ����.
  (cons 1003 (caaddr wjm_cur_focus_text)) (cons 1004 (car(cdaddr wjm_cur_focus_text)));_�����б�ע����.
  (cons 1007 "Ԥ����Ť��")
  (cons 1008 "Ԥ������")
  (cons 1009 (cadddr wjm_cur_focus_text));_�����.
  (cons 1040 (caar(cddddr wjm_cur_focus_text)));_����
  (cons 1041 (cadar(cddddr wjm_cur_focus_text)));_����.
  (cons 1307 cur_focus_gg_text);_���б�ע�����ı�.
  )
)
;;;���������������.
(defun check-gj-vs-jsj (/ dxf hand ;_error-info error-list
			)
  (defun dxf (info-type)
    (cdr (assoc info-type wjm-beam-info-lst))
  )
  (setq error-list nil)
  (setq error-text-list
	 '((4011 . "�������������ڿ�")
	   (4012 . "�����������󱾿�")
	   
	   (402  . "����������ͨ����")(1001  . "���������б�עͨ�����")
	   
	   (4031 . "�������������ڿ�")
	   (4032 . "�����������ұ���")
	   
	   (4041 . "�������������ڿ�")
	   (4042 . "�����������󱾿�")
	   
	   (4051 . "�������������ڿ�")
	   (4052 . "�����������ұ���")
	   
	   (405  . "����������ͨ����")(1002  . "���������б�ע����ͨ����")
	   )
	 )
  (setq checked_dxf_list nil)
;;;  ((4011 . 101)(4012 . 101)(1001 . 101)
;;;		    (402 . 102)             (1001 . 102)
;;;		    (4031 . 103)(4032 . 103)(1001 . 103)
;;;		    (4041 . 104)(4042 . 104)(1002 . 104)
;;;		    (405 . 105)             (1002 . 105)
;;;		    (4061 . 106)(4062 . 106)(1002 . 106)
;;;		   )
  (foreach gj-dxf '((4011 . 101)(4012 . 101)(1001 . 101)
		    (402 . 102)             (1001 . 102)
		    (4031 . 103)(4032 . 103)(1001 . 103)
		    (405 . 104)(1002 . 104)
		    (405 . 105)             (1002 . 105)
		    (405 . 106)(1002 . 106)
		   )
    (if	(and(setq hand (dxf (car gj-dxf)))(setq jsj_area (dxf (cdr gj-dxf))))	; (cdr '(402 . 102))
      (progn
	(if (=(type hand) 'REAL)
	  (progn
	    (setq text_area hand)
	    )
	  (progn
	    (setq en (handent hand))
	    (setq ent (entget en))
	    (setq textstr (cdr (assoc 1 ent)))
	    (setq text_area (str-to-area textstr)) ;_(str-to-area "%%1308-100/200(2)")
	    )	
	  )

	(setq checked_dxf_list (append checked_dxf_list
				       (list (strcat (rtos (car gj-dxf)2 0)
						     ":"
						     (rtos (cdr gj-dxf)2 0)
					     )
				       )
			       ))
	(if (and text_area (< text_area (* jsj_area wjm_check_diet)))
	  (progn
	    ;;(setq box (textbox ent))
	    ;;(setq ptmid (cdr (assoc 10 ent)))
	    ;;(setq ptmid (list (+ (car ptmid) ) (cadr ptmid) 0))
	    ;(printerror(midpt(dxf 10)(dxf 11)) "error\nerror\nerror")
	    (setq error-list (append
			       error-list
			       (list (list (strcat (rtos (car gj-dxf) 2 0)
						     ":"
						     (rtos (cdr gj-dxf) 2 0)
					     ) 
					   (midpt (dxf 10) (dxf 11))
					   (strcat (cdr(assoc (car gj-dxf) error-text-list))
						   "\n����\n������:"
						   (rtos jsj_area 2 0)
						   "mm2"
						   "\nʵ����:"
						   (rtos text_area 2 0)
					   ) 
				     )
			       )
			     ));_���ô�����Ϣ�б�.
	  )
	  )

      ) ;_progn
    ) ;_if
  ) ;_foreach
  ;;������.
  (if (and(setq hand (dxf 407))(setq jsj_jm_area (dxf 107))(setq jsj_fjm_area (dxf 108)))
    (progn
      (setq en (handent hand))
      (setq ent (entget en))
      (setq textstr (cdr (assoc 1 ent)))
      (setq text_area (str-to-area textstr)) ;_(str-to-area "%%1308-100/200(2)")
      ;(setq checked_dxf_list (append checked_dxf_list (list 407)))
      (if (or (< (car text_area) (* jsj_fjm_area wjm_check_diet 0.01))
	      (< (cadr text_area) (* jsj_jm_area wjm_check_diet 0.01))
	  )
	(progn
	  ;;(setq box (textbox ent))
	  ;;(setq ptmid (cdr (assoc 10 ent)))
	  ;;(setq ptmid (list (+ (car ptmid) ) (cadr ptmid) 0))
	  (setq error-list (append
			       error-list
			       (list (list (car gj-dxf)
					   (midpt (dxf 10) (dxf 11))
					   (strcat "�����\n����    ʵ��\n"
		    (rtos jsj_fjm_area 2 1) "   :   "(rtos (car text_area) 2 1)"\n"
		    (rtos jsj_jm_area 2 1) "   :   "(rtos (cadr text_area) 2 1)
		    )
				     )
			       )
			     ));_���ô�����Ϣ�б�.
	)
      )

    ) ;_progn
    (if (and(setq hand (dxf 407))(setq jsj_jm_area (dxf 107)) (setq jsj_fjm_area (dxf 108)))
      (progn;_���б�ע������.
	(princ)
	)
     )
  )
  
  ;;_�������.
  
  (setq error-remove-list
	 '(
	   ("4012:101" "4011:101");_�б���,��Ҫ�ڿ�.
	   ("4032:103" "4031:103");_�б���,��Ҫ�ڿ�.
	   ;("4042:104" "4041:104");_�б���,��Ҫ�ڿ�.
	   ;("4062:106" "4061:106");_�б���,��Ҫ�ڿ�.
	   
	   ("4011:101" "1001:101");_��ԭλ,��Ҫ����.
	   ("4012:101" "1001:101");_��ԭλ,��Ҫ����.
	   ("402:102" "1001:102");_��ԭλ,��Ҫ����.
	   ("4031:103" "1001:103");_��ԭλ,��Ҫ����.
	   ("4032:103" "1001:103");_��ԭλ,��Ҫ����.
	   ("405:104" "1002:104");_��ԭλ,��Ҫ����.
	   ("405:104" "1002:104");_��ԭλ,��Ҫ����.
	   ("405:105" "1002:105");_��ԭλ,��Ҫ����.
	   ("405:106" "1002:106");_��ԭλ,��Ҫ����.
	   ("405:106" "1002:106");_��ԭλ,��Ҫ����.

	   ("402:102" "1001:101");_��ͨ��,��Ҫ����.
	   ("402:102" "1001:103");_��ͨ��,��Ҫ����.
	   )
   )
  (foreach error-remove-mid error-remove-list
    (progn
      (if (and (member (car error-remove-mid) checked_dxf_list)
	       (member (cadr error-remove-mid) checked_dxf_list))
	(setq error-list (vl-remove (assoc (cadr error-remove-mid) error-list)error-list))
	)
     ))
;;;(assoc "4031:103" error-list)
  ;;_�������.
  (foreach error-info error-list
    (progn      
      (printerror
	(cadr error-info)
	(caddr error-info)
      )
    )
  )







  
)

;;;�ж�ʵ��ֽ��Ƿ�����Ҫ��
 ;_ģʽ1:�����ϲ��ṹ�õ�ģʽ,������tl,tm,tr ,�׽�ֻ��һ��(max bl bm br)
 ;_ģʽ2:�������õ�ģʽ(�����ҵװ���),�����ֻ��һ��tl=tm=tr=(max bl bm br),�׽��bl,bm,br
 ;_ģʽ3:����ģʽ,������tl,tm,tr ,�׽�Ҳ��bl,bm,br

;;;(����ڵ�,���ҽڵ�,�����б�ע,��ԭλ��ע,�������ڵĿ���)



(defun checkvar	(/)
  
;;;(setq wjm-beam-info
;;;       (list ptleft ;_����ڵ�.
;;;	     ptright ;_���ҽڵ�.
;;;	     wjm_cur_focus_text ;_�����б�ע.
;;;	     (list (list beam-b beam-h) ;_��������.
;;;		   (list ttl ttm ttr bbl bbm bbr ggl ggr) ;_��ʵ��ֽ�,��������,����,����,�ײ�����,��������,���������,�Ǽ�����.
;;;		   (list tl tm tr bl bm br gjl gjr) ;_������ֽ�,��������,����,����,�ײ�����,��������,���������,�Ǽ�����.
;;;                   (list tttl tttm tttr bbbl bbbm bbbr gggj);_��ԭλ��ע����������.
;;;		   (list ttttl ttttm ttttr bbbbl bbbbm bbbbr ggggj);_��ԭλ��ע���ֵ�entname
;;;		   )
;;;       )
;;;)
;;;  (3 (nil 936.195 1520.53) (1.00531 2.01062) "A*" (400 800) "%%1308-100/200(4)")
  
  (setq wjm-beam-info-lst
  (list
  (cons 10 wjm_pt_paxis_left);_����ڵ�.
  (cons 11 wjm_pt_paxis_right);_���ҽڵ�.
  (cons 40 beam-b)(cons 41 beam-h);_����,����.
  (cons 101 tl)(cons 102 tm)(cons 103 tr)(cons 104 bl)(cons 105 bm)(cons 106 br)(cons 107 gl)(cons 108 gr)
  (cons 201 ttl)(cons 202 ttm)(cons 203 ttr)(cons 204 bbl)(cons 205 bbm)(cons 206 bbr)(cons 207 ggl)(cons 208 ggr)
  (cons 301 tttl)(cons 302 tttm)(cons 303 tttr)(cons 304 bbbl)(cons 305 bbbm)(cons 306 bbbr)(cons 207 gggj)
  (cons 401 ttttl)(cons 402 ttttm)(cons 403 ttttr)(cons 404 bbbbl)(cons 405 bbbbm)(cons 406 bbbbr)(cons 207 ggggj)
  
  (cons 1001 (caadr wjm_cur_focus_text)) (cons 1002 (cadadr wjm_cur_focus_text));_����,����ͨ����.
  (cons 1003 (caaddr wjm_cur_focus_text)) (cons 1004 (car(cdaddr wjm_cur_focus_text)));_�����б�ע����.
  (cons 1007 "Ԥ����Ť��")
  (cons 1008 "Ԥ������")
  (cons 1009 (cadddr wjm_cur_focus_text));_�����.
  (cons 1040 (caar(cddddr wjm_cur_focus_text)));_����
  (cons 1041 (cadar(cddddr wjm_cur_focus_text)));_����.
  (cons 1307 cur_focus_gg_text);_���б�ע�����ı�.
  )
)

  
  (setq errortext "")
  ;;;;
  
  (if checkbeam-user
    (progn
      	(setq catchit (vl-catch-all-apply 'checkbeam-user (list wjm-beam-info-lst)));_ִ���û��Զ������ʱ��������.
        (if(vl-catch-all-error-p catchit) (progn (princ "\nִ���û��Զ������ʱ��������.:")(princ (vl-catch-all-error-message catchit))))

      (checkbeam-user wjm-beam-info-lst)
      
      )
    )
  ;;;;
  (if (and tl tm tr bl bm br gjl gjr)
    (progn
      (cond
	((eq ���ģʽ 1)
	 (setq bl (max bl bm br)
	       bm bl
	       br bl
	 )
	 
	) ;_(eq ���ģʽ 1)
	((eq ���ģʽ  2)
	 (setq mid (max bl bm br)
	       bl  tl
	       bm  tm
	       br  tr
	       tl  mid
	       tm  mid
	       tr  mid
	 )
	) ;_(eq ���ģʽ 2)***

      ) ;_cond

      (progn
;;;�жϹ���
        (if ggjr ggjr (setq ggjr(caaddr wjm_cur_focus_text)))
	(if ggjl ggjl (setq ggjl(cadr(caddr wjm_cur_focus_text))))
	(if (and ggjr
		 ggjl
		 (or (if (< ggjl gjl)
		       (setq errortext "��")
		       (progn (setq errortext "��") nil)
		     ) ;_������
		     (if (< ggjr gjr)
		       (setq errortext (strcat errortext "��"))
		       (progn (setq errortext(strcat errortext "��")) nil)
		     )
		 )
	    ) ;_�Ǽ�����
	  (progn 	    
	      (myprinc "Error:ʵ�乿���!")
	      (myprinc (list ttl (* 1 tl)))
	      (setq
		errortext (strcat  errortext":�����!\n������:"
				  (rtos ggjl 2 2)
				  "\t����:"
				  (rtos gjl 2 2)
				  "\n�Ǽ�����:"
				  (rtos ggjr 2 2)"\t����:"(rtos gjr 2 2)
			  )
	      )(printerror)(vla-put-Color (vlax-ename->vla-object (entlast)) acYellow)
	  );_progn
	  
	);_if
;;;�ж��ϲ���
(if (if ttm ttm (setq ttm(caadr wjm_cur_focus_text)))
	  (if (< ttm (* wjm_check_diet tm))
	    (progn (myprinc "Error:ʵ��ֽ��!")
		   (myprinc (list ttm (* wjm_check_diet tm)))
		   (setq
		     errortext (strcat "����������ͨ����:ʵ��ֽ��!\nʵ��"
				       (rtos ttm)
				       "\n����ֵ:"
				       (rtos tm)
			       )
		   )(printerror)
	    )
	  )
	)


	(if (if ttl ttl (setq ttl ttm))
	  (if (< ttl (* wjm_check_diet tl))
	    (progn
	      (myprinc "Error:ʵ��ֽ��!")
	      (myprinc (list ttl (* wjm_check_diet tl)))
	      (setq
		errortext (strcat "������������:ʵ��ֽ��!\nʵ��"
				  (rtos ttl)
				  "\n����ֵ:"
				  (rtos tl)
			  )
	      )(printerror)
	    )
	  )
	)
	
	(if (if ttr ttr (setq ttr ttm))
	  (if (< ttr (* wjm_check_diet tr))
	    (progn
	      (myprinc "Error:ʵ��ֽ��!")
	      (myprinc (list ttr (* wjm_check_diet tr)))
	      (setq
		errortext (strcat "������������:ʵ��ֽ��!\nʵ��"
				  (rtos ttr)
				  "\n����ֵ:"
				  (rtos tr)
			  )
	      )(printerror)
	    )
	  )
	)
;;;�ж��²��ݽ�.

	(if
	  (if bbm
		bbm
		(setq bbm (cadadr wjm_cur_focus_text))
	      )	    
	  (progn
	    (if	(eq wjm_beam_single_bottom "1")
	      (progn		
		(setq bbm (max bbm (if bbl bbl 0) (if bbr bbr 0))
		      bbl nil
		      bbr nil
		)
	      )
	    ) ;_if
	  ) ;_progn
	) ;_if
	
        (if bbm
	  (if (< bbm (* wjm_check_diet bm))
	    (progn (myprinc "Error:ʵ��ֽ��!")
		   (myprinc (list bbm (* wjm_check_diet bm)))
		   (setq
		     errortext
		      (strcat "����������ͨ����:ʵ��ֽ��!\nʵ��"
			      (rtos bbm)
			      "\n����ֵ:"
			      (rtos bm)
		      )
		   )(printerror)
	    )
	  )
	)
	(if bbl
	  (if (< bbl (* wjm_check_diet bl))
	    (progn (myprinc "Error:ʵ��ֽ��!")
		   (myprinc (list bbl (* wjm_check_diet bl)))
		   (setq
		     errortext
		      (strcat "������������:ʵ��ֽ��!\nʵ��"
			      (rtos bbl)
			      "\n����ֵ:"
			      (rtos bl)
		      )
		   )(printerror)
	    )
	  )
	)
	
	(if bbr
	  (if (< bbr (* wjm_check_diet br))
	    (progn (myprinc "Error:ʵ��ֽ��!")
		   (myprinc (list bbr (* wjm_check_diet br)))
		   (setq errortext
			  (strcat "������������:ʵ��ֽ��!\nʵ��"
				  (rtos bbr)
				  "\n����ֵ:"
				  (rtos br)
			  )
		   )(printerror)
	    )
	  )
	)
      ) ;_progn
    ) ;_progn
    (if (and (eq wjm_lose_jsj "1") (or tl tm tr bl bm br gjl gjr))
        (progn(setq errortext (strcat "���ּ������޷����"))(printerror))
      )
  ) ;_if (and tl tm tr bl bm br)

(if (eq wjm_debug "1")
     (progn
       (setq debug_color 253)
       (command "circle" (car pt_pair) 500 )
       (vla-put-Color (vlax-ename->vla-object (entlast)) debug_color)
       (mySetXData
	 (vlax-ename->vla-object (entlast))
	 (strcat "INFO:\n����ʵ��"
		 (if ttl(rtos ttl ) "��")
		 "\t����ֵ:"
		 (if tl(rtos tl) "��")
		 "\n����ʵ��:"
		 (if bbl (rtos bbl) "��")
		 "\t����ֵ:"
		 (if bl (rtos bl) "��")
	 )	 
       )
       (command "circle" (cadr pt_pair) 1000 )
       (vla-put-Color (vlax-ename->vla-object (entlast)) debug_color)
       (mySetXData
	 (vlax-ename->vla-object (entlast))
	 (strcat "INFO:\n����ʵ��"
		 (if ttr(rtos ttr) "��")
		 "\t����ֵ:"
		 (if tr(rtos tr) "��")
		 "\n����ʵ��:"
		 (if bbr (rtos bbr) "��")
		 "\t����ֵ:"
		 (if br (rtos br) "��")
	 )
       )
       (command "circle" (midpt (car pt_pair) (cadr pt_pair)) 800 )
       (vla-put-Color (vlax-ename->vla-object (entlast)) debug_color)
       (mySetXData
	 (vlax-ename->vla-object (entlast))
	 (strcat "INFO:\n����ʵ��"
		 (if ttm (rtos ttm) "��")
		 "\t����ֵ:"
		 (if tm (rtos tm) "��")
		 "\n����ʵ��:"
		 (if bbm (rtos bbm) "��")
		 "\t����ֵ:"
		 (if bm (rtos bm) "��")
		 "\n����:"
		 (if beam-b (rtos beam-b) "��")
		 "X"
		 (if beam-h (rtos beam-h) "��")
	 )
       )
       (command "circle" (midpt (car pt_pair) (cadr pt_pair)) 400 )
       (vla-put-Color (vlax-ename->vla-object (entlast)) debug_color)
       (mySetXData
	 (vlax-ename->vla-object (entlast))
	 (strcat "INFO:\n���б�ע"
		 (if ttm (rtos ttm) "��")
		 "\t����ֵ:"
		 (if tm (rtos tm) "��")
		 "\n����ʵ��:"
		 (if bbm (rtos bbm) "��")
		 "\t����ֵ:"
		 (if bm (rtos bm) "��")
	 )
       )
       

     ) ;_progn

    );_if (eq wjm_debug "1")


  

);_defun checkvar


;(setq mid (read-ini-file))
(defun read-ini-file(/  mid)
  (setq ret "")
  (if (setq ini_filepath(findfile "checkbeam.ini"))
    (progn
      (setq ini_file(open ini_filepath "r"))
      (while (setq rule_text (read-line ini_file))
	(if (/= (setq mid (rule-resolve rule_text))"")
	  (progn ;(princ "\nrule_text:")
		 ;(princ mid)
	    (setq ret (strcat ret mid))
	  )
	)
	)
      )
    );_if
  (setq ret (strcat "(defun checkvar ( / value_list ) " ret  " value_list)"))
  ;(princ ret)
  (setq ret (eval(read ret)))
  ret
  )
;����һ�е���Ϣ.
(defun rule-resolve(rule_text / ret  +-*/
		    rule_lisp rule_text_lisp mid midstr)
  ;Ȩ�����Ӻ���.
  ;(value-add "left")
  (defun value-add (ret)
  (if (assoc ret value_list)
    (progn
      (setq value_list (subst (cons ret (1+ (cdr(assoc ret value_list))))(assoc ret value_list)value_list))
      )
    (progn
      (setq value_list (append value_list (list (cons ret 1))))
      )
    );_if
    );_defun value-add.
  ;(+-*/ "(5-7)-5*(6+8)*7+(9+6)*7")
  ;(+-*/ "5*6-5+7/(9*5.0)/8")

  (setq rule_lisp "" );_��lisp��ʽ����Ĺ������.
  (setq rule_text(car(convert_string_to_string_lst rule_text ";")))
  (setq rule_text_list (convert_string_to_string_lst rule_text ","))
  (setq ret nil)
  (foreach rule_text rule_text_list
    (cond;
      ((wcmatch rule_text "`[*`]")(setq ret (strcat "\"" (substr rule_text 2 (-(strlen rule_text)2)) "\""))) 
      (t
       (if ret
       (setq rule_lisp (strcat rule_lisp "(if " rule_text "(value-add " ret "))" )
	     
       )
	 (setq rule_lisp (strcat rule_lisp  rule_text))
       )
	 )
    )
  )
  rule_lisp
)
;���������������������.
(defun get_beam_pt_lst(
       wjm_paxis_colu_list wjm_paxis_wall_list / pt_pair_lst i% j% ptleft ptright ptleft_wall
		       ptright_wall ptmid pt_lst pt_pair_lst)
  
  (setq pt_pair_lst nil)
  (setq j% 0);_ǽ��id
  (FOREACH wjm_colu_id wjm_paxis_colu_list
    (setq ptmid (cdadr (assoc wjm_colu_id wjm_colu_list)))
    (setq ptmid (wjmf_shadow ptmid wjm_pt_paxis_left wjm_pt_paxis_right))
    (setq pt_lst(append pt_lst (list(list 0 ptmid))))
    )
  (FOREACH wjm_wall_id wjm_paxis_wall_list
    (setq j% (1+ j%))
    (setq ptleft_wall (cdadr(assoc wjm_wall_id wjm_wall_list)))    
    (setq ptleft_wall (wjmf_shadow ptleft_wall wjm_pt_paxis_left wjm_pt_paxis_right))
    (setq pt_lst(append pt_lst (list(list j% ptleft_wall))))
    
    (setq ptright_wall (cdaddr(assoc wjm_wall_id wjm_wall_list)))
    (setq ptright_wall (wjmf_shadow ptright_wall wjm_pt_paxis_left wjm_pt_paxis_right))
    (setq pt_lst(append pt_lst (list(list j% ptright_wall))))
    )
  ;;;����.
  (setq	pt_lst
	 (vl-sort
	   pt_lst
	   (function
	     (lambda (e1 e2) ; (cadr(list 0 ptmid))
	       (if (< (abs (- (car (cadr e1)) (car (cadr e2)))) wjm_Y_diet) ;_���X�������,����Y��������
		 (< (cadr (cadr e1)) (cadr (cadr e2)))
		 (< (car (cadr e1)) (car (cadr e2)))
	       )
	     )
	   )
	 )
  )
  ;;;���.
  
  (setq i% 0);_����id
  (repeat (1-(length pt_lst))
    (setq ptleft (nth i% pt_lst))
    (setq ptright (nth (1+ i%) pt_lst))
    (if (and (/= (car ptleft) 0) (eq (car ptleft) (car ptright)))
      (progn (1+ 1))
      (progn
	(setq pt_pair_lst(append pt_pair_lst (list (list (cadr ptleft) (cadr ptright)))))
	)
    )

    (setq i% (1+ i%))
    )
  pt_pair_lst
)

;;;(defun get_beam_pt_lst(
;;;       wjm_paxis_colu_list wjm_paxis_wall_list / pt_pair_lst )
;;;  
;;;  (setq i% 0);_����id
;;;  (setq j% 0);_ǽ��id
;;;  (if wjm_paxis_wall_list
;;;  (repeat (1- (length wjm_paxis_colu_list))
;;;    (setq wjm_colu_id (nth i% wjm_paxis_colu_list))
;;;    (setq ptleft (cdadr (assoc wjm_colu_id wjm_colu_list)))
;;;    (setq ptleft (wjmf_shadow ptleft wjm_pt_paxis_left wjm_pt_paxis_right))
;;;    
;;;    (setq wjm_colu_id (nth (1+ i%) wjm_paxis_colu_list))
;;;    (setq ptright (cdadr (assoc wjm_colu_id wjm_colu_list)))
;;;    (setq ptright (wjmf_shadow ptright wjm_pt_paxis_left wjm_pt_paxis_right))
;;;
;;;    (if (nth j% wjm_paxis_wall_list)
;;;      (progn
;;;    (setq wjm_wall_id (nth j% wjm_paxis_wall_list))
;;;    (assoc wjm_wall_id wjm_wall_list)
;;;    (setq ptleft_wall (cdadr(assoc wjm_wall_id wjm_wall_list)))
;;;    
;;;    (setq ptleft_wall (wjmf_shadow ptleft_wall wjm_pt_paxis_left wjm_pt_paxis_right))
;;;    
;;;    (setq ptright_wall (cdaddr(assoc wjm_wall_id wjm_wall_list)))
;;;    (setq ptright_wall (wjmf_shadow ptright_wall wjm_pt_paxis_left wjm_pt_paxis_right))
;;;     );_progn
;;;      (setq ptleft_wall nil
;;;	    ptright_wall nil)
;;;      );_if
;;;    (if (and ptleft_wall ptright_wall (wjmf_pt_little_then ptleft ptleft_wall)
;;;      (wjmf_pt_big_then ptright ptright_wall))
;;;      (progn
;;;      (setq pt_pair_lst(append pt_pair_lst (list(list ptleft ptleft_wall))))
;;;      (setq pt_pair_lst(append pt_pair_lst (list(list ptright_wall ptright))))
;;;      (setq j% (1+ j%))
;;;      );_progn
;;;      (progn
;;;	(setq pt_pair_lst(append pt_pair_lst (list(list ptleft ptright))))
;;;	)      
;;;      );_if
;;;    (setq i% (1+ i%))
;;;    );_repeat
;;;    (progn
;;;      (repeat (1- (length wjm_paxis_colu_list))
;;;	  (setq wjm_colu_id (nth i% wjm_paxis_colu_list))
;;;          (setq ptleft (cdadr (assoc wjm_colu_id wjm_colu_list)))
;;;	  (setq ptleft (wjmf_shadow ptleft wjm_pt_paxis_left wjm_pt_paxis_right))
;;;          (setq wjm_colu_id (nth (1+ i%) wjm_paxis_colu_list))
;;;          (setq ptright (cdadr (assoc wjm_colu_id wjm_colu_list)))
;;;	  (setq ptright (wjmf_shadow ptright wjm_pt_paxis_left wjm_pt_paxis_right))
;;;	
;;;          (setq pt_pair_lst(append pt_pair_lst (list(list ptleft ptright))))
;;;	(setq i% (1+ i%))
;;;	);_repeat
;;;
;;;      );_progn
;;;    );_if  
;;;
;;;  pt_pair_lst
;;;)


(defun wjmf_pt_little_then (pta ptb)
  (equal (wjmf_sort (list pta ptb)) (list pta ptb))
  )


(defun wjmf_pt_big_then (pta ptb)
(equal (wjmf_sort (list pta ptb)) (list ptb pta))
  )

;;;�����������û������.
;���¼��б�ע���ı�����.
(defun update_focus_dim	(/)
  (if wjm_cur_focus_text
    (progn ;_�Ѿ����˼��б�ע�Ķ�����,�������ж�Ҫ��Ҫ����.
      (if (and (eq wjm_focus_text "1")
	       wjm_focus_dimline_lst
	       (= (car wjm_cur_focus_text) wjm_cur_kl_num)
	  ) ;_�ж���������ǲ��Ǵﵽ�ܿ�����
	(setq wjm_cur_focus_text
	       (get_focus_dimtext
		 (car (car wjm_focus_dimline_lst))
		 (cadr (car wjm_focus_dimline_lst))
	       )
	      wjm_focus_dimline_lst
	       (cdr wjm_focus_dimline_lst)
	      wjm_cur_kl_num
	       1
	)
	;_�����û�дﵽ�ܵĿ���,�����ӿ����.
	(setq wjm_cur_kl_num (1+ wjm_cur_kl_num))
      )
    )
    (progn ;_û�м��б�ע�Ķ���,���г�ʼ��.
      (if (and (eq wjm_focus_text "1")
	       (setq wjm_focus_dimline_lst
		      (get_focus_dim_line
			wjm_pt_paxis_left
			wjm_pt_paxis_right
		      )
	       )
	  )
	(progn
	  (setq	wjm_cur_focus_text
		 (get_focus_dimtext
		   (car (car wjm_focus_dimline_lst))
		   (cadr (car wjm_focus_dimline_lst))
		 )
	  ) ;_���б�ע�ı�����cur_focus_klnum cur_focus_jsj cur_focus_gg  cur_focus_bianhao cur_focus_bh
	  (setq wjm_focus_dimline_lst (cdr wjm_focus_dimline_lst))
	)
	(setq wjm_cur_focus_text
	       (list nil
		     (list nil nil)
		     (list nil nil)
		     nil
		     (list nil nil)
	       )
	)
      ) ;_if
    ) ;_progn
  )
)
;_�ú���ִ������ѡ��ķ�ʽ,���ѡ�񲻵�,���Զ��ı�ѡ��ʽ.
;(get_focus_dim_line)
(defun get_focus_dim_line ( / foucs_ss ent en pt_text dim_line paxis_line)
    (setq foucs_ss (ssget "C" pt_first pt_second (list (cons 0 "TEXT") (cons 1 wjm_�����))))

  (if foucs_ss
    (progn
      
      (setq progress_index 0)
      (setq list_length (sslength foucs_ss))
      (princ "\r���б�ע�������...\n")
      (while (setq en (ssname foucs_ss 0))
	
	(myprogress (setq progress_index (1+ progress_index)) list_length)
	(setq focus_text (ssdel en foucs_ss))
	(setq ent (entget en))
	(setq text_pt (cdr (assoc 10 ent)))
	(setq text_ang (cdr (assoc 50 ent)))
	(setq text_height (cdr (assoc 40 ent)))
	(setq text_height 300)
	(setq text_layer (cdr (assoc 8 ent)))
	
	(setq pt_mid (polar text_pt (+ pi text_ang) wjm_focus_line_dis))
	(if(null(setq dim_line (ssget "F" (list text_pt pt_mid) (list (cons 0 "LINE") (cons 8 text_layer)))))
	  (progn ;_�ı�ѡ��ʽ.
	    (setq dim_line (ssget "F" (list text_pt pt_mid) (list (cons 0 "LINE"))))
	   )
	);_if
	(if dim_line
	  (progn
	    (setq dim_line_en (ssname dim_line 0));_����Ҫ�ٿ���һ��.
	    (setq dim_line_ent (entget dim_line_en))
	    (setq dim_line_pt1 (cdr (assoc 10 dim_line_ent)))
	    (setq dim_line_pt2 (cdr (assoc 11 dim_line_ent)))
	    (setq dim_line_angle (angle dim_line_pt1 dim_line_pt2))
	    (setq dim_line_hand (cdr (assoc 5 dim_line_ent)))

	    (progn(setq dis1(distance dim_line_pt1 text_pt))
	        (setq dis2(distance dim_line_pt2 text_pt)))

	    (if (< dis1 (* text_height 1.2))
	      (setq pt_mid dim_line_pt2)
	      (if (< dis2 (* text_height 1.2))
		(setq pt_mid dim_line_pt1)
		;_���������������������.
		(setq pt_mid (polar (midpt dim_line_pt1 dim_line_pt2) (+ (/ pi 2) text_ang) (distance pt_mid dim_line_pt1)))
		)
	      )
	    (if (eq wjm_debug "2")
	    (entmakex
	      (list (cons 0 "CIRCLE")
		    (cons 8 "wujimmy_Error")
		    (cons 40 500)
		    (cons 10 pt_mid)
		    (list -3 (list "PE_URL" (cons 1000 "pt_mid")))
	      )
	    ))
	    
	    ;;
	    ;;�˴��ٴν����ж�,������Щ�����������εļ��б�ע�ٴν��д���.
	    ;;

	    ;;�����ڿ�Ϊ"����"����.
	    (setq i% 1)
            (while pt_mid
	    (setq pt_mid_min (polar pt_mid dim_line_angle;|(* 1.25 pi)|; (* i% wjm_focus_line_dis)))
	    (setq pt_mid_max (polar pt_mid (+ pi dim_line_angle) ;|(* 0.25 pi)|; (* i% wjm_focus_line_dis)))
	    (setq paxis_line
		   (ssget "F"
			  (list pt_mid_min pt_mid_max)
			  (list (cons 0 "LINE")(cons 8 wjm_paxis_layer))
		   )
	    );_���ѡ�񲻵�,������ѡ��Χ.
	      (if paxis_line
		(setq pt_mid nil)
		(setq i% (1+ i%)))
	      (if (> i% 4)(setq pt_mid nil) )
	      );_while
	    ;;�������߽���.
	    ;;�������������,���һ�����˴���.
	    (if	paxis_line
	      (progn (setq paxis_line_en (ssname paxis_line 0)) ;_����Ҫ�ٿ���һ��.
		     (setq paxis_line_ent (entget paxis_line_en))		     
		;;���Ӽ��б�ע�ߵ�������Ϣ����ȥ.
;;;		(setq paxis_mid (assoc (strcat "z:" "BDE") wjm_paxis_list))
		(setq paxis_mid1 (assoc (strcat "z:" (cdr (assoc 5 paxis_line_ent))) wjm_paxis_list))
		(setq paxis_mid2 (assoc (strcat "c:" (cdr (assoc 5 paxis_line_ent))) wjm_paxis_list))
		(if paxis_mid1 (setq paxis_mid paxis_mid1))
		(if paxis_mid2 (setq paxis_mid paxis_mid2))
		(if paxis_mid
		  (progn
		    (if (null(setq dim_line_hand_list (cdr(assoc 2 (cdr paxis_mid)))))
		      ;;ԭ��û�м��б�ע��.
		      (progn
			(setq wjm_paxis_list
			       (subst
				 (list
				     (car paxis_mid) ;_���߱��.
				     (cadr paxis_mid) ;_�������б�.
				     (cons 2 (list dim_line_hand)) ;_���б��б�.
				 ) ;_new
				 paxis_mid ;_old
				 wjm_paxis_list
			       )
			)
			);_progn
		      ;;ԭ���м��б�ע��.
		      (progn
			(setq wjm_paxis_list
			       (subst
				 (list
				     (car paxis_mid) ;_���߱��.
				     (cadr paxis_mid) ;_�������б�.
				     (cons 2
					   (append dim_line_hand_list
						   (list dim_line_hand))
					   ) ;_���б��б�.
				 ) ;_new
				 paxis_mid ;_old
				 wjm_paxis_list
			       )
			)
			);_progn
		      );if
		   );_progn
		 );_if paxis_mid
	      )
	    ) ;_if
	    
	      );_progn
	    );_if dim_line
	   );_while (setq en (ssname foucs_ss 0))
	 );_progn
	
      );_if focus ss

  );_defun


;;;�����������˵������ļ��б�ע����.
;;;���������:(����, (list �ݽ�����ͨ�������� [�ײ�ͨ����] ) (list ������������� �Ǽ�����) ����� (list ���� ����) )
;;;(list cur_focus_klnum cur_focus_jsj cur_focus_gg  cur_focus_bianhao cur_focus_bh)

;(get_focus_dimtext(car (car wjm_focus_dimline_lst))(cadr (car wjm_focus_dimline_lst)))
;(get_focus_dimtext (car(entsel)))
(defun get_focus_dimtext ( en / textlayer ptleft ptright ent)
  (setq ent (entget en))
  (setq ptleft (cdr (assoc 10 ent)))
  (setq ptright (cdr (assoc 11 ent)))
  (setq dim_line_ang (angle ptleft ptright))
  (setq textlayer (cdr (assoc 8 ent)))
  
(setq listtext nil)
  
(setq con1 (polar ptleft (+ dim_line_ang (/ pi 2)) (/ wjm_left_or_right_diet_MID 3)))
(setq con2 (polar ptleft (- dim_line_ang (/ pi 2)) (/ wjm_left_or_right_diet_MID 3)))
(setq con3 (polar ptright (+ dim_line_ang (/ pi 2)) (/ wjm_left_or_right_diet_MID 3)))
(setq con4 (polar ptright (- dim_line_ang (/ pi 2)) (/ wjm_left_or_right_diet_MID 3)))
(setq conlist_dimtext (list con1 con3 con4 con2 con1))
;;;  (draw-pl conlist_dimtext)
(setq cur_focus_klnum nil cur_focus_jsj nil cur_focus_gg  nil cur_focus_bianhao nil cur_focus_bh nil)
  
  (setq filter_lisp_list
	       (list   (cons 0 "*TEXT")
		       (cons 8 textlayer)
		     )
	);(draw-pl conlist_dimtext)
  (setq sstext (ssget "CP" conlist_dimtext filter_lisp_list))
  ;_���б�ע�ı�����cur_focus_klnum cur_focus_jsj cur_focus_gg  cur_focus_bianhao cur_focus_bh
  (while (if sstext (setq ent (ssname sstext ca_midt))) ;_ca_midt�д�����֤��Ϣ
    (setq sstext (ssdel ent sstext))
    (setq ent (entget ent))
    (setq textstr (cdr(assoc 1 ent)) )
    (cond
      ;(setq textstr "JZLLL(2) 300x700")
      ((wcmatch textstr "G*,N*");_����ֽ�.
       )
      ((wcmatch textstr wjm_�����)
	(if (eq (length (setq mid (str-to-area textstr))) 4)
	  (progn
	    (setq cur_focus_bianhao (car mid)) ;_�����
	    (setq cur_focus_klnum (atoi (cadr mid))) ;_�ü��б�ע�е����ܿ���
	    (setq cur_focus_bh
		   (list (atoi (caddr mid)) (atoi (cadddr mid)))
	    ) ;_���Ľ���
	  )
	  (if (eq (length mid) 5)
	    (progn
	      (setq cur_focus_bianhao (cadr mid)) ;_�����
	      (setq cur_focus_klnum (atoi (caddr mid))) ;_�ü��б�ע�е����ܿ���
	      (setq cur_focus_bh
		     (list (atoi (cadddr mid)) (atoi (cadddr (cdr mid))))
	      ) ;_������
	      )
	      (progn ;|ֻ�����ļ��б�ע,û�����|;
		(setq cur_focus_bianhao (car mid)) ;_�����
		(setq cur_focus_klnum (atoi (cadr mid))) ;_�ü��б�ע�е����ܿ���
;;;(princ mid)
	      )
	    )
	  ) ;_if
	) ;_wcmatchwjm_����� (setq textstr "2%%13218;3%%13218")(setq textstr "B2%%13218;T3%%13218")(setq textstr "2%%13218")
	((wcmatch textstr wjm_����)
	  (setq	cur_focus_gg_text textstr
		cur_focus_gg
		 (str-to-area textstr)
	  )
	)
	((wcmatch textstr wjm_�ݽ�б�ע)
	  (if (wcmatch textstr "B#*;T#*")
	    (progn (foreach strmid
			    (convert_string_to_string_lst textstr ";")
		     (setq cur_focus_jsj
			    (append cur_focus_jsj
				    (list (str-to-area strmid))
			    )
		     )
		     (setq cur_focus_jsj (reverse cur_focus_jsj))
		   )
	    ) ;_progn
	    (foreach strmid (convert_string_to_string_lst textstr ";")
	      (setq cur_focus_jsj
		     (append cur_focus_jsj
			     (list (str-to-area strmid))
		     )
	      )
	    )
	  ) ;_if
	) ;_(wcmatch textstr wjm_�ݽ�б�ע)
      ) ;_cond
    ;(setq listtext (append listtext (list (list(cdr(assoc 10 ent)) (cdr(assoc 11 ent))))))
    
    );_while
  (list cur_focus_klnum cur_focus_jsj cur_focus_gg  cur_focus_bianhao cur_focus_bh cur_focus_gg_text) 
  );_defun get_focus_dimtext

(setq wjm-beam-info-lst
  (list
  (cons 10 wjm_pt_paxis_left);_����ڵ�.
  (cons 11 wjm_pt_paxis_right);_���ҽڵ�.
  (cons 40 beam-b)(cons 41 beam-h);_����,����.
  (cons 101 tl)(cons 102 tm)(cons 103 tr)(cons 104 bl)(cons 105 bm)(cons 106 br)(cons 107 gl)(cons 108 gr)
  (cons 201 ttl)(cons 202 ttm)(cons 203 ttr)(cons 204 bbl)(cons 205 bbm)(cons 206 bbr)(cons 207 ggl)(cons 208 ggr)
  (cons 301 tttl)(cons 302 tttm)(cons 303 tttr)(cons 304 bbbl)(cons 305 bbbm)(cons 306 bbbr)(cons 207 gggj)
  (cons 401 ttttl)(cons 402 ttttm)(cons 403 ttttr)(cons 404 bbbbl)(cons 405 bbbbm)(cons 406 bbbbr)(cons 207 ggggj)
  
  (cons 1001 (caadr wjm_cur_focus_text)) (cons 1002 (cadadr wjm_cur_focus_text));_����,����ͨ����.
  (cons 1003 (caaddr wjm_cur_focus_text)) (cons 1004 (car(cdaddr wjm_cur_focus_text)));_�����б�ע����.
  (cons 1007 "Ԥ����Ť��")
  (cons 1008 "Ԥ������")
  (cons 1009 (cadddr wjm_cur_focus_text));_�����.
  (cons 1040 (caar(cddddr wjm_cur_focus_text)));_����
  (cons 1041 (cadar(cddddr wjm_cur_focus_text)));_����.
  (cons 1307 cur_focus_gg_text);_���б�ע�����ı�.
  )
)

(defun get-dxf (dxf)
  (cdr(assoc dxf wjm-beam-info-lst))
  )

(defun set-dxf(dxf value)
  (if (assoc dxf wjm-beam-info-lst)
    (progn
      (setq wjm-beam-info-lst (subst (cons dxf value) (assoc dxf wjm-beam-info-lst) wjm-beam-info-lst))
      )
    (progn
      (setq wjm-beam-info-lst (append wjm-beam-info-lst (list (cons dxf value))))
      )
    );_if
  )

;;;˵��, ����8��ָʵ�屻ʹ�õĴ���.
;;;����21,22�ֱ��ʾ���߱�ź������.
(defun wjm-add-ent (ent3 / mid )
;;;��ʵ���.
  		  ;((cons 21 wjm_cur_paxis_index))
		  ;(cons 22 wjm_cur_beam_index)
  (if (setq mid (assoc (cdr (assoc 5 ent3)) wjm_ent_list))
    (progn
      (setq wjm_ent_list
	     (subst (list (cdr (assoc 5 ent3))
			  (cons 8 (1+ (cdr (assoc 8 (cdr mid)))))
			  (cons 9 (append (cdr (assoc 9 (cdr mid)))
				(list(list (cons 21 wjm_cur_paxis_index)
			  (cons 22 wjm_cur_beam_index)))))
			  )

		    mid
		    wjm_ent_list
	     )
      )
    ) ;_progn
    (setq wjm_ent_list
	   (append wjm_ent_list
		   (list (list (cdr (assoc 5 ent3)) (cons 8 1)  (cons 9 (list(list (cons 21 wjm_cur_paxis_index)
			  (cons 22 wjm_cur_beam_index)))    ) ))
	   )
    )
  ) ;_if

)

;((11 (ent1 ent2 ent3)) (21 (ent4 ent5 ent6)))
;(setq test nil)
;(build-list 12 (list 10 11 12) "test")
(defun build-list (dxf value list-name /)
  (eval (read (strcat "(setq mid " list-name ")")))
  (if (assoc dxf mid)
    (progn
      (setq mid (subst (cons dxf(append (cdr(assoc dxf mid))(list value)) )(assoc dxf mid) mid))
    )
    (progn
      (setq mid (append mid (list (cons dxf (list value)))))
    )
  )
  (eval (read (strcat "(setq " list-name " mid)")))
)
;;;���һ���������������ߵĽ���,ǰ���Խ��������߶�����
;;;��������line��entget ,������ߵĶ˵�Fence�����ߵĽ����ΪҪ�ҵĵ�,
;;;�����Щ��ı�
(defun get-abeam-int-point (en / ent pt-mid ang-mid ss2 ss2len sscolu findcolu jiaodian listzxjd pt1 pt2 pta ptb ent2 j% ent ptleft ptright)
  (setq ent (entget en))
  (setq ss2len nil
	listzxjd nil
	jiaodian nil
	ss2 nil)
  ;;;(setq paxis_ang (cdr (assoc 50 ent)))
  (setq pt1 (cdr (assoc 10 ent)))
  (setq pt2 (cdr (assoc 11 ent)))
;;;  (setq pt-mid (midpt pt1 pt2))
  (setq ang-mid (angle pt1 pt2))
;;;  (setq dis-mid (+(distance pt1 pt2) 1000))
  (setq pt1 (polar pt1 (+ pi ang-mid) 1000))
  (setq pt2 (polar pt2 (+ 0 ang-mid) 1000))
  ;;;pt1,pt2�ֱ���������������1000,���һЩ����������
  
  (setq	ss2 (ssget "F"
		   (list pt1 pt2)
		   (list (cons 0 "LINE") (cons 8 "wjm_beam"))
	    )
  )
  (if ss2
    (progn
      (setq ss2len (sslength ss2)
	    j%	   (fix(rem ca_midt ss2len));_��֤
      )
      (repeat ss2len ;_�б����һ�����ǲ������߱�����,��Ϊͼ�����.
	(setq ent2 (entget (ssname ss2 j%))) 
	(setq pta (cdr (assoc 10 ent2)))
	(setq ptb (cdr (assoc 11 ent2)))
	(setq jiaodian (inters pt1 pt2 pta ptb nil))
	;;���Կ���,�鿴��ѡ�����ߵĽ����Ƿ���ȷ.
	(if (eq wjm_debug "2")
	  (progn
	    (command "line" pt1 pt2 "")
	    (command "line" pta ptb ""))
	)
	(if jiaodian
	  (setq listzxjd (append listzxjd (list jiaodian)))
	)
	(setq j% (1+ j%))
      ) ;_repeat

      	;;;����
	(setq listzxjd (vl-sort	listzxjd
				(function (lambda (e1 e2)
					    (if	(< (abs(- (car e1) (car e2))) wjm_Y_diet );_���X�������,����Y��������
					      (< (cadr e1) (cadr e2))
					      (< (car e1) (car e2))
					    )
					  )
				)
		       )
	)

    ) ;_progn

  ) ;_if

listzxjd
)
;(setq ent entt)

(defun getcolulist (en / ENT	    PT1		  PT2
		      PT-MID	    ANG-MID	  DIS-MID		      	  
		      MID	    SS2SETQ	  SS2
		      SS2LEN	    J%		  ENT2
		      WJM_PAXIS_COLU_LIST	  J%
		      COLUCENTER    COLUBIANHAO	  
		     )
  (setq ent (entget en))
  (setq pt1 (cdr (assoc 10 ent)))
  (setq pt2 (cdr (assoc 11 ent)))
  (if (if (equal (car pt1) (car pt2) wjm_Y_diet)
	(< (cadr pt1) (cadr pt2))
	(< (car pt1) (car pt2))
      )
    (progn (setq mid pt1) (setq pt1 pt2) (setq pt2 mid))
  )


  (setq pt-mid (midpt pt1 pt2))
  (setq ang-mid (angle pt1 pt2))
  (setq dis-mid (+ (distance pt1 pt2) 1000))
  (setq pt1 (polar pt-mid ang-mid dis-mid))
  (setq pt2 (polar pt-mid (+ pi ang-mid) dis-mid))
  (setq wjm_paxis_colu_list nil)
;;;pt1,pt2�ֱ���������������1000,���һЩ����������.




  (setq	ss2 (ssget "F"
		   (list pt1 pt2)
		   ;(list (cons 0 "*LINE") (cons 8 wjm_colu_layer))
		   (list (cons 0 "LWPOLYLINE")(cons 8 wjm_colu_layer))
	    )
  )
  (if ss2
    (progn
      (setq ss2len (sslength ss2)
	    j%	   0
      )
      (repeat (- ss2len j%) ;_�б����һ���������߱���
	(setq ent2 (entget (ssname ss2 j%)))
	(cond
	  ((eq "LINE" (cdr (assoc 0 ent2))) ;_���ĸ��߻��ɵ�����.
	  )
	  ((eq "LWPOLYLINE" (cdr (assoc 0 ent2))) ;_��PL�߻��ɵ�����.
	   (progn
	     (if (or (= (cdr (assoc 90 ent2)) 4)
		     (= (cdr (assoc 90 ent2)) 5)
		 )
	       (progn
		 ;;��������.
		 (setq catchit (vl-catch-all-apply
				 'ax:Centroid
				 (list (ssname ss2 j%))
			       )
		 ) ;_���ñ�������׽����
		 (if (vl-catch-all-error-p catchit)
		   (progn
		     ;(princ "\n��ȷ������ȫ��Ϊ�պ�����:")
			  ;(princ (vl-catch-all-error-message catchit))
		     (entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 1000)
			   (cons 62 5);_��ɫ.
			   (assoc 10 (entget(ssname ss2 j%)))
			   '(-3 ("PE_URL" (1000 . "�������Ǳպ�����ɵ�,��������ȷ������")))
		     )
		     )
		     (setq colucenter (cdr(assoc 10 (entget(ssname ss2 j%)))) )
		     ;(mySetXData (vlax-ename->vla-object (entlast)) "�������Ǳպ�����ɵ�,���Իᱻ���Ե�")
		   )
		   (setq colucenter (ax:Centroid (ssname ss2 j%)))
		 );_if
		 ;;��������.
		 
;;;		 (setq colucenter (ax:Centroid (ssname ss2 j%)))
		 
		 (setq colubianhao
			(strcat	(rtos (car colucenter) 2 0)
				":"
				(rtos (cadr colucenter) 2 0)
			)
		 )
		 
;;;������б���û�и�����Ϣ,�����Ӹ�����Ϣ.
		 (if (and colucenter (null (assoc colubianhao wjm_colu_list)))
		   (progn (setq	wjm_colu_list
				 (append wjm_colu_list
					 (list (list colubianhao
						     (cons 10 colucenter) ;_���ĵ�.
						     (list 40 nil nil) ;_������״.
					       )
					 )
				 )
			  )

		   )
		 ) ;_if
	       )


	     ) ;_if

	   ) ;_progn
	  )
	  ((eq "HATCH" (cdr (assoc 0 ent2))) ;_����仭�ɵ�����.
	  )
	)
	(setq wjm_paxis_colu_list
	       (append wjm_paxis_colu_list
		       (list colubianhao)
	       )
	)
	(setq j% (1+ j%))
      ) ;_repeat

;;;����
;;;      (setq
;;;	listzxjd (vl-sort
;;;		   listzxjd
;;;		   (function
;;;		     (lambda (e1 e2)
;;;		       (if (< (abs (- (car e1) (car e2))) wjm_Y_diet) ;_���X�������,����Y��������
;;;			 (< (cadr e1) (cadr e2))
;;;			 (< (car e1) (car e2))
;;;		       )
;;;		     )
;;;		   )
;;;		 )
;;;      )



    ) ;_progn

  ) ;_if ss2

  wjm_paxis_colu_list
)


(defun getwalllist (en / ENT	  PT1	      PT2	  PT-MID
		      ANG-MID	  DIS-MID     PAXIS_WALL_LIST wallbianhao
		      SS2	  MID	      SS2
		      SS2LEN	  J%	      ENT2	  J% ptleft ptright 
		     )
  (setq ent (entget en)) 
  (setq pt1 (cdr (assoc 10 ent)))
  (setq pt2 (cdr (assoc 11 ent)))
  (if (if (equal (car pt1) (car pt2) wjm_Y_diet)
	(< (cadr pt1) (cadr pt2))
	(< (car pt1) (car pt2))
      )
    (progn (setq mid pt1)(setq pt1 pt2)(setq pt2 mid))
  )
  
  (setq pt-mid (midpt pt1 pt2))
  (setq ang-mid (angle pt1 pt2))
  (setq dis-mid (+ (/(distance pt1 pt2)2) 1000))
  (setq pt1 (polar pt-mid ang-mid dis-mid))
  (setq pt2 (polar pt-mid (+ pi ang-mid) dis-mid))
  (setq paxis_wall_list nil)
;;;pt1,pt2�ֱ���������������1000,���һЩ����������.
  (setq	ss2 (ssget "F"
		   (list pt1 pt2)
		   (list (cons 0 "*LINE") (cons 8 wjm_wall_layer))
	    )
  )
  ;(printerror pt-mid "test") (draw-pl (list pt1 pt2))

  (if ss2
    (progn
      (setq ss2len (sslength ss2)
	    j%	   0 
      )
      (repeat (- ss2len j%) ;_�����б�.
	(setq ent2 (entget (ssname ss2 j%)))
	(cond
	  ((eq "LINE" (cdr(assoc 0 ent2 )));_���ĸ��߻��ɵ�����.
	   )
	  ((eq "LWPOLYLINE" (cdr(assoc 0 ent2 )));_��PL�߻��ɵ�����.
	   (progn
	     ;;��������PLINE(ǽ��)�Ľ���.
	     (setq intersections nil)
	     (setq wjm_wall_pt (wjmf_Midp (ssname ss2 j%) en 1));_(0 ������,1 һ�Ų�����,2 ���Ų�����,<3> ȫ��������)
	     (setq wjm_wall_pt (wjmf_sort wjm_wall_pt))
	     ;;;debug
	     (if (eq wjm_debug "1");_(setq wjm_debug "1")
	       (foreach	temp_pt	wjm_wall_pt
		 (progn
		   (entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 500)
			   (cons 62 5);_��ɫ.
			   (cons 10 temp_pt)
		     )
		   )
		 ) ;_progn
	       ) ;_foreach
	     ) ;_if

	     
	     (if (>= (length wjm_wall_pt) 2)
	       (progn
		 (setq ptleft (nth 0 wjm_wall_pt))
		 (setq ptright (nth (1- (length wjm_wall_pt)) wjm_wall_pt))
		 (setq wallbianhao
			(strcat	(rtos (car ptleft) 2 0)
				":"
				(rtos (cadr ptleft) 2 0)
				":"
				(rtos (car ptright) 2 0)
				":"
				(rtos (cadr ptright) 2 0)
			)
		 )
		 (if (null (assoc wallbianhao wjm_wall_list))
		   (progn (setq	wjm_wall_list
				 (append wjm_wall_list
					 (list (list wallbianhao
						     (cons 10 ptleft) ;_�˵�10.
						     (cons 11 ptright) ;_�˵�10.
						     (cons 43 nil) ;_������.
					       )
					 )
				 )
			  )
		   )
		 )
	       )
	     );_if
	   );_progn
	   )
	  ((eq "HATCH" (cdr(assoc 0 ent2 )));_����仭�ɵ�����.
	   )
	  )
	(if wallbianhao(setq paxis_wall_list (append paxis_wall_list (list wallbianhao))))
	(setq j% (1+ j%))
      ) ;_repeat

    ) ;_progn

  ) ;_if ss2

paxis_wall_list
)

;;;(setq wjm_paxis_beam_list (getbeamlist en))

(defun getbeamlist (en / ENT	  PT1	      PT2	  PT-MID
		      ANG-MID	  DIS-MID     paxis_beam_list
		      SS2	  MID	      SS2
		      SS2LEN	  J%	      ENT2	  J%
		     )
  (setq ent (entget en)) 
  (setq pt1 (cdr (assoc 10 ent)))
  (setq pt2 (cdr (assoc 11 ent)))
  (if (if (equal (car pt1) (car pt2) wjm_Y_diet)
	(< (cadr pt1) (cadr pt2))
	(< (car pt1) (car pt2))
      )
    (progn (setq mid pt1)(setq pt1 pt2)(setq pt2 mid))
  )

  
  (setq pt-mid (midpt pt1 pt2))
  (setq ang-mid (angle pt1 pt2))
  (setq dis-mid (+ (distance pt1 pt2) 1000))
  (setq pt1 (polar pt-mid ang-mid dis-mid))
  (setq pt2 (polar pt-mid (+ pi ang-mid) dis-mid))
  (setq paxis_beam_list nil)
;;;pt1,pt2�ֱ���������������1000,���һЩ����������.
(setq con1 (polar pt1 (+ ang-mid (/ pi 2.0)) wjm_left_or_right_diet))
(setq con2 (polar pt1 (- ang-mid (/ pi 2.0)) wjm_left_or_right_diet))
(setq con3 (polar pt2 (- ang-mid (/ pi 2.0)) wjm_left_or_right_diet))
(setq con4 (polar pt2 (+ ang-mid (/ pi 2.0)) wjm_left_or_right_diet))
  
  (setq	filter_lisp_list
	 (list
	   (cons 0 "*LINE")
	   (cons 8 wjm_beam_layer)
	 )
  )
  (setq ss2 nil)
  (setq ss2 (ssget "WP" (list con1 con2 con3 con4) filter_lisp_list))
 
  
  (if ss2
    (progn
      (setq ss2len (sslength ss2)
	    j%	   0 
      )
      (repeat (- ss2len j%) ;_�����б�.
	(setq ent2 (entget (ssname ss2 j%)))
	(cond
	  ((eq "LWPOLYLINE" (cdr(assoc 0 ent2 )));_���ĸ��߻��ɵ�����.
	   )
	  ((eq "LINE" (cdr(assoc 0 ent2 )));_��PL�߻��ɵ�����.
	   (progn
	     
	     (if t
	       (progn		 
		 (if (null (assoc beambianhao wjm_beam_list))
		   (progn (setq	wjm_beam_list
				 (append wjm_beam_list
					 (list (list beambianhao
						     (cons 10 ptleft) ;_�˵�10.
						     (cons 11 ptright) ;_�˵�10.
						     (cons 43 nil) ;_������.
					       )
					 )
				 )
			  )
		   )
		 )
	       )
	     );_if

	   ) ;_progn
	   )
	  ((eq "HATCH" (cdr(assoc 0 ent2 )));_����仭�ɵ�����.
	   )
	  )
	(setq paxis_beam_list (append paxis_beam_list (list beambianhao)))
	(setq j% (1+ j%))
      ) ;_repeat

    ) ;_progn

  ) ;_if ss2

paxis_beam_list
)
;��ʵ�����ñ����ĺ���.
(setq wjm_angle_diet_mid (/ pi 30))
(defun pre-text-set-var	(hand / en ent box )
					;{text},{x},{y},{z},{color},{layer},{height},{weight},{hand}
  (setq en (handent hand))
  (setq ent (entget en))
  (setq box (textbox ent))

    (setq {x} (cadr (assoc 10 ent)))
    (setq {y} (caddr (assoc 10 ent)))
    (setq {ang} (cdr (assoc 50 ent)));_���������߽ǶȲ�һ��,���Բ���.
    (cond
      ((equal {paxis_ang} 0 wjm_angle_diet_mid) 0 )
      ;((equal {ang} (* pi 0.5) wjm_angle_diet_mid) (setq mid {x})(setq {x} {y})(setq {y} mid) )
      ((equal {paxis_ang} pi wjm_angle_diet_mid)0 )
      ;((equal {ang} (* pi 1.5) wjm_angle_diet_mid) (setq mid {x})(setq {x} {y})(setq {y} mid) )
      ((equal {paxis_ang} (* pi 2) wjm_angle_diet_mid) 0)
      (t
    (setq l-mid (sqrt (+ (* {x} {x}) (* {y} {y}))));_ԭ�����.

     (if (= {x} 0)(setq ang-line (if (> {y} 0) (/ pi 2.0) (/ pi -2.0)))
       (if (< {x} 0) (setq ang-line (+ (atan (/ {y} {x})) pi))(setq ang-line (atan (/ {y} {x})))))    
       
       
    (setq angdia (- ang-line {paxis_ang}));_�ò�������(pre-paxis-set-var beam_info).
    (setq {x} (* l-mid(cos angdia)))
    (setq {y} (* l-mid(sin angdia)))
       )
    )
    (setq {x} (+ {x} (/(caadr box)2)))
    (setq {y} (+ {y} (/(cadadr box)2)))
    
    (setq {text} (cdr (assoc 1 ent)))
  ;_(if (wcmatch {text} "3%%13220") (princ))
    (setq {color} (cdr (assoc 62 ent))) ;_Ҫ�Ľ�!
    (setq {hand} hand)
    (setq {height} (cdr (assoc 40 ent)))
    (setq {layer} (cdr (assoc 8 ent)))
    (setq {weight} (cdr (assoc 41 ent)))
    (list {x} {y} {ang} {text} {layer} {color} {hand} {height} {weight})
      	       (if (eq wjm_debug "2");(setq wjm_debug "2")
                   (entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 400)
			   (cons 62 5);_��ɫ.
			   (list 10 {x} {y} 0)
			   (list -3 (list "PE_URL" (cons 1000  (strcat "��������:" {text}))))
		     )
		     ))
)
;;;��ʼ����������.�����߶�������ˮƽ��.
(defun pre-paxis-set-var (beam_info / ang ang-line angdia l-mid )
		     (setq {10x} (cadr (assoc 10 beam_info))
			   {10y} (caddr (assoc 10 beam_info))
		     );_ȫ�ֱ���.
		     (setq {11x} (cadr (assoc 11 beam_info))
			   {11y} (caddr (assoc 11 beam_info))
		     );_ȫ�ֱ���.
  	       (if (eq wjm_debug "2");(setq wjm_debug "2")
		 (progn(entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 1000)
			   (cons 62 5);_��ɫ.
			   (list 10 {10x} {10y} 0)
			   '(-3 ("PE_URL" (1000 . "�������Ǳպ�����ɵ�,���Իᱻ���Ե���")))
		     )
		     )
		   (entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 1000)
			   (cons 62 5);_��ɫ.
			   (list 10 {11x} {11y} 0)
			   '(-3 ("PE_URL" (1000 . "�������Ǳպ�����ɵ�,���Իᱻ���Ե���")))
		     )
		     ))
	       );_if
  (setq {paxis_ang} (angle (cdr (assoc 10 beam_info)) (cdr (assoc 11 beam_info)) ))
  (setq ang {paxis_ang})
    (cond
      ((equal ang 0 wjm_angle_diet_mid) 0)
;;;      ((equal ang (* pi 0.5) wjm_angle_diet_mid)
;;;       (setq mid {10x})
;;;       (setq {10x} {10y})
;;;       (setq {10y} mid)
;;;       (setq mid {11x})
;;;       (setq {11x} {11y})
;;;       (setq {11y} mid)
;;;      )
      ((equal ang pi wjm_angle_diet_mid) 0)
;;;      ((equal ang (* pi 1.5) wjm_angle_diet_mid)
;;;       (setq mid {10x})
;;;       (setq {10x} {10y})
;;;       (setq {10y} mid)
;;;       (setq mid {11x})
;;;       (setq {11x} {11y})
;;;       (setq {11y} mid)
;;;      )
      ((equal ang (* pi 2) wjm_angle_diet_mid) 0)
      (t(progn
       (setq l-mid (sqrt (+ (* {10x} {10x}) (* {10y} {10y}))))
       (if (= {10x} 0)(setq ang-line (if (> {10y} 0) (/ pi 2.0) (/ pi -2.0)))
       (if (< {10x} 0) (setq ang-line (+ (atan (/ {10y} {10x})) pi))(setq ang-line (atan (/ {10y} {10x})))))
       (setq angdia (- ang-line ang))
       (setq {10x} (* l-mid (cos angdia)))
       (setq {10y} (* l-mid (sin angdia)))
      )
      (progn
       (setq l-mid (sqrt (+ (* {11x} {11x}) (* {11y} {11y}))))
       (if (= {11x} 0)(setq ang-line (if (> {11y} 0) (/ pi 2.0) (/ pi -2.0)))
       (if (< {11x} 0) (setq ang-line (+ (atan (/ {11y} {11x})) pi))(setq ang-line (atan (/ {11y} {11x})))))
       (setq angdia (- ang-line ang))
       (setq {11x} (* l-mid (cos angdia)))
       (setq {11y} (* l-mid (sin angdia)))
      ))
    )
     (if (eq wjm_debug "2");(setq wjm_debug "2")
            (progn(entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 500)
			   (cons 62 5);_��ɫ.
			   (list 10 {10x} {10y} 0)
			   '(-3 ("PE_URL" (1000 . "�������Ǳպ�����ɵ�,��������ȷ������")))
		     )
		     )
               (entmakex
		     (list (cons 0 "CIRCLE")
			   (cons 8 "wujimmy_Error")
			   (cons 40 600)
			   (cons 62 5);_��ɫ.
			   (list 10 {11x} {11y} 0)
			   '(-3 ("PE_URL" (1000 . "�������Ǳպ�����ɵ�,��������ȷ������")))
		     )
		     ))
       )
)

(defun pre-gj-set-var (beam_info / hand)
  (pre-paxis-set-var beam_info);_��ʼ����������.
  (setq beam_value_list nil)
  (foreach hand	(cdr(assoc 2 beam_info))
    (progn
      (pre-text-set-var hand) ;_���ø��ֱ���.
      (setq value_list nil)
      (setq value_list (checkvar)) ;_�ú���������deal-ini-file.lsp,�����ֱ���.���������value_list��.

      (if (assoc "402" value_list)(checkvar))
      ;(setq value_list (list (cons "401" 1) (cons "402" 3) (cons "403" 2)))
      (setq value_list (vl-sort value_list(function (lambda (e1 e2)(> (cdr e1) (cdr e2))))))
      (if value_list(setq beam_value_list (append beam_value_list (list value_list))))
      (setq gj_dxf (caar value_list))
      (if gj_dxf
      (set-dxf (if (= 0 (atoi gj_dxf)) gj_dxf(atoi gj_dxf)) hand))
    )
  )
  ;;;�ֽ��ٴδ���.��֤���Ӧ��ϵ����ȷ��.
  beam_value_list
)
;;;����������б�.
;;;���ڼ�������ͬһ�㸽��������������Ҫ�Ƚ��й鲢����.
(defun pre-jsj-set-var(beam_info / hand_list hand ret dist en textstr jsj_mid
		       list_length mindis dist_type ang pt jsj_mid_lst
		       jsj_list jsj_mid_mid  gjj gjf );_(setq ret nil)
  (setq hand_list (cdr(assoc 1 beam_info)))
  (setq list_length (length hand_list))
  (setq maxdis (CDR(CAR hand_list)))
  (foreach hand	hand_list
    (setq dist (cdr hand))
;;;    (setq mindis (min mindis dist))
    (cond ;_���ü��������.�������������ߵľ����С�ж�����������������黹�����׼�����.

      ((equal (- dist maxdis) 0 100) ;_����.
       (setq dist_type 1)
      )
      ((equal (- dist maxdis) -220 100) ;_�����.
       (setq dist_type 2)
      )
      ((equal (- dist maxdis) -532 100) ;_���׽�.
       (setq dist_type 3)
      )
      ((equal (- dist maxdis) -752 100) ;_��Ť��.
       (setq dist_type 4)
      )
    )
    (setq hand (car hand))
    (setq en (handent hand))
    (setq ent (entget en))
    (setq textstr (cdr (assoc 1 ent)))
    (setq ang (cdr (assoc 51 ent)))
    (setq pt (cdr (assoc 10 ent)))
    (setq jsj_mid (CONVERT_STRING_TO_INT_LST
		    (vl-string-left-trim "GVT" textstr)
		  )
    )
    (build-list dist_type (list pt jsj_mid) "jsj_list")
  )
            
  
  ;;;��������.
  (setq jsj_list (vl-sort jsj_list(function (lambda (e1 e2)
					    (< (car e1) (car e2))
					  ))))
  ;;;��������.(setq jsj_mid (cadr jsj_list))

    (foreach jsj_mid jsj_list
      (if (= 2 (length jsj_mid))
;;;ֻ��һ��������.
	(setq ret (append ret (cdadr jsj_mid)))
;;;����һ��������,��Ҫ���й鲢. ��Ҫ�ж��ǹ�����ݽ�.
	(if (= 3 (length (cadadr jsj_mid)))
	  (progn
;;;�ݽ������.
	    (setq jsj_mid
		   (vl-sort (cdr jsj_mid)
			    (function (lambda (e1 e2)
					(if (= (caar e1) (caar e2))
					  (< (cadar e1) (cadar e2))
					  (< (caar e1) (caar e2))
					)
				      )
			    )
		   )
	    )

	    (setq jsj_mid_lst nil)
;;;���(8.0 2.0 2.0 2.0 3.0 6.0)
	    (foreach jsj_mid_mid jsj_mid
	      (setq jsj_mid_lst (append jsj_mid_lst (cadr jsj_mid_mid)))
	    ) ;_foreach
;;;���(8.0 3.0 6.0)
	    (setq jsj_mid_lst
		   (list
		     (car jsj_mid_lst)
		     (eval;_��һ�������ֵ,�����Ż�.������,Ȼ����CAR.
			 (cons 'max
				 (cdr (reverse (cdr jsj_mid_lst)))
			 )
		     )
		     (car (reverse jsj_mid_lst))
		   )
	    )
	    (setq ret (append ret (list jsj_mid_lst)))
	  ) ;_progn
	  (progn ;_���������.
	      (progn
		(setq gjj 0
		      gjf 0
		)
;;;���(1.0 0.4)
		(foreach jsj_mid_mid (cdr jsj_mid)
		  (setq gjj (max gjj (caadr jsj_mid_mid)))
		  (setq gjf (max gjf (cadadr jsj_mid_mid)))

		) ;_foreach
		(setq ret (append ret (list (list gjj gjf))))
	      )
	  ) ;_���������.
	) ;_if

      ) ;_(if (=2 (length jsj_mid))

    ) ;_if

    (progn
      ;(setq ret '((0.8 0.5) (7.0 3.0 9.0) (10.0 6.0 5.0)))
      (cadar ret)
      (set-dxf 107 (caar ret));_������.
      (set-dxf 108 (cadar ret));_�Ǽ�����.
      (set-dxf 101 (caadr ret))
      (set-dxf 102 (cadadr ret))
      (set-dxf 103 (car(cddadr ret)))
      (set-dxf 104 (caaddr ret))
      (set-dxf 105 (car(cdaddr ret)))
      (set-dxf 106 (cadr(cdaddr ret)))
      ;(set-dxf 109 (cadr(cdaddr ret)));_�����뿹ť���н���.
      (set-dxf 109 hand_list)
      )
  
  ret
  )
;;;�����б�ע����.
(defun set-var-focus(hand / en ent ptleft ptright)
  (setq en (handent hand))
  ;(zoom-en en)
  
;;;�����������˵������ļ��б�ע����.
;;;���������:(����, (list �ݽ�����ͨ�������� [�ײ�ͨ����] ) (list ������������� �Ǽ�����) ����� (list ���� ����) )
;;;(list cur_focus_klnum cur_focus_jsj cur_focus_gg  cur_focus_bianhao cur_focus_bh)

  (setq wjm_cur_focus_text(get_focus_dimtext en))
  (setq wjm-beam-info-lst (append wjm-beam-info-lst
				  (list
  (cons 1050 (car wjm_cur_focus_text))
  (cons 1001 (caadr wjm_cur_focus_text)) (cons 1002 (cadadr wjm_cur_focus_text));_����,����ͨ����.
  (cons 1003 (caaddr wjm_cur_focus_text)) (cons 1004 (car(cdaddr wjm_cur_focus_text)));_�����б�ע����.
  (cons 1007 "Ԥ����Ť��")
  (cons 1008 "Ԥ������")
  (cons 1009 (cadddr wjm_cur_focus_text));_�����.
  (cons 1040 (caar(cddddr wjm_cur_focus_text)));_����
  (cons 1041 (cadar(cddddr wjm_cur_focus_text)));_����.
  (cons 1307 cur_focus_gg_text);_���б�ע�����ı�.
				    
				    )
				  ))


  
  )
;;;���ñ���
;;;1.������������,���ҵ���Ӧ������sstext(ͼ��:"��*",)
;;;2.����sstext�е���������ֵ,�ֱ����ڱ���tl,tm,tr,bl,bm,br,gjl,gjr
;;;3.����sstext�е������ֵ,�ֱ����ڱ��� ttl,ttm,ttr,bbl,bbm,bbr,ggjl,ggjr

(defun create-con-list(ptleft ptright pt_type / ptleftmid ptrightmid con11 con22 con33 con44
		       con1 con2 con3 con4)
  
(if (<= wjm_left_or_right_diet 100)
  (setq wjm_left_or_right_diet_mid (* 1.5 800))
  (setq wjm_left_or_right_diet_mid wjm_left_or_right_diet)  
  )
  
(setq ptleftmid (polar ptleft (+ paxis_ang pi)wjm_left_or_right_diet_mid))
(setq ptrightmid (polar ptright paxis_ang wjm_left_or_right_diet_mid))
(setq con11 (polar ptleftmid (+ paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con22 (polar ptleftmid (- paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con33 (polar ptrightmid (- paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con44 (polar ptrightmid (+ paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con1 (polar ptleft (+ paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con2 (polar ptleft (- paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con3 (polar ptright (- paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))
(setq con4 (polar ptright (+ paxis_ang (/ pi 2.0))wjm_left_or_right_diet_mid))

(cond
  ((= pt_type 2)
  (setq conlist_jsj (list ptleftmid con22 con33 ptrightmid ptright con4 con1 ptleft));_ģʽ2
  )
  ((= pt_type 1)
   (setq conlist_jsj (list con11 ptleftmid ptleft con2 con3 ptright ptrightmid con44 con11));_ģʽ1
  )
  ((= pt_type 3);_������ģʽ.
   (setq conlist_jsj (list con1 con2 con3 con4 con1));_ģʽ1
  )
  (t (setq conlist_jsj (list con11 con22 con33 con44 con11)));_��֪��ģʽʱ��ѡһЩ
)
;;;  (draw-pl conlist_jsj)
  conlist_jsj
  )



(defun setmyvar	(ptleft ptright / sstext con1 con2 con3 con4 conlist textstr ent3 ent3name k% sstextlen disleft disright )

  (setq paxis_ang (angle ptleft	 ptright))

;;;��������б�ṹ:  (list ( beam_text)(beam_text)...  )
;;;beam_text����      (list ������ �������� ����ʵ�� ��λ��)
(setq beam_text_lst nil );_��������б�.

  ;;;��һ��,���ж�,����������û������.���߽Ƕ��Ƿ�����ƽ��.


  ;;;


  

;(command "pline" ptleftmid con22 con33 ptrightmid ptright con4 con1 ptleft ptleftmid ""  )
;(command "pline" con11 ptleftmid ptleft con2 con3 ptright ptrightmid con44 con11 ""  )
;(command "pline" ptleftmid ptrightmid ""  )
    
  ;;;��������˵�
  (setq conlist_jsj (create-con-list  ptleft ptright 3))
;;;=========================================================================

(progn ;_�����������tl,tm,tr,bl,bm,br,gjl,gjr

	(setq filter_lisp_list
	       (list
		 (cons 0 "*TEXT")
		 (cons 1
		       (strcat "G*"	    wjm_jsjdiv_diet "*,*"
			       wjm_jsjdiv_diet "*"		 wjm_jsjdiv_diet
			       "*"
			      )
		 )
	       )
	)
        (setq sstext nil);(setq mid1 conlist_jsj mid2 filter_lisp_list)
	(setq sstext (ssget "WP" conlist_jsj filter_lisp_list))
       ; (setq sstext (ssget "WP" mid1))(draw-pl mid1)(draw-pl conlist_jsj)
  
  
	(if sstext
	  (progn
	    (setq sstextlen (sslength sstext)
		  k%	    0
		  min_dis 600
	    )
	    (setq wjm_jsj_list nil)
	    (repeat sstextlen
	      (setq ent3 (entget (ssname sstext k%)))

              (setq textang (cdr (assoc 50 ent3)));_������ֽǶ�textang
	      ;_�ж����ֵĽǶ��Ƿ����ں���ķ�Χ��.
	      (if (or(equal textang (- paxis_ang (* 2 pi)) wjm_angle_diet)
	  (equal textang paxis_ang wjm_angle_diet));_������Ƕȹ���.
	     
	      (progn ;_�����鴦�����
		(setq textinpt (cdr (assoc 10 ent3)));_���ֲ����.
		;_���ֲ���������ߵľ���.
		(setq dis_of_text_line
		       (* (sin	(- (angle textinpt ptleft)
				   (angle textinpt ptright)
				)
			   )
			   (distance textinpt ptright)
			   (distance textinpt ptleft)
			   (/ -1 (distance ptleft ptright))
			)
		)
		;_��ü��������ֲ���������߾������Сֵ.
		(setq min_dis (min dis_of_text_line min_dis))
		;;;��������
		(setq wjm_jsj_list
		       (append wjm_jsj_list
			(list (cons (cdr (assoc 5 ent3)) dis_of_text_line ))))
		;;;��ʵ���.
		(wjm-add-ent ent3
		  ;(cons 21 wjm_cur_paxis_index)
		  ;(cons 22 wjm_cur_beam_index)
		  )
	      );__�����鴦����̽���1
		);_if������Ƕȴ���.

	      (setq k% (1+ k%))
	    );_repeat

	    ;_���ü��������.�������������ߵľ����С�ж�����������������黹�����׼�����.
            
	    ;_����������.
	    (setq wjm_jsj_list
		   (vl-sort
		     wjm_jsj_list
		     (function (lambda (e1 e2)
				 (> (cdr e1) (cdr e2))
			       )
		     )
		   )
	    )
            
	    ;_����������.
	    
	    ;_�������ͼ��,�жϼ��ģʽ.
	    (if
	      (and  (wcmatch (setq textlayer (cdr (assoc 8 ent3))) "*ˮ*,*��*,*��*"))
	       (setq ���ģʽ 2)
	       (setq ���ģʽ 1)
	    )

	  );_progn

	);_if sstext������

      );_progn ������tl,tm,tr,bl,bm,br


;;;===========================================================================
  ;;���ݼ��ģʽ�Ĳ�ͬ,ѡȡ���ķ�ʽ�ͻ᲻ͬ.
  (setq conlist_gj (create-con-list ptleft ptright ���ģʽ))

  (setq filter_lisp_list
	       (list   (cons 0 "*TEXT")
		       (cons 8 �ֽ�ͼ��)
;;;		       (cons 1 "*%%13#*,*x*,*��*")
		       ;(cons -4  ">=")
		       ;(cons 50 ang1)
		       ;(cons -4  "<=")
		       ;(cons 50 ang2)
		     )
   )
  
  (setq sstext (ssget "CP" conlist_gj filter_lisp_list))
  (if sstext ;_����еõ��ֽ��ע,������ֽ��ע��������.
    (progn ;_������ʵ��ֽ�ttl,ttm,ttr,bbl,bbm,bbr
      (setq sstextlen (sslength sstext)
	    k%	   0
	    wjm_beam_text_list nil
      )
      (repeat sstextlen
	(setq ent3name (ssname sstext k%))
	(setq ent3 (entget ent3name))
	(setq textstr (cdr (assoc 1 ent3)));_�����������.
        (setq textang (cdr (assoc 50 ent3)));_������ֽǶ�textang
	;_�ж����ֵĽǶ��Ƿ����ں���ķ�Χ��.
	(if
	  (or(equal textang (- paxis_ang (* 2 pi)) wjm_angle_diet)
	  (equal textang paxis_ang wjm_angle_diet));_�ֽ�Ƕȹ���.

;;;(or (< (abs (- textang paxis_ang)) wjm_angle_diet)
;;;    (> (abs (- textang paxis_ang))
;;;       (- (* 2 pi) wjm_angle_diet)
;;;    )
;;;)
	  (progn(setq wjm_beam_text_list (append wjm_beam_text_list(list (cdr (assoc 5 ent3))) ))

	  ;;;��ʵ���.
	  (wjm-add-ent ent3
		  ;(cons 21 wjm_cur_paxis_index)
		  ;(cons 22 wjm_cur_beam_index)
		  )
	  ))
	;_if �жϸֽ����ֽǶ��Ƿ����.
	(setq k% (1+ k%))
      );_repeat      
      
    );_progn ������ʵ��ֽ�ttl,ttm,ttr,bbl,bbm,bbr

  );_if sstext
(if sstext
(list (cons 1 wjm_jsj_list)
      (cons 2 wjm_beam_text_list)
      (cons 3 wjm_beam_line)
      (cons 10 ptleft)
      (cons 11 ptright)
)
  nil)
  ;_��������,��ʾ�����Խ�����һ������.
);_ defun setmyvar



(defun c:tt ()
  (setvar "cmdecho" 0)
  (while (null(setq es (car (entsel)))))

  (setq en (entget es '("*") ))
  (setq hand (cdr(assoc 5 en)))
  (setq info(assoc hand wjm_ent_list))
  ;(princ info)

  (if(setq beam_info_mid (cdr(assoc 9 (cdr info))))
  (progn
    (foreach beam_info beam_info_mid
      (setq wjm-beam-info-lst nil)
      (setq beam_info (beam-info (cdr (assoc 21 beam_info))(cdr (assoc 22 beam_info))))
      (high-light (cdr(assoc 1 beam_info)))
      (high-light (cdr(assoc 2 beam_info)))
      (progn
        (pre-paxis-set-var beam_info);_��ʼ����������.
        (pre-text-set-var hand) ;_�������ֵĸ��ֱ���.
        (setq value_list nil)
	(princ "\n")
        (princ(setq value_list (checkvar))) ;_�ú���������deal-ini-file.lsp,�����ֱ���.���������value_list��.
      );_progn
      )

    ))
   
  (princ)

;;;  wjm_paxis_list
)


;;;(beam-info "BDC" 3) (if foucs_info_list (set-var-focus (car foucs_info_list)))
(defun beam-info(paxis_index beam_index /
		 beam_info zhou_info beam_info_lst)
  ;;;������Ϣ.
  (setq zhou_info (cdr(assoc paxis_index wjm_paxis_list)))
  (setq dim_line_list_mid (cdr(assoc 2 zhou_info)))
  (if dim_line_list_mid (set-var-focus (car dim_line_list_mid)))
  (high-light dim_line_list_mid)
  ;;;����Ϣ�б�.
  (setq beam_info_lst (cdr(assoc 1 zhou_info)))
  ;;;����Ϣ.
  (setq beam_info (cdr(assoc beam_index beam_info_lst)))
  ;;;��������Ϣ.
  
  (setq wjm-beam-info-lst nil)
  (set-dxf 10 (cdr (assoc 10 beam_info)))
  (set-dxf 11 (cdr (assoc 11 beam_info)))
  
  (setq jsj_info (cdr(assoc 1 beam_info)))
  (setq gj_info (cdr(assoc 2 beam_info)))
  (princ (pre-jsj-set-var beam_info))
  (setq gj_list (pre-gj-set-var beam_info))
  (check-gj-vs-jsj)
  (princ "\n")
  ;(princ (pre-gj-set-var beam_info))
  beam_info
)
       
;;;       (redraw (handent "15d") 3)
(defun high-light(info)
  (setq delay_time 150)
  (repeat 2
   (foreach mid info
     (progn
       (if (eq (type mid) (type (list 1))) (setq mid (car mid)))
       (setq en (handent mid)) ;(cicle-en en)
       (redraw en 3)
       ))
  (command "delay" delay_time)
  (foreach mid info
     (progn
       (if (eq (type mid) (type (list 1))) (setq mid (car mid)))
       (setq en (handent mid))
       (redraw en 4)
       ))
    (command "delay" delay_time)
  )
  )

;|
1.
���ά�����е�
(midpt '(1 1) '(0 0))  (0.5 0.5)

2.���ַ���ʾ�ĸֽ����,�����ݽ�͹���
(str-to-area "5%%13220")  1570
(str-to-area "%%1308@100/200(2)")  (50.2655 100.531)

3.���ַ���������ֵı�
ʾ��:(convert_string_to_int_lst "11-22-33")  result (11 22 33)
�������,������
(myprinc "error:***")   
4.��ʾ������� 
 (myprogress current all)
5.***�����ʼ�(sendmail str)
6.��ȡ�������к� (xdl-MACAddress)
  ��ȡӲ�������ַ(vl-string->list(cadar(get_disksn)))
  ��ȡ���̺� (xdl-ProcessorID)
 ����ض����ű���б�,��Ч���ű�����ΪLayer��Ltype��Viewx��Style��Block��Appid��Ucs��Dimstyle�� Vport
 (xyp-get-tblnext table-name)

|;

(defun zoom-en(en / ent ptleft ptright)
  (setq ent (entget en))
  (setq ptleft (cdr (assoc 10 ent)))
  (setq ptright (cdr (assoc 11 ent)))
  
  (command "'_.zoom" ptleft ptright)
  )
(defun cicle-en(en / ent ptleft ptright)
  (setq ent (entget en))
  (setq pt (cdr (assoc 10 ent)))
    
  (printerror pt "�е�����")
  )
;;;(draw-pl '((0 0 0) (1000 0 0)(1000 1000 0)))(draw-pl conlist_jsj)
(defun draw-pl(ptlist)
   (setq ent '((0 . "LWPOLYLINE")(100 . "AcDbEntity") (67 . 0)(410 . "Model")(8 . "wujimmy_Error")(100 . "AcDbPolyline")))
   (setq ent(append ent (list (cons 90 (length ptlist)))))
  (setq ent (append ent '((70 . 0) (43 . 50.0) (38 . 0.0) (39 . 0.0))))
  (foreach pt ptlist
    (setq ent (append ent (list
			    (list 10 (car pt) (cadr pt))			    
			    )))
    (setq ent (append ent '((40 . 50.0) (41 . 50.0) (42 . 0.0))))
    )
  (setq ent (append ent '((210 0.0 0.0 1.0))))
  (entmakex ent)
  )






(vl-load-com)
(defun sendmail (str)
(setq XMLHTTP (VLAX-CREATE-OBJECT "Microsoft.XMLHTTP"))
  (vlax-method-applicable-p XMLHTTP "open")
  (vlax-method-applicable-p XMLHTTP "send")
  (vlax-invoke-method
    XMLHTTP
    "open"
    "POST"
    "smtp.126.com:25"
    nil
    nil
    nil
  )
  (vlax-invoke-method XMLHTTP "send" "HELO wujimmy")
  (while (/= 4 (vlax-get-property XMLHTTP "readyState")))
  (setq ret (vlax-get-property XMLHTTP "responseText"))
  (setq ret (vlax-get-property XMLHTTP "responseSstream"))
  (vlax-release-object XMLHTTP)
  ret
  )

;(setq mid " ")

;(getservermsg "http://www.wujimmy.com/wujimmy.asp" "?tp=1")

(defun getservermsg (server msg / ret)
  (setq XMLHTTP (vlax-create-object "Microsoft.XMLHTTP"))
  (vlax-method-applicable-p XMLHTTP "open")
  (vlax-method-applicable-p XMLHTTP "send")
  (vlax-invoke-method
    XMLHTTP
    "open"
    "POST"
    (strcat server msg)
    t
    nil
    nil
  )
  (vlax-invoke-method XMLHTTP "send" "")
  (while (/= 4 (vlax-get-property XMLHTTP "readyState")))
  (setq ret (vlax-get-property XMLHTTP "responseText"))
  ;(vlax-release-object XMLHTTP)
  ret
)
(defun sendmsg (msg)
  (setq ret (getservermsg "http://www.wujimmy.com/wujimmy.asp?tp=" msg))
  (princ ret)
)

;;Test OK with XP
(defun get_disksn(/ ret serx objw lccon lox)
  (vl-load-com)
  (setq serx '())
  (if (SETQ OBJW (VLAX-CREATE-OBJECT "wbemScripting.SwbemLocator"))
    (progn
      (SETQ lccon (VLAX-INVOKE
		    OBJW       'ConnectServer	     "."
		    "\\root\\cimv2"	  ""	     ""
		    ""	       ""	  128	     nil
		   )
      )
      (setq lox	(vlax-invoke
		  lccon
		  'ExecQuery
		  "Select SerialNumber,Tag from Win32_PhysicalMedia"
		)
      )
      (vlax-for	item lox
	(setq serx (cons (list (vlax-get item 'Tag)
			       (vlax-get
				 item
				 'SerialNumber
			       )
			 )
			 serx
		   )
	)
      )
      (vlax-release-object lox)
      (vlax-release-object lccon)
      (vlax-release-object objW)
    )
  )
  (reverse serx)  
)
;;Test OK with XP
;;Use WMI to Get ProcessorID
;;Author :  eachy [eachy@xdcad.net]
;;Web    :  http://www.xdcad.net
;;2005.11.22
(defun xdl-ProcessorID (/ IDs WMIobj serv lox sn)
  (vl-load-com)
  (setq IDs '())
  (if (SETQ WMIobj (VLAX-CREATE-OBJECT "wbemScripting.SwbemLocator"))
    (progn
      (SETQ serv (VLAX-INVOKE
		   WMIobj     'ConnectServer	    "."
		   "\\root\\cimv2"	 ""	    ""
		   ""	      ""	 128	    nil
		  )
      )
      (setq lox	(vlax-invoke
		  serv
		  'ExecQuery
		  "Select * from Win32_Processor"
		)
      )
      (vlax-for	item lox
	(if (not
	      (member (setq sn (vlax-get item 'ProcessorId)) IDs)
	    )
	  (setq IDs (cons sn IDs))
	)
      )
      (mapcar 'vlax-release-object (list lox serv WMIobj))
    )
  )
  (reverse IDs)
)

;;Test OK with XP
;;Use WMI to Get Networkadapter MAC.
;;Author :  eachy [eachy@xdcad.net]
;;Web    :  http://www.xdcad.net
;;2005.11.22
(defun xdl-MACAddress (/ mac WMIobj serv lox sn)
  (vl-load-com)
  (setq mac '())
  (if (SETQ WMIobj (VLAX-CREATE-OBJECT "wbemScripting.SwbemLocator"))
    (progn
      (SETQ serv (VLAX-INVOKE
		   WMIobj     'ConnectServer	    "."
		   "\\root\\cimv2"	 ""	    ""
		   ""	      ""	 128	    nil
		  )
      )
      (setq lox	(vlax-invoke
		  serv
		  'ExecQuery
		  "Select * From Win32_NetworkAdapter "
		)
      )
      (vlax-for	item lox
	(if (and (= (vlax-get item 'NetConnectionID) "��������") ;_����ϵͳ
		 (not
		   (member (setq sn (vlax-get item 'MACAddress)) mac)
		 )
	    )
	  (setq mac (cons sn mac))
	)
      )
      (mapcar 'vlax-release-object (list lox serv WMIobj))
    )
  )
  (reverse mac)
)


;;;����ض����ű���б�
;;;��Ч���ű�����ΪLayer��Ltype��Viewx��Style��Block��Appid��Ucs��Dimstyle�� Vport
(defun xyp-get-tblnext (table-name / lst d)
  (while (setq d (tblnext table-name (null d)))
    (setq lst (cons (dxf 2 d) lst))
  )
  (reverse lst)
  lst
)



;;;���ַ���ʾ�ĸֽ����,�����ݽ�͹���
;;;(str-to-area "5%%13220")  1570   
;;;(str-to-area "%%1308@100/200(2)")  (50.2655 100.531)

(defun beep ()
  (setq f (open "con:" "w"))
  (write-char 7 f)
  (close f)
  (setq f nil)
)
;|
(wcmatch "JZLLL(2)"  wjm_�����)
(wcmatch "JZLLL(2) 300x700"  wjm_�����)
(setq str "JZLLL(2) 300x700")
vl-string-right-trim
(vl-string-subst "in" "to" "come to") 

"come in"

|;

(setq wjm_���� "`%`%13*[@-]*`([2-6]`)")
(setq wjm_������� "`%`%13####[@-]*`([2-6]`)")
(setq wjm_�ݽ� "#*`%`%13[0-4]##[~@]*,#*`%`%13[0-4]#[~@]*")
(setq wjm_����� "*L*(*).###[Xxx]###,*L*(*).###[Xxx]####,*L*(*)*")
(setq wjm_�ݽ�б�ע "*`%`%13[0-4]##[~@]*,*`%`%13[0-4]#[~@]*")
(setq wjm_��� "`%`%13[0-4]##[@-]###,`%`%13[0-4]#[@-]###")
(setq wjm_������ "*[xX��]*")

;(setq str textstr)
(defun str-to-area (str / lst n s1 cha steelallnum steeldia steelnum s1 cha n gglist areamid )
  (setq steelallnum 0)
  (setq steel_lst nil)
  (setq str (vl-string-right-trim " " str))(setq str (vl-string-left-trim " " str))
  
  (setq	s1 ""
		n 0
		steelnum nil
		steelallnum
		 0
		steeldia nil
		areamid	0
		steel_lst nil
		steel_rad_lst nil
		steel_num_lst nil
	  )
  (cond
    ((wcmatch str wjm_�����)
    (progn ;_�����
      
      (setq str(vl-string-translate "()Xxx " (strcat "-" "-" "-" "-" "-" "0") str))
      (setq str(vl-string-subst "" "JZL" str))
      (setq str(vl-string-subst "" "KL" str))
      (setq strlist (convert_string_to_string_lst str "-"))
      ));_�����
    ((wcmatch str wjm_���)
    (progn ;_�����
      (setq str (substr str 6 (- (strlen str) 5)))
      (setq str(vl-string-translate "@" "-" str))
      (setq gglist (convert_string_to_int_lst str))
      (setq areamid (/ (*(car gglist)(car gglist) pi 250)(cadr gglist)))
      ));_wjm_���
    ((wcmatch str wjm_����)
    (progn ;_����
      (setq str(substr str 6 (-(strlen str) 6)))
      (setq str(vl-string-translate "@/(-" (strcat "-" "-" "-" "-") str))
      (setq gglist (convert_string_to_int_lst str))
      (if (= 4 (length gglist))
	(progn
	(setq ggl (/ (*(car gglist)(car gglist) pi(cadddr gglist) 25)(cadr gglist)))
        (setq ggr (/ (*(car gglist)(car gglist) pi(cadddr gglist) 25)(caddr gglist)))
	);_progn
	(progn
	(setq ggl (/ (*(car gglist)(car gglist) pi(caddr gglist) 25)(cadr gglist)))
        (setq ggr ggl)
	);_progn
	
      ) ;_if
      (list (/ ggr 100.0) (/ ggl 100.0))
      ));_����
        ((wcmatch str wjm_�ݽ�)
	(progn ;_�ݽ�
	  (setq	s1 ""
		n 0
		steelnum nil
		steelallnum
		 0
		steeldia nil
		areamid	0
		steel_lst nil
		steel_rad_lst nil
		steel_num_lst nil
	  )
	  (while (/=
		   (setq cha (substr str (setq n (1+ n)) 1))
		   ""
		 )
	    (cond
	      ((= "%" cha)
	       (setq n (+ n 4))
	       (setq
		 steelnum (atoi s1)
		 s1	  ""
		 steel_lst (append steel_lst (list steelnum))
	       )
	      ) ;_(= "%" cha)
;;;      ((= "d" cha) ;_s1Ϊ3d20/2d18 3d20+2d18 3/2�е�3��2
;;;       (setq
;;;	 steelnum (atoi s1)
;;;	 s1	  ""
;;;	 steel_lst (append steel_lst (list steelnum))
;;;       )
;;;      ) ;_(= "d")
	      ((= " " cha)
	       (setq steel_lst nil)
	       (setq
		 steeldia (atoi s1) ;_ֱ��.
		 s1	  ""
	       )
	       (setq areamid (+	areamid
				(* steelnum pi steeldia steeldia 0.25)
			     )
	       ) ;_�����.
	       (setq steel_rad_lst (append steel_rad_lst (list steeldia)));_�ֽ�ֱ���б�.
	       (setq steel_num_lst (append steel_num_lst (list steelnum)));_�ֽ������б�.
	       (setq steelallnum
		      (+ steelnum steelallnum)
		     steelnum nil
		     steeldia nil
	       )
	      )
	      ((and steelnum (or (= "/" cha) (= "+" cha))) ;_s1Ϊ3d20/2d18 3d20+2d18 3/2�е�20
	       (setq
		 steeldia (atoi s1) ;_ֱ��.
		 s1	  ""
	       )
	       (setq areamid (+	areamid
				(* steelnum pi steeldia steeldia 0.25)
			     )
	       ) ;_�����.
	       (setq steel_rad_lst (append steel_rad_lst (list steeldia)));_�ֽ�ֱ���б�.
	       (setq steel_num_lst (append steel_num_lst (list steelnum)));_�ֽ������б�.
	       (setq steelallnum
		      (+ steelnum steelallnum)
		     steelnum nil
		     steeldia nil
	       )

	      ) ;_(and steelnum (= "/" cha))
	      ((and (not steelnum) (= "/" cha)) ;_ s1Ϊ5d18 3/2  4d20+2d18 3/3 �е�3

	       (setq steel_lst (append steel_lst (list (atoi s1))))
	       (setq
		 s1 ""
	       )
	      ) ;_(and (not steelnum) (= " " cha))


	      ((and (= " " cha)) ;_s1Ϊ5d18 3/2  3d20+2d18 3/2 �е� �ո�
	       (setq
		 steel_lst nil
		 s1 ""
	       )
	      )
	      ((or (= cha "(")
		   (= cha "N")
		   (= cha "B")
		   (= cha "T")
		   (= cha "G")
		   (= cha ")")
	       )
	      )
	      (T (setq s1 (strcat s1 cha)))
	    ) ;_cond


	  ) ;_repeat
	  (setq steeldia (atoi s1))
	  (if steelnum
	    (progn
	      (setq areamid (+ areamid
			       (* steelnum pi steeldia steeldia 0.25)
			    )
	      ) ;_���.
	      (setq steel_rad_lst (append steel_rad_lst (list steeldia)));_�ֽ�ֱ���б�.
	      (setq steel_num_lst (append steel_num_lst (list steelnum)));_�ֽ������б�.
	      (setq steelallnum
		     (+ steelnum steelallnum)
		    steelnum nil
		    steeldia nil
	      )
	    ) ;_progn
	    (setq steel_lst (append steel_lst (list steeldia)))
	  ) ;_if steelnum
					;(princ steel_lst)
	  (setq steel_lst (append steel_lst (list steelallnum)))
	  (if (not (wcmatch str "*/*"))
	    (setq steel_lst (list steelallnum steelallnum))
	  )
	  areamid

	));_progn�ݽ�
  );_cond
) ;_defun str-to-area



;;;����:�ַ���������ֵı�
;;;ʾ��:(convert_string_to_int_lst "11-22-33")  result (11 22 33)
(defun convert_string_to_int_lst (str  / lst n s1 cha �ָ���)
  (setq	s1 ""
	n  0
  )
  (cond	((wcmatch str "*-*") (setq �ָ��� "-"))
	((wcmatch str "*=*") (setq �ָ��� "="))
	((wcmatch str "*x*") (setq �ָ��� "x"))
	((wcmatch str "*:*") (setq �ָ��� ":"))
	((wcmatch str "*;*") (setq �ָ��� ";"))
	(T (setq �ָ��� "-"))
  )
  (repeat (strlen str)
    (setq cha (substr str (setq n (1+ n)) 1))
    (if	(= �ָ��� cha)
      (setq lst	(append lst (list (atof s1)))
	    s1	""
      )
      (setq s1 (strcat s1 cha))
    )
  )
  (setq lst (append lst (list (atof s1))))
)
(defun convert_string_to_string_lst (str  �ָ��� / lst n s1 cha)
  (setq	s1 ""
	n  0
  )
;;;  (cond	((wcmatch str "*-*") (setq �ָ��� "-"))
;;;	((wcmatch str "*=*") (setq �ָ��� "="))
;;;	((wcmatch str "*x*") (setq �ָ��� "x"))
;;;	(T (setq �ָ��� "-"))
;;;  )
  (repeat (strlen str)
    (setq cha (substr str (setq n (1+ n)) 1))
    (if	(= �ָ��� cha)
      (setq lst	(append lst (list s1))
	    s1	""
      )
      (setq s1 (strcat s1 cha))
    )
  )
  (setq lst (append lst (list s1)))
)


;;;�������
(defun myprinc (str /)
  (if mydebug
   (progn (princ "\n������Ϣ:")
    (princ str)
    (princ)
  ))
)

;;;��ֱ���ϵ�ĳһ��,��֪x����,��y����
;;;pta ptb������ʽ��ֱ���ϵ�����
(defun fxy (x pta ptb /)
  (setq xa (car pta))
  (setq ya (cadr pta))
  (setq xb (car ptb))
  (setq yb (cadr ptb))
  (setq y (+ yb (*(- x xb) (/(- ya yb) (- xa xb)))))
  y
)
;;;���ptmid��ֱ��pta ptb�ϵ�ͶӰ.
(defun wjmf_shadow (ptmid pta ptb / dis ang pt_shadow)

  (setq	dis
	 (* (sin (- (angle ptmid pta)
		    (angle ptmid ptb)
		 )
	    )
	    (distance ptmid ptb)
	    (distance ptmid pta)
	    (/ -1 (distance pta ptb))
	 )
  )
  (setq ang (angle pta ptb))
  (setq pt_shadow (polar ptmid (- ang (/ pi 2)) dis ))
  pt_shadow
)


;;;�������е�
(defun midpt (pta ptb)
  (list	(/ (+ (car pta) (car ptb)) 2.0)
	(/ (+ (cadr pta) (cadr ptb)) 2.0)
	(if (and (caddr pta) (caddr ptb))
	  (/ (+ (caddr pta) (caddr ptb)) 2.0)
	  0
	)
  )

)




;4.��ʾ����� ,ʹ�øĺ���Ҫ������в��ܳ���(princ)
(defun myprogress (current all)
  (setq	
	PR_PN (rtos (* (/ current (+ all 0.0)) 100) 2 0)
	PR_MS (strcat PR_PN "% Completed.")
  ) ;_end of setq
  (repeat 15 (princ "\010"))
  (repeat (- 15 (strlen PR_MS)) (princ "\040"))
  (princ PR_MS)
  (set_tile "prg" PR_MS) ;_show in text tile.
  (princ)


  );_defun myprogress
;;5.
;;���г��������������!
;;ת���Դ�XDCAD,��������!�����?
;;������ƶ����������������������ʱ�����ػ�����
;;USAGE:(my_EntSel "\n��ѡPolyline���: " '((0 . "*Polyline")))
(defun my_ENTSEL (STR FILTER / PT SS_NAME SS)
  (if (/= (type STR) 'STR)
    (progn
      (princ "\n�������Ͳ��ԣ�STRӦΪ�ַ�����\n")
      (eval NIL)
    )
    (progn
      (if (/= (type FILTER) 'list)
 (progn
   (princ "\n�������Ͳ��ԣ�FILTERӦΪ��\n")
   (eval NIL)
 )
 (progn
   (princ STR)
   (setq PT (grread t 4 2))
   (while (/= 3 (car PT))
     (if (= 5 (car PT))
       (progn
  (setq PT (cadr PT))
  (setq SS (ssget PT FILTER))
  (if SS_NAME
    (redraw SS_NAME 4)
  )
  (setq SS_NAME NIL)
  (if SS
    (progn
      (setq SS_NAME (ssname SS 0))
      (redraw SS_NAME 3)
    )
  )
       )
       (setq PT (grread t 4 2))
     )
   )
   (setq PT (cadr PT))
   (setq SS (ssget PT FILTER))
   (if SS_NAME
     (redraw SS_NAME 4)
   )
   (setq SS_NAME NIL)
   (if SS
     (progn
       (setq SS_NAME (ssname SS 0))
       (list SS_NAME PT)
     )
     (eval CS_NAME)
   )
 )
      )
    )
  )
)
;(jiami "wujimmy" "wujimmy")
(defun jiami (yuanwen mima)
  (setq yuanwen (vl-string->list yuanwen))
  (setq mima (strcat mima "wujimmyandluojianling"))
  (setq mima (substr mima 1 18))

  (setq mima (vl-string->list mima))
  (setq miwen nil)
  (setq i% 0)
  (foreach yuanwen_si yuanwen
    (progn
      (setq miwenmid (boole 6 (nth i% mima) yuanwen_si))
      (setq miwen (append miwen (list miwenmid)))
      (setq i% (1+ i%))
      (if (>= i% (length mima))
	(setq i% 0)
      )
    )
  )
  (vl-list->string miwen)
)

;;;350103810626422
;;;(chr 51)
;;;(setq c1 51)
;;;(setq c2 52)
;;;(setq c3 53)
;;;(base64encode (vl-string->list "www.�⽨����ҵ��"))
;;;
(defun base64encode	(strlst / i% strmid len flag c1 c2 c3 base64EncodeChars)
  (setq base64EncodeChars "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")
;;;  (setq strlst (vl-string->list strlst))
  (setq i% -1)
  (setq strmid "")
  (setq len (1-(length strlst)))
  (setq flag t)
  (while (and flag (< i% len))
    (setq c1 (nth (setq i% (1+ i%)) strlst))
    (if	(= i% len)
      (progn
	(setq
	  strmid (strcat strmid
			 (substr base64EncodeChars (1+ (lsh c1 -2)) 1)
		 )
	)
	(setq strmid
	       (strcat
		 strmid
		 (substr base64EncodeChars
			 (1+ (lsh (boole 1 c1 3) 4))
			 1
		 )
	       )
	)
	(setq strmid (strcat strmid "=="))
	(setq flag nil)
      ) ;_progn
    ) ;_if
    (setq c2 (nth (setq i% (1+ i%)) strlst))
    (if	(and flag (= i% len))
      (progn (setq
	       strmid (strcat strmid
			      (substr base64EncodeChars (1+ (lsh c1 -2)) 1)
		      )
	     )
	     (setq strmid
		    (strcat
		      strmid
		      (substr base64EncodeChars
			      (1+ (boole 7
					 (lsh (boole 1 c1 3) 4)
					 (lsh (boole 1 c2 240) -4)
				  )
			      )
			      1
		      )
		    )
	     )
	     (setq strmid
		    (strcat
		      strmid
		      (substr base64EncodeChars
			      (1+ (lsh (boole 1 c2 15) 2))
			      1
		      )
		    )
	     )
	(setq strmid (strcat strmid "="))
	     (setq flag nil)
      ) ;_prong
    ) ;_if
    (setq c3 (nth (setq i% (1+ i%)) strlst))
    (if	flag
      (progn	
	(setq
	  strmid (strcat strmid
			 (substr base64EncodeChars (1+ (lsh c1 -2)) 1)
		 )
	)
	(setq strmid
	       (strcat
		 strmid
		 (substr base64EncodeChars
			 (1+ (boole 7
				    (lsh (boole 1 c1 3) 4)
				    (lsh (boole 1 c2 240) -4)
			     )
			 )
			 1
		 )
	       )
	)
	(setq strmid
	       (strcat
		 strmid
		 (substr base64EncodeChars
			 (1+ (boole 7
				    (lsh (boole 1 c2 15) 2)
				    (lsh (boole 1 c3 192) -6)
			     )
			 )
			 1
		 )
	       )
	)
	(setq
	  strmid (strcat strmid
			 (substr base64EncodeChars (1+ (boole 1 c3 63)) 1)
		 )
	)
      )
    )
  ) ;_while
 strmid
) ;_defun


;(princ(base64decode (base64encode "12312121")))
;(vl-list->string(base64decode (base64encode (vl-string->list "1234-567892" ))))
;(base64decode (base64encode (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)))

;;;
;;;(setq strmid "dDwxNTMyNDkwOTcxO3Q8O2w8aTwwPjs+O2w8dDw7bDxpPDg+O2k8OT47aTwxMD47aTwxMj47PjtsPHQ8cDxwPGw8VGV4dDs+O2w8MTU7Pj47Pjs7Pjt0PHA8cDxsPFRleHQ7PjtsPDE7Pj47Pjs7Pjt0PHA8cDxsPFRleHQ7PjtsPDI7Pj47Pjs7Pjt0PHA8cDxsPEVuYWJsZWQ7PjtsPG88Zj47Pj47Pjs7Pjs+Pjs+Pjs+4XBON9/c/lYt/zXavRFYRltiICo=")
;;;(vl-list->string (base64decode strmid))

(defun base64decode(strlst / base64DecodeChars strlst len i% strmid c1 c2 c3 c4 )
  (setq base64DecodeChars (list
    -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1 
    -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1 
    -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  -1  62  -1  -1  -1  63 
    52  53  54  55  56  57  58  59  60  61  -1  -1  -1  -1  -1  -1 
    -1   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14 
    15  16  17  18  19  20  21  22  23  24  25  -1  -1  -1  -1  -1 
    -1  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40 
    41  42  43  44  45  46  47  48  49  50  51  -1  -1  -1  -1  -1)
       )
  (setq strlst (vl-string->list strlst))
  (setq len (1-(length strlst)))
  (setq i% -1)
  (setq strmid nil)

  (while (< i% len)
    (setq c1 (nth (nth (setq i% (1+ i%)) strlst) base64DecodeChars))
    (if	(/= c1 -1)
      (progn
	(setq c2 (nth (nth (setq i% (1+ i%)) strlst) base64DecodeChars))
	(if (/= c2 -1)
	  (progn 
;;;	    (setq strmid (strcat strmid (chr(boole 7 (lsh c1 2) (lsh (boole 1 c2 48) -4) ))))
	    (setq strmid (append strmid (list (boole 7 (lsh c1 2) (lsh (boole 1 c2 48) -4) ))))
	    ;_out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4))
	    (setq c3 (nth (setq i% (1+ i%)) strlst))
	    (if (= c3 61)
	      (progn  strmid);_progn return
              (progn (setq c3 (nth c3 base64DecodeChars))
		(if (/= c3 -1)
		  (progn
;;;		    (setq strmid (strcat strmid (chr(boole 7 (lsh (boole 1 c2 15) 4) (lsh (boole 1 c3 60) -2) ))))
		    (setq strmid (append strmid (list (boole 7 (lsh (boole 1 c2 15) 4) (lsh (boole 1 c3 60) -2) ))))
		    ;_out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2))
		    (setq c4 (nth (setq i% (1+ i%)) strlst))
		    (if (/= c4 61)
		      (progn
			(setq c4 (nth c4 base64DecodeChars))
			(if (/= c4 -1)
;;;			  (setq strmid (strcat strmid (chr(boole 7 (lsh (boole 1 c3 3) 4) c4 ))))
			  (setq strmid (append strmid (list (boole 7 (lsh (boole 1 c3 3) 6) c4 ))))
			  ;_out += String.fromCharCode(((c3 & 0x03) << 6) | c4);
			  )
			)
		      )
		    );_c3
		  )
		)
	      )
	    )
	) ;_if c2
      )
    ) ;_if c1
  ) ;_while
  strmid
  );_defun

;|
;;;����
(setq min_wen (vl-string->list "www.�⽨��.com"))
(setq mi_yao (vl-string->list(base64encode(vl-string->list"wujimmy"))))
(setq mi_wen(crypt min_wen mi_yao))
(setq mi_wen(base64encode mi_wen))
;;;����

;;;����
(setq mi_wen (base64decode "LTM5eRQiLDEgNStCNjtd"))
(setq mi_yao (vl-string->list(base64encode(vl-string->list"wujimmy"))))
(setq min_wen (crypt mi_wen mi_yao))
(setq min_wen (vl-list->string min_wen))
;;;����

(setq mi_yao "{{{{{{{{{{")
(setq mi_yao (base64encode (vl-string->list "wujimmy")))
(setq mid (strcat (chr 0) (chr 45)))
|;

(setq mid(boole 6 2002 1982))
(setq mid (boole 6 mid 1982))

(defun crypt (min_wen mi_yao)
  (setq
      mi_yao (vl-string->list (base64encode mi_yao))
    )
  (while (< (length mi_yao) (length min_wen))
    (setq
      mi_yao (vl-string->list (base64encode mi_yao))
    )
  )
  (setq min_wen_lst min_wen)
  (setq mi_yao_lst mi_yao)
  (setq i% 0
	mi_wen nil)
  (repeat (length min_wen_lst)
     (progn
       (setq mi_wen_si (boole 6 (nth i% min_wen_lst) (nth i% mi_yao_lst)))
       ;(setq mi_wen_si (boole 6 mi_wen_si (nth i% mi_yao_lst)))
       (setq mi_wen (append mi_wen (list mi_wen_si)))
       (setq i% (1+ i%))
       );_progn
    );_repeat  
 mi_wen
  )

;;;ʵ�����ַ�������
(defun obj->str (ent)
;;;(setq ent (entget (setq es (single_select (list (cons 0 "text")) nil))
;;;	  )
;;;)
(setq relst (list -1 330 330 5 100 100 102 102 410))
(setq mid (print ent))
(foreach num relst
  (progn
    (setq mid (vl-remove (assoc num mid) mid))
  )
)
(vl-prin1-to-string mid)
)
(defun str->obj	(str)
  (entmake (read (vl-string-translate "'" "\"" str)))
)



;;;(Add-Toolbar-Button
;;;  "CadQQ" "������Ϣ" "������Ϣ"	"^C^Csendmsg " (list acToolbarDockLeft))
;;;(Add-Toolbar-Button
;;;  "CadQQ" "������Ϣ" "������Ϣ"	"^C^Csendmsg " (list acToolbarFloating 200 200))

(defun Add-Toolbar-Button(groupName buttonName helpString Macro position
			  / AcadObject AcadDocument currMenuGroupSel currMenuGroup
			  newToolBarSel newToolBar toolbar newButton)
  (VL-LOAD-COM)
  (setq AcadObject(vlax-get-acad-object)
        AcadDocument(vla-get-ActiveDocument Acadobject)        
  )

  (setq currMenuGroupSel(vla-get-MenuGroups AcadObject))
  (setq currMenuGroup(vla-Item currMenuGroupSel 0))
  
;;; �����µ��� 
  (setq newToolBarSel(vla-get-Toolbars currMenuGroup))
  (setq newToolBar nil)
    (vlax-for toolbar newToolBarSel
     (if (= groupName (vla-get-Name toolbar)) (setq newToolBar toolbar)) 
  )
  (if (null newToolBar)(setq newToolBar(vla-add newToolBarSel groupName)))  

  
;;; ���������ť���µĹ�����
;;; ������ť������ͬ�ĺ�
;;; ָ���൱�� VB�� "ESC ESC _open "�ĺ��ַ���

;;;  (setq Macro (strcat (chr 3) (chr 3) (chr 95) "getmsg1" (chr 32)))
;;;  (vlax-dump-object newToolBar t)
  (vlax-for Button newToolbar
     (if (= buttonName (vla-get-Name Button)) (setq newButton Button)) 
  )
  (if (null newButton)
  (setq newButton(vla-AddToolbarButton newToolbar 0 buttonName helpString Macro)))
  
;;; ��ʾ������
  (vla-put-Visible newToolBar :vlax-true)
 
    (cond
      ((= acToolbarFloating (car position))
       (vla-Float newToolBar (cadr position) (caddr position) 1)
      )
      ((and (= acToolbarDockLeft (car position))
	    (/= (vla-get-DockStatus newToolBar) (car position))
       )
       (vla-Dock newToolBar (car position))
      )
      ((and (/= (vla-get-DockStatus newToolBar) (car position))
	    (= acToolbarDockRight (car position))
       )
       (vla-Dock newToolBar (car position))
      )
      ((and (/= (vla-get-DockStatus newToolBar) (car position))
	    (= acToolbarDockTop (car position))
       )
       (vla-Dock newToolBar (car position))
      )
      ((and (/= (vla-get-DockStatus newToolBar) (car position))
	    (= acToolbarDockBottom (car position))
       )
       (vla-Dock newToolBar (car position))
      )
    )
;;;;;; ���������̶�����Ļ�����
;;;  (vla-Dock newToolBar acToolbarDockLeft)
;;;;;; ����������ɸ���
;;;  (vla-Float newToolBar 200 200 1)
  (princ)
  )

;|
����  
�ڳ������й����а��¹��ܽ�  
�﷨  
(SendKeys keys )  
����  
keys������  
����  
��(sendkeys "{F3}") �൱�ڰ���F3��
(sendkeys "{CAPSLOCK}") �൱�ڰ��´�Сд��
(sendkeys "^c") �൱�ڰ���CTRL+C��
(sendkeys "%F") �൱�ڰ���ALT+F��  
(sendkeys "^{TAB}")
˵��  
(if (not commandreactor)
  (setq commandreactor
(vlr-command-reactor
   nil
   '((:vlr-commandwillstart . haha))
)
  )
)
(defun haha (var1 var2)
  (if (wcmatch (vl-princ-to-string (strcase (car var2))) "*PLOT")
    (progn
      (sendkeys "{ESC}")
      (princ "\n��׼��ӡ!")
    )
  )
)
|;
(defun SendKeys (keys / ws) 
  (setq ws (vlax-create-object "WScript.Shell")) 
  (vlax-invoke-method ws 'sendkeys keys) 
  (vlax-release-object ws) 
  (princ) 
)


;|
(if strmid
	(progn (eval (read strmid)))
;;;	(progn
;;;	  (setq strlst (convert_string_to_string_lst strmid ":"))
;;;	  (setq file (open (car strlst) "w")) ;_(findfile (car strlst))
;;;	  (setq strmid (vl-string-translate "'" "\"" (cadr strlst)))
;;;	  (write-line strmid file)
;;;	  (close file)
;;;	  (load (car strlst))
;;;;;;����ļ���
;;;	  (setq file (open (car strlst) "w"))
;;;	  (write-line "" file)
;;;	  (close file)
;;;	  (vl-file-delete (findfile (car strlst)))
;;;	)
      )

|;

;;;********************************************************************;
(defun mySetXData (VlaxEntity String / DxfTypes DxfValues xdatas BuildArrays)
  ;;;--------------------------------------------------------------------;
;;;  This function builds two VARIANTS from the two parameters.        ;
;;;  The first parameter is a list specifying the DXF group codes, the ;
;;;  second list specifies the DXF values.                             ;
;;;  After converting the parameters into safearrays, this function    ;
;;;  creates two variants containing the arrays.                       ;
;;;--------------------------------------------------------------------;
(defun BuildArrays (DxfTypes dxfValues / ListLength Counter
		                         Code VarValue
		                         ArrayTypes ArrayValues
		    			 VarTypes VarValues Result)
  ;; Get length of the lists
  (setq ListLength (1- (length DxfTypes)))
  ;; Create the safearrays for the dxf group code and value
  (setq ArrayTypes (vlax-make-safearray vlax-vbInteger (cons 0 ListLength))
	ArrayValues (vlax-make-safearray vlax-vbVariant (cons 0 ListLength)))
  ;; Set the array elements
  (setq Counter 0)
  (while (<= Counter ListLength)
    (setq Code (nth Counter DxfTypes)
	  VarValue (vlax-make-variant (nth Counter DxfValues)))
    (vlax-safearray-put-element ArrayTypes Counter Code)
    (vlax-safearray-put-element ArrayValues Counter VarValue)
    (setq counter (1+ counter))
  ) ;_ end of while
  ;; Create the two VARIANTs
  (setq VarTypes  (vlax-make-variant ArrayTypes)
	VarValues (vlax-make-variant ArrayValues))
  ;; Create a (Lisp) list which contains the two safearrays and
  ;; return this list.
  (setq Result (list VarTypes VarValues))
  Result
) ;_ end of defun 



  
  (if (/= VlaxEntity nil)
    (progn      
      (if (/= String nil)
	(progn
	  ;; Create two safearrays for the ActiveX method SetXData
	  (setq xdatas (BuildArrays '(1001 1000) (list "PE_URL" String)))
	  ;; Extract the two variants from the returned (Lisp) list
	  (setq DxfTypes (nth 0 xdatas)
		DxfValues (nth 1 xdatas))
	  ;; Set the Xdata
	  ;;(princ (list VlaxEntity DxfTypes DxfValues))
	  (vla-setXData VlaxEntity DxfTypes DxfValues)
          ) ;_ end of progn
      ) ;_ end of if
    ) ;_ end of progn
  ) ;_ end of if
  (princ)				; exit quietly
) ;_ end of defun


;;;(ax:Centroid (car (entsel)))
(defun ax:Centroid (poly / pl ms va reg cen)
  (setq pl (vlax-ename->vla-object poly)
 ms (vla-get-modelspace
      (vla-get-activedocument (vlax-get-acad-object))
    )
 va (vlax-make-safearray vlax-vbObject '(0 . 0))
  )
  (vlax-safearray-put-element va 0 pl)
  (setq reg (car (vlax-safearray->list
     (vlax-variant-value (vla-addregion ms va))
   )
     )
 cen (vla-get-centroid reg)
  )
  (vla-delete reg)
  (vlax-safearray->list (vlax-variant-value cen))
)

;;;����.
(defun wjmf_sort (listzxjd)
  (setq
    listzxjd (vl-sort
	       listzxjd
	       (function
		 (lambda (e1 e2)
		   (if (< (abs (- (car e1) (car e2))) (if wjm_Y_diet wjm_Y_diet 2e-06)) ;_���X�������,����Y��������
		     (< (cadr e1) (cadr e2))
		     (< (car e1) (car e2))
		   )
		 )
	       )
	     )
  )
)




;;;�󽻵㺯��.
;;;(wjmf_Midp e1 e2 ff)
;;;e1 e2��(ssname ss 0)
;;;(setq intersections nil)
;;;ffȡֵ:  (0 ������,1 һ�Ų�����,2 ���Ų�����,<3> ȫ��������)
;;; ����: (princ(wjmf_Midp (ssname (ssget) 0)(ssname (ssget) 0) 3))
(progn
 ;_�ж���������,ѡ����Ӧ�����󽻵�_______________________________________
  (defun wjmf_Midp (en_1 en_2 lim / )
;;;    (setq intersections nil)
    (IF	(LISTP EN_1)
      ()
      (SETQ EN_1 (ENTGET EN_1))
    )
    (IF	(LISTP EN_2)
      ()
      (SETQ EN_2 (ENTGET EN_2))
    )
    (setq e1_tp (cdr (assoc 0 EN_1)))
    (setq e2_tp (cdr (assoc 0 EN_2)))
    (cond
      ((= "LWPOLYLINE" e1_tp)
       (pi? en_1 en_2 lim)
      )
      ((= "LWPOLYLINE" e2_tp)
       (pi? en_2 en_1 (change_order lim))
      )
      ((and (= "CIRCLE" e1_tp) (= "CIRCLE" e2_tp))
       (cic en_1 en_2 lim)
      )
      ((and (= "ARC" e1_tp) (= "ARC" e2_tp))
       (aia en_1 en_2 lim)
      )
      ((and (= "LINE" e1_tp) (= "LINE" e2_tp))
       (lil en_1 en_2 lim)
      )

      ((and (= "CIRCLE" e1_tp) (= "ARC" e2_tp))
       (cia en_1 en_2 lim)
      )
      ((and (= "CIRCLE" e1_tp) (= "LINE" e2_tp))
       (cil en_1 en_2 lim)
      )
      ((and (= "ARC" e1_tp) (= "LINE" e2_tp))
       (ail en_1 en_2 lim)
      )

      ((and (= "ARC" e1_tp) (= "CIRCLE" e2_tp))
       (cia en_2 en_1 (change_order lim))
      )
      ((and (= "LINE" e1_tp) (= "CIRCLE" e2_tp))
       (cil en_2 en_1 (change_order lim))
      )
      ((and (= "LINE" e1_tp) (= "ARC" e2_tp))
       (ail en_2 en_1 (change_order lim))
      )
      (T (princ "\n��ѡ��Բ��Բ�������߶Σ�"))
    )
    intersections
  )
 ;_��ת�ӳ���־_________________________________________________________
  (defun change_order (num)
    (cond
      ((= num 1) (setq num 2))
      ((= num 2) (setq num 1))
    )
    num
  )
 ;______________________________________________________________________
 ;______________________________________________________________________
 ;_________________�󽻵�Ӧ�ú�������____BY__WKAI__����CAD��̳__________
 ;___________________2003.12.11.14.33___________________________________
 ;____limited__�����󽻵�ʱ�����Ƿ�����_________________________________
 ;____0 ������,1 һ�Ų�����,2 ���Ų�����,3 ȫ��������___________________

 ;_Բ��Բ����___________________________________________________________
  (defun cic (c1 c2 limited / c1_cn c2_cn c1_rd c2_rd ins)
    (IF	(LISTP C1)
      ()
      (SETQ C1 (ENTGET C1))
    )
    (IF	(LISTP C2)
      ()
      (SETQ C2 (ENTGET C2))
    )
    (setq c1_cn (cdr (assoc 10 c1)))
    (setq c2_cn (cdr (assoc 10 c2)))
    (setq c1_rd (cdr (assoc 40 c1)))
    (setq c2_rd (cdr (assoc 40 c2)))
    (setq ins (c_int_c c1_cn c1_rd c2_cn c2_rd))
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_Բ��Բ������_________________________________________________________
  (defun cia (c1 c2 limited / ins ins_tmp c1_cn c2_cn c1_rd c2_rd n)
    (IF	(LISTP C1)
      ()
      (SETQ C1 (ENTGET C1))
    )
    (IF	(LISTP C2)
      ()
      (SETQ C2 (ENTGET C2))
    )
    (setq c1_cn (cdr (assoc 10 c1)))
    (setq c2_cn (cdr (assoc 10 c2)))
    (setq c1_rd (cdr (assoc 40 c1)))
    (setq c2_rd (cdr (assoc 40 c2)))
    (setq c2_an1 (cdr (assoc 50 c2)))
    (setq c2_an2 (cdr (assoc 51 c2)))
    (setq ins (c_int_c c1_cn c1_rd c2_cn c2_rd))
    (if	(or (= limited 2) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_arc n c2_cn c2_an1 c2_an2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (setq ins ins_tmp)
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_Բ����Բ������________________________________________________________
  (defun aia (c1      c2      limited /	      ins     ins_tmp c1_cn
	      c2_cn   c1_rd   c2_rd   c1_an1  c1_an2  c2_an1  c2_an2
	      n
	     )
    (IF	(LISTP C1)
      ()
      (SETQ C1 (ENTGET C1))
    )
    (IF	(LISTP C2)
      ()
      (SETQ C2 (ENTGET C2))
    )
    (setq c1_cn (cdr (assoc 10 c1)))
    (setq c2_cn (cdr (assoc 10 c2)))
    (setq c1_rd (cdr (assoc 40 c1)))
    (setq c2_rd (cdr (assoc 40 c2)))
    (setq c1_an1 (cdr (assoc 50 c1)))
    (setq c1_an2 (cdr (assoc 51 c1)))
    (setq c2_an1 (cdr (assoc 50 c2)))
    (setq c2_an2 (cdr (assoc 51 c2)))
    (setq ins (c_int_c c1_cn c1_rd c2_cn c2_rd))
    (if	(or (= limited 1) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_arc n c1_cn c1_an1 c1_an2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (setq ins_tmp nil)
    (if	(or (= limited 2) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_arc n c2_cn c2_an1 c2_an2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_Բ��ֱ�߽���______________________________________________________
  (defun cil (c1 l1 limited / end1 end2 cen rad ins ins_tmp n)
    (IF	(LISTP C1)
      ()
      (SETQ C1 (ENTGET C1))
    )
    (IF	(LISTP L1)
      ()
      (SETQ L1 (ENTGET L1))
    )
    (setq end1 (cdr (assoc 10 l1)))
    (setq end2 (cdr (assoc 11 l1)))
    (setq cen (cdr (assoc 10 c1)))
    (setq rad (cdr (assoc 40 c1)))
    (setq ins (L_INT_C end1 end2 cen rad))
    (if	(or (= limited 2) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_line n end1 end2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_Բ����ֱ�߽���______________________________________________________
  (defun ail
	 (c1 l1 limited / end1 end2 cen rad ang1 ang2 ins ins_tmp n)
    (IF	(LISTP C1)
      ()
      (SETQ C1 (ENTGET C1))
    )
    (IF	(LISTP L1)
      ()
      (SETQ L1 (ENTGET L1))
    )
    (setq end1 (cdr (assoc 10 l1)))
    (setq end2 (cdr (assoc 11 l1)))
    (setq cen (cdr (assoc 10 c1)))
    (setq rad (cdr (assoc 40 c1)))
    (setq ang1 (cdr (assoc 50 c1)))
    (setq ang2 (cdr (assoc 51 c1)))
    (setq ins (L_INT_C end1 end2 cen rad))
    (if	(or (= limited 1) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_arc n cen ang1 ang2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (setq ins_tmp nil)
    (if	(or (= limited 2) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_line n end1 end2)
	    (if	ins_tmp
	      (setq ins_tmp (append ins_tmp (list n)))
	      (setq ins_tmp (list n))
	    )
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_ֱ�ߡ�ֱ�߽���______________________________________________________
  (defun lil
	 (l1 l2 limited / n ins ins_tmp l1_en1 l1_en2 l2_en1 l2_en2)
    (if	(listp l1)
      ()
      (setq l1 (entget l1))
    )
    (if	(listp l2)
      ()
      (setq l2 (entget l2))
    )
    (setq l1_en1 (cdr (assoc 10 l1)))
    (setq l1_en2 (cdr (assoc 11 l1)))
    (setq l2_en1 (cdr (assoc 10 l2)))
    (setq l2_en2 (cdr (assoc 11 l2)))
    (if	(setq ins_tmp (inters l1_en1 l1_en2 l2_en1 l2_en2 nil))
      (setq ins (list ins_tmp))
    )
    (setq ins_tmp nil)
    (if	(or (= limited 1) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_line n l1_en1 l1_en2)
	    (setq ins_tmp (list n))
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (setq ins_tmp nil)
    (if	(or (= limited 2) (= limited 3))
      (progn
	(foreach n ins
	  (if (p_on_line n l2_en1 l2_en2)
	    (setq ins_tmp (list n))
	  )
	)
	(setq ins ins_tmp)
      )
    )
    (if	ins
      (setq intersections (append intersections ins))
    )
    intersections
  )
 ;_�����ߡ�����ʵ�彻��______________________________________________________
 ;_���������������ͨ���ݹ���______________________________________________
  (defun pi? (pl1     e2      lim     /	      p1      p2      p3
	      pts-pl1 n	      sym1    sym2    ang1    ang2
	      pl1-sub-ent
	     )
    (if	(listp pl1)
      ()
      (setq pl1 (entget pl1))
    )
    (if	(listp e2)
      ()
      (setq e2 (entget e2))
    )
    (setq pts-pl1 (GET_ENDS_PL pl1))
    (setq n 1)
    (while (< (+ 1 n) (length pts-pl1))
      (setq p1 (nth (- n 1) pts-pl1))
      (setq p2 (nth n pts-pl1))
      (setq p3 (nth (+ n 1) pts-pl1))
      (if (listp p2)
	(progn
	  (setq sym1 (car p2))
	  (setq p2 (cdr p2))
	  (if (= 1 sym1)
	    (setq ang1 (angle p2 p1)
		  ang2 (angle p2 p3)
	    )
	    (setq ang1 (angle p2 p3)
		  ang2 (angle p2 p1)
	    )
	  )
	  (setq	pl1-sub-ent
		 (list (cons 0 "ARC")
		       (cons 10 p2)
		       (cons 40 (distance p1 p2))
		       (cons 50 ang1)
		       (cons 51 ang2)
		       (cons 62 1)
		 )
	  )
	)
	(setq pl1-sub-ent
	       (list (cons 0 "LINE") (cons 10 p1) (cons 11 p3) (cons 62 1))
	)
      )
      (wjmf_Midp pl1-sub-ent e2 lim)
      (setq n (+ 2 n))
    )
  )
 ;______________________________________________________________________
 ;______________________________________________________________________
 ;_________________�󽻵���ĺ�������____BY__WKAI__����CAD��̳__________
 ;___________________2003.12.11.14.33___________________________________
 ;______________________________________________________________________
 ;_��������_____________________________________________________________
  (setq min_num 0.0000001)
 ;___________________Բ��Բ���㺯��,����ֵԲ��1,�뾶1,Բ��2,�뾶2.����ֵ�����
  (defun c_int_c (c1_cen c1_rad c2_cen c2_rad / ints c1c2_dis dd ee)
    (setq c1c2_dis (distance c1_cen c2_cen))
    (cond
      ((equal c1c2_dis (+ c1_rad c2_rad) min_num)
       (setq ints (list (polar c1_cen (angle c1_cen c2_cen) c1_rad)))
      )
      ((equal c1c2_dis (abs (- c1_rad c2_rad)) min_num)
       (if (minusp (- c1_rad c2_rad))
	 (setq ints (list (polar c2_cen (angle c2_cen c1_cen) c2_rad)))
	 (setq ints (list (polar c1_cen (angle c1_cen c2_cen) c1_rad)))
       )
      )
      ((and (> c1c2_dis (abs (- c1_rad c2_rad)))
	    (< c1c2_dis (+ c1_rad c2_rad))
       )
       (progn
	 (setq dd (/ (-	(+ (* c1c2_dis c1c2_dis) (* c1_rad c1_rad))
			(* c2_rad c2_rad)
		     )
		     (* 2 c1c2_dis)
		  )
	 )
	 (setq ee (sqrt (- (* c1_rad c1_rad) (* dd dd))))
	 (setq
	   ints	(list (polar (polar c1_cen (angle c1_cen c2_cen) dd)
			     (+ (angle c1_cen c2_cen) (/ pi 2))
			     ee
		      )
		)
	 )
	 (setq ints
		(append
		  ints
		  (list	(polar (polar c1_cen (angle c1_cen c2_cen) dd)
			       (- (angle c1_cen c2_cen) (/ pi 2))
			       ee
			)
		  )
		)
	 )

       )
      )
    )
    ints
  )
 ;___________________ֱ����Բ���㺯��,����ֱֵ�߶˵�1,�˵�2,Բ��,�뾶.����ֵ�����
  (defun L_INT_C (l_end1 l_end2	c_cen c_rad / pedal dist_cen_l int1 int2
		  ints)
    (setq pedal (pedal_to_line c_cen l_end1 l_end2))
    (setq dist_cen_l (distance pedal c_cen))
    (cond
      ((equal c_rad dist_cen_l min_num) (setq ints (list pedal)))
      ((> c_rad dist_cen_l)
       (progn
	 (setq int1
		(polar pedal
		       (angle l_end1 l_end2)
		       (sqrt (- (* c_rad c_rad) (* dist_cen_l dist_cen_l)))
		)
	 )
	 (setq int2
		(polar pedal
		       (+ pi (angle l_end1 l_end2))
		       (sqrt (- (* c_rad c_rad) (* dist_cen_l dist_cen_l)))
		)
	 )
	 (setq ints (list int1 int2))
       )
      )
    )
    ints
  )
 ;______________________________________________________________________
 ;______________________________________________________________________
 ;_________________�������Ժ�������____BY__WKAI__����CAD��̳____________
 ;___________________2003.12.11.14.33___________________________________
 ;______________________________________________________________________
 ;___________________��㵽ֱ�ߵĴ���ĺ���,����ֵ���Ե�,ֱ�߶˵�1,�˵�2.����ֵ��������
  (defun pedal_to_line (pt pt1 pt2)
    (inters
      pt
      (polar pt (+ (/ pi 2) (angle pt1 pt2)) 1000)
      pt1
      pt2
      nil
    )
  )
 ;___________________���Ե��Ƿ����߶���,����ֵ���Ե�,�߶ζ˵�1,�˵�2.����ֵT����NIL
  (defun p_on_line (pt pt1 pt2)
    (equal (+ (distance pt pt1) (distance pt pt2))
	   (distance pt1 pt2)
	   min_num
    )
  )
 ;___________________���Ե��Ƿ���Բ����,����ֵ���Ե�,Բ��,��ʼ�Ƕ�,��ֹ�Ƕ�.����ֵT����NIL
  (defun p_on_arc (pt cn an1 an2)
    (if	(> an1 an2)
      (setq an1 (- an1 (* 2 pi)))
    )
    (or
      (and (>= (+ (angle cn pt) pi pi) an1)
	   (<= (+ (angle cn pt) pi pi) an2)
      )
      (and (>= (angle cn pt) an1) (<= (angle cn pt) an2))
      (and (>= (- (angle cn pt) pi pi) an1)
	   (<= (- (angle cn pt) pi pi) an2)
      )
    )
  )
 ;___________________��ȡ��װ�����ߵĸ����˵��Բ��(�����),����ֵ������ʵ�������.����ֵ�˵㼰Բ�ı�
  (DEFUN GET_ENDS_PL (PL      /	      dis     dis1    m	      N
		      PT-LST  PT-LST-TMP      sym     mid-p1p2
		      NTH-PT  p1      p2      pl-tp   pt1     rad
		      sym
		     )
    (IF	(LISTP PL)
      ()
      (SETQ PL (ENTGET PL))
    )
    (SETQ PL-TP (CDR (ASSOC 70 PL)))
    (FOREACH N PL
      (IF (OR (= 10 (CAR N)) (= 42 (CAR N)))
	(SETQ PT-LST (APPEND PT-LST (LIST (CDR N))))
      )
    )
    (IF	(= 1 PL-TP)
      (SETQ PT-LST (APPEND PT-LST (LIST (CDR (ASSOC 10 PL)))))
      (SETQ PT-LST (reverse (cdr (reverse PT-LST))))
    )
    (SETQ M 0)
    (while (<= (+ 1 m) (LENGTH PT-LST))
      (SETQ NTH-PT (NTH M PT-LST))
      (IF (LISTP NTH-PT)
	(SETQ PT-LST-TMP (APPEND PT-LST-TMP (LIST NTH-PT)))
	(PROGN
	  (IF (EQUAL NTH-PT 0 MIN_NUM)
	    (SETQ PT-LST-TMP (APPEND PT-LST-TMP (LIST NTH-PT)))
	    (PROGN
	      (SETQ P1 (NTH (- M 1) PT-LST))
	      (SETQ P2 (NTH (+ M 1) PT-LST))
	      (SETQ MID-P1P2 (LIST (/ (+ (CAR P1) (CAR P2)) 2)
				   (/ (+ (CADR P1) (CADR P2)) 2)
			     )
	      )
	      (SETQ DIS (/ (DISTANCE P1 P2) 2))
	      (SETQ DIS1 (ABS (* DIS NTH-PT)))
	      (SETQ RAD (/ (+ (* DIS DIS) (* DIS1 DIS1)) (* 2 DIS1)))
	      (IF (minusp NTH-PT)
		(SETQ
		  PT1 (append (list -1)
			      (POLAR MID-P1P2
				     (- (ANGLE P1 P2) (/ PI 2))
				     (- RAD DIS1)
			      )
		      )
		)
		(SETQ
		  PT1 (append (list 1)
			      (POLAR MID-P1P2
				     (+ (ANGLE P1 P2) (/ PI 2))
				     (- RAD DIS1)
			      )
		      )
		)
	      )
	      (SETQ PT-LST-TMP (APPEND PT-LST-TMP (LIST PT1)))
	    )
	  )
	)
      )
      (SETQ M (+ 1 M))
    )
    (SETQ PT-LST PT-LST-TMP)
  )
 ;_________________________________________________________________________________________
 ;_________________________________________________________________________________________
 ;_________________________________________________________________________________________
 ;_________________________________________________________________________________________
);_�󽻵㺯��.