(* 目的 : 亀の数を与えられて足の本数を返す *)
(* int -> int *)
let kame_no_ashi x = x * 4

(* test *)
let test1 = kame_no_ashi 1 = 4
let test2 = kame_no_ashi 2 = 8
let test9 = kame_no_ashi 9 = 36
