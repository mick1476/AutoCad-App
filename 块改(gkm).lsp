(defun c:gkm (/ NAME NEW-NAME)
  (setq        name (Vlax-Get (Vlax-Ename->Vla-Object
                         (car (entsel "\nѡ��Ҫ�Ŀ����Ŀ飺"))
                       )
                       'Name
             )
  )
  (setq ss-text (entsel "\nѡ���¿���������:"))
  (if (= ss-text nil)
    (setq new-name (getstring "\�����µĿ���:"))
    (setq new-name (Vlax-Get (Vlax-Ename->Vla-Object
                               (car ss-text)
                             )
                             'TextString
                   )
    )
  )
  (command "_.rename" "_block" name new-name)
  (princ)
)