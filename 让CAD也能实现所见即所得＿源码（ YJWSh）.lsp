(defun c:YJWSh (/		       YJWSH_CENTERPOINT
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
;;;���µõ�����ϵ����������ͼ��С
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
