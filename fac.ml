(* 目的 : 整数を受け取って1からその整数までの整数をリストにして返す *)
(* enumerate : int -> int list *)
let rec enumerate n =
    if n = 0 then []
    else n :: enumerate (n - 1)

(* 目的 : 自然数nの階乗を求める *)
(* fac : int -> int *)
(* let rec fac n = 
    if n = 0 then 1
    else n * fac (n - 1) *)

let fac n = List.fold_right ( * ) (enumerate m) 1

(* test *)
let test1 = fac 0 = 1
let test2 = fac 1 = 1
let test3 = fac 2 = 2
let test4 = fac 3 = 6
let test5 = fac 4 = 24
let test6 = fac 10 = 3628800
