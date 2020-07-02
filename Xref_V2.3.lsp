;Xref ���
;Reload/����        Unload/ж��        Detach/����        Bind/��

;XFR        ����ѡ��
;CZCZ        �������� OK
;XFX        ж��ѡ��
;CZXZ        ж������ OK
;XFD        ����ѡ��
;CZCL        ��������
;XFB        ��ѡ��
;CZBD        ������ OK

; -------------------- Reload selected reference files ---------------------
; XFR  
; --------------------------------------------------------------------------
(Defun C:XFR ( )        ;���x������ѡ�������ļ�������

        (setvar "cmdecho" 0)        ;����ִ�й��̲�������ʾ������

          (princ "\nSelect  objects on the reference file to be Reloaded:")

          (if (setq SS (ssget))
                    (progn
                              (setq Rnames "")
                              (repeat 
                                (setq I (sslength SS))
                                (setq E (ssname SS (setq I (1- I))))
                                (setq ELIST (entget E))
                                (setq Rname (cdr (assoc 2 ELIST))) ;_������
                                (command "-xref" "R" Rname)
                                (setq Rnames (strcat Rname ", " Rnames)) ;_strcat ���ӳ��ַ���
                              );end repeat
                              (prompt "\nFiles have been Reloaded:")
                              (princ Rnames)
                    );end progn
          );end if
        (princ)
)

(prompt "\n<����ѡ�������ļ�> ���XFR  ------by sixth 2010-11-17")         ;��ʾ���ִ�г���



; ------------------- Reload all reference files ---------------------
; CZCZ
; --------------------------------------------------------------------
(Defun C:CZCZ ( )          ;���x�����¼��������ⲿ���ա�����
        (setvar "cmdecho" 0)                ;����ִ�й��̲�������ʾ������
        (command "-xref" "R" "*") 
          (princ)
)

(prompt "\n<���¼��������ⲿ����> ���CZCZ  ------by sixth 2010-10-13")         ;��ʾ���ִ�г���



; -------------------- Unload selected reference files ---------------------
; XFX
; --------------------------------------------------------------------------
(Defun C:XFX ( )        ;���x��ж��ѡ�������ļ�������

        (setvar "cmdecho" 0)        ;����ִ�й��̲�������ʾ������

          (princ "\nSelect  objects on the reference file to be Unloaded:")

          (if (setq SS (ssget))
                    (progn
                              (setq Rnames "")
                              (repeat 
                                (setq I (sslength SS))
                                (setq E (ssname SS (setq I (1- I))))
                                (setq ELIST (entget E))
                                (setq Rname (cdr (assoc 2 ELIST))) ;_������
                                (command "-xref" "U" Rname)
                                (setq Rnames (strcat Rname ", " Rnames)) ;_strcat ���ӳ��ַ���
                              );end repeat
                              (prompt "\nFiles have been Unloaded:")
                              (princ Rnames)
                    );end progn
          );end if
        (princ)
)

(prompt "\n<ж��ѡ�������ļ�> ���XFX  ------by sixth 2010-11-17")         ;��ʾ���ִ�г���



; ------------------- Unload all reference files ---------------------
; CZXZ
; --------------------------------------------------------------------
(Defun C:CZXZ ( )          ;���x��ж�������ⲿ���ա�����
        (setvar "cmdecho" 0)                ;����ִ�й��̲�������ʾ������
        (command "-xref" "U" "*") 
          (princ)
)

(prompt "\n<ж�������ⲿ����> ���CZXZ  ------by sixth 2010-10-13")         ;��ʾ���ִ�г���




; -------------------- Detach selected reference files ---------------------
; XFD
; --------------------------------------------------------------------------

(Defun C:XFD ( )        ;���x������ѡ�������ļ�������

        (setvar "cmdecho" 0)        ;����ִ�й��̲�������ʾ������

          (princ "\nSelect  objects on the reference file to be Detached:")

          (if (setq SS (ssget))
                    (progn
                              (setq Rnames "")
                              (repeat 
                                (setq I (sslength SS))
                                (setq E (ssname SS (setq I (1- I))))
                                (setq ELIST (entget E))
                                (setq Rname (cdr (assoc 2 ELIST))) ;_������
                                (command "-xref" "Detach" Rname)
                                (setq Rnames (strcat Rname ", " Rnames)) ;_strcat ���ӳ��ַ���
                              );end repeat
                              (prompt "\nFiles have been Detached:")
                              (princ Rnames)
                    );end progn
          );end if
        (princ)
)

