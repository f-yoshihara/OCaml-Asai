(* 鶴と亀の数の合計と足の数の合計を与えられたら鶴の数を返す *)
(* tsurukame int -> int -> int *)
let tsurukame x y = 4 * x / 2 - y / 2

(* test *)
let test1 = tsurukame 1 2 = 1
let test2 = tsurukame 2 6 = 1
let test3 = tsurukame 3 8 = 2