;;;====================�������С���� BY wowan1314 ==================;;;
;;;����:���ѡ���ϵڶ���ʱ�Ҽ���ո������ڵ�
;;;     ����ͬCAD�Ĵ������   2013.7.8
(DEFUN C:BR (/ ENT ERR P1 P2 oldcm *ERROR*)
  (DEFUN *ERROR* (X)
    (IF	ENT
      (REDRAW (CAR ENT) 4)
    )
    (if	oldCM
      (setvar "cmdecho" oldCM)
    )
    (PRINC X)
  )
  (setvar 'errno 0)
  (setq ENT (entsel "ѡ��Ҫ��ϵĶ���:"))
  (setq err (getvar "errno"))
  (while (= err 7)
    (setvar 'errno 0)
    (setq ent (entsel))
    (setq err (getvar "errno"))
  )
  (setq oldCM (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  (IF ENT
    (PROGN
      (SETQ P1 (OSNAP (CADR ENT) "NEA"))
      (REDRAW (CAR ENT) 3)
      (INITGET "F f")
      (SETQ P2 (GETPOINT
		 "\n ָ����ϵĵڶ��� ���һ��<F> �����ڵ�<�Ҽ�>:"
	       )
      )
      (IF P2
	(IF (OR (= P2 "F") (= P2 "f"))
	  (PROGN
	    (princ "\nָ����ϵĵ�һ��:")
	    (VL-CMDF ".BREAK" ENT "F" Pause)
	    (while (/= 0 (getvar "cmdactive"))
	      (princ "\nָ����ϵĵڶ���:")
	      (VL-CMDF Pause)
	    )
	  )
	  (VL-CMDF ".BREAK" ENT "F" P1 P2)
	)
	(VL-CMDF ".BREAK" ENT "F" P1 "@")
      )
    )
  )
  (PRINC)
)
