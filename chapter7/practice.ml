(* 目的 : 5教科の点数を与えられてその合計点を返す *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int *)
let goukei a b c d e = a + b + c + d + e
(* test *)
let test1 = goukei 0 0 0 0 0 = 0
let test2 = goukei 1 1 1 1 1 = 5
let test3 = goukei 1 2 3 4 5 = 15
let test4 = goukei 2 4 6 8 9 = 29

(* 目的 : 5教科の点数を与えられてその合計点と平均点を返す *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> (int * float)*)
let goukei_to_heikin a b c d e = (goukei a b c d e, (float (goukei a b c d e)) /. 5.)
(* test *)
let test5 = goukei_to_heikin 0 0 0 0 0 = (0, 0.)
let test6 = goukei_to_heikin 1 1 1 1 1 = (5, 1.)
let test7 = goukei_to_heikin 1 2 3 4 5 = (15, 3.)
let test8 = goukei_to_heikin 2 4 6 8 9 = (29, 5.8)

(* 目的 : 名前と成績の組を受け取ってそれらを通知する文字列を返す *)
(* seiseki : (string, int) -> string *)
let seiseki score = match score with (name, grade) -> name ^ "さんの成績は" ^ grade ^ "です"
(* test *)
let test9  = seiseki ("A", "A") = "Aさんの成績はAです"
let test10 = seiseki ("B", "S") = "Bさんの成績はSです"
let test11 = seiseki ("吉原", "C") = "吉原さんの成績はCです"
