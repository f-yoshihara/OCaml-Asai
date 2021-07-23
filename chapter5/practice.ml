(* 目的 : 時間を受け取って午前か午後かを判断する *)
(* jikan : int -> string *)
let jikan x =
    if x < 12 then "before"
              else "after"
(* test *)
let test1 = jikan 0  = "before"
let test2 = jikan 11 = "before"
let test3 = jikan 12 = "after"
let test4 = jikan 23 = "after"

(* 目的 : ax2 + bx + c = 0 の係数 a, b, c を受け取って判別式の値を返す *)
(* hanbetsusiki : float -> float -> float -> float *)
let hanbetsusiki a b c = b ** 2. -. 4. *. a *. c
(* test *)
let test5  = hanbetsusiki 1. 1. 1.  = -3.
let test6  = hanbetsusiki 1. 2. 3.  = -8.
let test7  = hanbetsusiki 1. (-5.) 4. = 9.
let test8  = hanbetsusiki 2. (-6.) 4. = 4.
let test9  = hanbetsusiki 2. 0. 4.  = -32.
let test10 = hanbetsusiki 2. 4. 0.  = 16.
let test11 = hanbetsusiki 4. 4. 1.  = 0.
let test12 = hanbetsusiki 1. 4. 4.  = 0.

(* 目的 : ax2 + bx + c = 0 の係数 a, b, c を受け取って解の個数を返す *)
(* kai_no_kosuu : float -> float -> float -> int *)
let kai_no_kosuu a b c =
  if hanbetsusiki a b c < 0. then 0
                             else if hanbetsusiki a b c = 0. then 1
                                                             else 2
(* test *)
let test13 = kai_no_kosuu 1. 1. 1.  = 0
let test14 = kai_no_kosuu 1. 2. 3.  = 0
let test15 = kai_no_kosuu 1. (-5.) 4. = 2
let test16 = kai_no_kosuu 2. (-6.) 4. = 2
let test17 = kai_no_kosuu 2. 0. 4.  = 0
let test18 = kai_no_kosuu 2. 4. 0.  = 2
let test19 = kai_no_kosuu 4. 4. 1.  = 1
let test20 = kai_no_kosuu 1. 4. 4.  = 1

(* 目的 : ax2 + bx + c = 0 の係数 a, b, c を受け取って虚数解を持つか否かを判定する *)
(* kyosuukai : float -> float -> float -> bool *)
let kyosuukai a b c =
  if hanbetsusiki a b c < 0. then true
                             else false
(* test *)
let test21 = kyosuukai 1. 1. 1.  = true
let test22 = kyosuukai 1. 2. 3.  = true
let test23 = kyosuukai 1. (-5.) 4. = false
let test24 = kyosuukai 2. (-6.) 4. = false
let test25 = kyosuukai 2. 0. 4.  = true
let test26 = kyosuukai 2. 4. 0.  = false
let test27 = kyosuukai 4. 4. 1.  = false
let test28 = kyosuukai 1. 4. 4.  = false
