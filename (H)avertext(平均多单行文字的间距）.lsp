;ƽ���ֲ���������
;���ߣ������
;���ߵ�λ��������ˮ��ˮ��滮���Ժ
;��ֹ����ҵΪĿ�������ϴ���
;�������ʣ�����ϵaqsssjy@mail.hf.ah.cn

(defun c:avertext()

(setq a (ssget (list (cons 0 "text"))))
(setq n (sslength a))
(setq all nil)
(setq m 0)
(while (< m n)
  (setq all (append all (list (entget (ssname a m)))))
  (setq m (1+ m))
)


(setq l 0)
(setq m 1)
(while (< l n)
  (setq b (nth l all))
  (while (< m n)
    (setq c (nth m all))
    (if (> (nth 2 (assoc '10 c)) (nth 2 (assoc '10 b)))
      (progn
      (setq all (subst 'aa (nth l all) all))
      (setq all (subst 'bb (nth m all) all))
      (setq all (subst c 'aa all))
      (setq all (subst b 'bb all))
      (setq b c)
      )
     )
    (setq m (1+ m))
  )
  (setq l (1+ l))
  (setq m (1+ l))
)

(setq a (nth 0 all))
(setq b (nth (1- n) all))
(setq detay (/ (- (nth 2 (assoc '10 a)) (nth 2 (assoc '10 b))) (1- n)))
(setq y0 (nth 2 (assoc '10 a)))

(setq m 0)
(while (< m n)
  (setq b (nth m all))
  (setq x (nth 1 (assoc '10 b)))
  (setq y (- y0 (* m detay)))
  (setq z (nth 3 (assoc '10 b)))
  (setq xyz_new (list '10 x y z))
  (setq b (subst xyz_new (assoc '10 b) b))
  (entmod b)
;  (entupd b)
  (setq m (1+ m))
)

) 
  

  
