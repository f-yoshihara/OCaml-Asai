(* 受け取った実数の絶対値を返す *)
(* abs_value : float -> float *)
let abs_value x = 
  if x > 0.0 then x
              else -.x

(* test *)
let test1 = abs_value 1. = 1.
let test2 = abs_value (-1.) = 1.
let test3 = abs_value 1.1 = 1.1
let test3 = abs_value 2.8 = 2.8
let test3 = abs_value 0.0 = 0.0