(prompt "\n<����ѡ�������ļ�> ���XFD  ------by sixth 2010-11-17")         ;��ʾ���ִ�г���




; ------------------- Detach all reference files ---------------------
; CZCL
; --------------------------------------------------------------------
(Defun C:CZCL ( )          ;���x�����������ⲿ���ա�����
        (setvar "cmdecho" 0)                ;����ִ�й��̲�������ʾ������
        (command "-xref" "Detach" "*") 
          (princ)
)

(prompt "\n<���������ⲿ����> ���CZCL  ------by sixth 2010-10-25")         ;��ʾ���ִ�г���




; -------------------- Bind selected reference files ---------------------
; XFB
; --------------------------------------------------------------------------

(Defun C:XFB ( )        ;���x����ѡ�������ļ�������

        (setvar "cmdecho" 0)        ;����ִ�й��̲�������ʾ������

          (princ "\nSelect  objects on the reference file to be Binded:")

          (if (setq SS (ssget))
                    (progn
                              (setq Rnames "")
                        (setq oldBT (getvar "BINDTYPE"))
                        (setq BT (if (not BT) oldBT BT))
                        (setq BT_tmp 
                                (getstring 
                                        (strcat "���������[��(0)/����(1)]<" (itoa BT) ">: ")
                                )
                        )
                        (if (null BT_tmp) (setq BT_tmp BT))
                        (setq BT (atoi BT_tmp))
                        (setvar "BINDTYPE" BT)
                              (repeat 
                                (setq I (sslength SS))
                                (setq E (ssname SS (setq I (1- I))))
                                (setq ELIST (entget E))
                                (setq Rname (cdr (assoc 2 ELIST))) ;_������
                                (command "-xref" "Bind" Rname)
                                (setq Rnames (strcat Rname ", " Rnames)) ;_strcat ���ӳ��ַ���
                              );end repeat
                        (setvar "BINDTYPE" oldBT)
                              (prompt "\nFiles have been Binded:")
                              (princ Rnames)
                    );end progn
          );end if
        (princ)
)

(prompt "\n<��ѡ�������ļ�> ���XFB  ------by sixth 2013-09-29")         ;��ʾ���ִ�г���




; ------------------- Bind all reference files ---------------------
; CZBD
; --------------------------------------------------------------------
(Defun C:CZBD ( )          ;���x���������ⲿ���ա�����
        (setvar "cmdecho" 0)                ;����ִ�й��̲�������ʾ������
        (setq oldBT (getvar "BINDTYPE"))
        (setq BT (if (not BT) oldBT BT))
        (setq BT_tmp 
                (getstring 
                        (strcat "���������[��(0)/����(1)]<" (itoa BT) ">: ")
                )
        )
        (if (null BT_tmp) (setq BT_tmp BT))
        (setq BT (atoi BT_tmp))
        (setvar "BINDTYPE" BT)
        (command "-xref" "Bind" "*") 
        (setvar "BINDTYPE" oldBT)
          (princ)
)

(prompt "\n<�������ⲿ����> ���CZBD  ------by sixth 2013-09-29")         ;��ʾ���ִ�г���


;��һ��������·�������·��
(Defun c:tt()
(vl-load-com)
(setq ssg (ssget "x" '((0 . "insert"))))
(setq xpath (getstring "Input xref path:"))
  (setq i 0)
  (repeat (sslength ssg)
(setq obj (vla-item (vla-get-blocks (vla-get-activedocument (vlax-get-acad-object))) (cdr (assoc 2 (entget (ssname ssg i))))))
(if (= (vla-get-isxref obj) :vlax-true) (vla-put-path obj (strcat xpath (vla-get-name obj) ".dwg")))
    (setq i (1+ i))
  )
(command "_xref" "r" "*")
(princ)
)

