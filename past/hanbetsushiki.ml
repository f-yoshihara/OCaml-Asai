(* 目的 : 二次方程式の判別式を計算する *)
(* hanbetsushiki : float -> float *)
let hanbetsushiki a b c = b ** 2. -. ( 4. *. a *. c )

(* test *)
let test1 = hanbetsushiki 1. 2. 3. = (-8.)
let test2 = hanbetsushiki 1. 1. 1. = (-3.)
let test3 = hanbetsushiki 1. 4. 1. = 12.