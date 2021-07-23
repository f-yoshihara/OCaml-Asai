(* 目的 : 現在気温から快適度を返す *)
(* kion : int -> strign *)
let kion t =
  if kaiteki t then "快適"
               else "普通"
(* test *)
let test1 = kion 7  = "普通"
let test2 = kion 15 = "快適"
let test3 = kion 20 = "快適"
let test4 = kion 25 = "快適"
let test5 = kion 28 = "普通"

(* 目的 : 気温が15以上25以下かどうかを判断する *)
(* kaiteki : int -> bool *)
let kaiteki t = 15 <= t && t <= 25
(* test *)
let test6  = kaiteki 14 = false
let test7  = kaiteki 15 = true
let test8  = kaiteki 20 = true
let test9  = kaiteki 25 = true
let test10 = kaiteki 26 = false
