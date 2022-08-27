(* 目的 : x座標とy座標の組で表された平面座標を２つ受け取ったらその中点座標を返す *)
(* chuten : int * int -> int * int -> int * int *)
let chuten zahyo1 zahyo2 = match zahyo1 with (x, y)
    -> match zahyo2 with (x1, y1)
    -> ((x+x1)/2,(y+y1)/2)

(* test *)
let test1 = chuten (0, 0) (0, 0) = (0, 0)
let test2 = chuten (2, 2) (0, 0) = (1, 1)
let test3 = chuten (10, 10) ((-10), (-10)) = (0, 0)