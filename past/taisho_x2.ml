(* 目的 : x と y の組で表された平面座標を受け取ったらx軸について対象な点の座標を返す *)
(* taisho_x : int * int -> int * int *)
let taisho_x xy = match xy with (x, y) 
    -> (x, -y)

(* test *)
let test1 = taisho_x (0, 0) = (0, 0)
let test2 = taisho_x (1, 1) = (1, -1)
let test3 = taisho_x (10, (-111)) = (10, 111)