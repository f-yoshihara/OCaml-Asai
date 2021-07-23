(* 目的 : 鶴の数を与えられてそれらの足の数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2
(* test *)
let test1 = tsuru_no_ashi 1 = 2
let test2 = tsuru_no_ashi 4 = 8
let test3 = tsuru_no_ashi 9 = 18

(* 目的 : 亀の数を与えられて足の本数を返す *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4
(* test *)
let test4 = kame_no_ashi 1 = 4
let test5 = kame_no_ashi 2 = 8
let test6 = kame_no_ashi 9 = 36

(* 目的 : 鶴と亀の数からそれらの足の数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame
(* test *)
let test7 = tsurukame_no_ashi 0 0 = 0
let test8 = tsurukame_no_ashi 1 1 = 6
let test9 = tsurukame_no_ashi 2 3 = 16

(* 目的 : 鶴亀算。鶴と亀の合計とそれらの足の合計から鶴の数を返す *)
(* tsurukame : int -> int -> int *)
let tsurukame hiki ashi = (4 * hiki - ashi) / 2
(* test *)
let test10 = tsurukame 2 6 = 1
let test11 = tsurukame 4 10 = 3
let test12 = tsurukame 12 28 = 10
let test13 = tsurukame 2 4 = 2
let test14 = tsurukame 2 8 = 0
