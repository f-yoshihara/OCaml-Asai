(* 鶴の数を与えられたらそれらの足の本数を返す *)
(* tsuru_no_ashi int -> int *)
let tsuru_no_ashi x = x * 2

(* test *)
let test1 = tsuru_no_ashi 2 = 4
let test2 = tsuru_no_ashi 10 = 20
let test3 = tsuru_no_ashi 50 = 100

