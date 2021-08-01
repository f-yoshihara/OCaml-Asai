(* 目的 : 五教科の点数を与えられたらそれらの合計点を計算する *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int *)
let goukei kokugo sugaku eigo rika shakai = kokugo + sugaku + eigo + rika + shakai

(* test *)
let test4 = goukei 1 1 1 1 1 = 5
let test5 = goukei 2 2 2 2 2 = 10
let test6 = goukei 3 3 3 3 3 = 15


(* 目的 : 五教科の点数を与えられたらそれらの合計点と平均点の組を計算する *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> (int * int) *)
let goukei_to_heikin kokugo sugaku eigo rika shakai = (
  goukei kokugo sugaku eigo rika shakai,
  (goukei kokugo sugaku eigo rika shakai) / 5
  )

(* test *)
let test1 = goukei_to_heikin 10 10 10 10 10 = (50, 10)
let test2 = goukei_to_heikin 20 20 20 20 20 = (100, 20)
let test3 = goukei_to_heikin 10 10 20 20 20 = (80, 16)