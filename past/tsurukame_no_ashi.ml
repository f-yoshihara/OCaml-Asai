(* 鶴の数と亀の数を与えられたらそれらの足の本数を返す *)
(* tsurukame_no_ashi int -> int -> int *)
let tsurukame_no_ashi x y = x * 2 + y * 4

(* test *)
let test1 = tsurukame_no_ashi 2 2 = 12
let test2 = tsurukame_no_ashi 10 2 = 28
let test3 = tsurukame_no_ashi 50 30 = 220