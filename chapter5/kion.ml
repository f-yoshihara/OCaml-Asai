(* 目的 : 気温が15以上25以下かどうかを判断する *)
(* kaiteki : int -> bool *)
let kaiteki t = 15 <= t && t <= 25
(* test *)
let test1 = kaiteki 14 = false
let test2 = kaiteki 15 = true
let test3 = kaiteki 20 = true
let test4 = kaiteki 25 = true
let test5 = kaiteki 26 = false

(* 目的 : 現在気温から快適度を返す *)
(* kion : int -> string *)
let kion t =
  if kaiteki t then "快適"
               else "普通"
(* test *)
let test6  = kion 7  = "普通"
let test7  = kion 15 = "快適"
let test8  = kion 20 = "快適"
let test9  = kion 25 = "快適"
let test10 = kion 28 = "普通"
