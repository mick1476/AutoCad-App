
(defun c:WBChC (/ ss)
  (princ (strcat "\n*** ��ע����ߴ��Զ��������V110620 ***"))
  (princ (strcat "\n       [��ɽ֮ʯͼ�ι�����]"))
  (princ)

  (GL-Sys-Begin)
  (if (setq ss (ssget '((0 . "dimension"))))
    (GL-Dim-WBCC ss nil)
  ) ;_����if

  (GL-Sys-End)
  (princ (strcat "\n*** ��ע����ߴ��Զ��������V110620 ***"))
  (princ (strcat "\n       [��ɽ֮ʯͼ�ι�����]"))
  (princ)
)

