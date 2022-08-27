(* 目的 : 二つの整数の組を受け取ってそれらを足し合わせた整数を返す *)
(* add : (int * int) -> int *)
let add pair = match pair with 
  (a, b) -> a + b

(* test *)
let test1 = add (0, 0) = 0
let test2 = add (3, 4) = 7
let test3 = add (3, -5) = -2