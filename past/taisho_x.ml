(* 目的 : x座標とy座標の組で表された平面座標を受け取ったらx軸について対称な点の座標を返す *)
(* taisho_x : (int * int) -> (int * int) *)
let taisho_x pair = match pair with
  (x, y) -> (x, -y)

(* test *)
let test1 = taisho_x (1, 1) = (1, -1)
let test2 = taisho_x (0, 0) = (0, 0)
let test3 = taisho_x (2, 3) = (2, -3)