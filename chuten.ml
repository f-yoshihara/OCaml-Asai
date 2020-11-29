(* 目的 : x座標とy座標の組で表された平面座標を二つ受け取ったらそれらの中点の座標を返す *)
(* chuten : (float * float) -> (float * float) -> (float * float) *)
let chuten point1 point2 = match point1 with
  (x, y) -> (match point2 with
    (x1, y1) -> ((x +. x1)/. 2., (y +. y1)/. 2.))

(* test *)
let test1 = chuten (0.0, 0.0) (1.0, 2.0) = (0.5, 1.0) 
let test2 = chuten (2.3, 5.1) (7.6, 1.7) = (4.95, 3.4) 
let test3 = chuten (-3.8, -2.4) (3.4, -1.2) = (-0.2, -1.8) 