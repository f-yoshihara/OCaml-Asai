(* 目的 : 現在の気温 t が15度以上25度以下かどうかを確認する *)
(* kaiteki : int -> bool *)
let kaiteki t = t >= 15 && t <= 25

(* test *)
let test1 = kaiteki  7 = false
let test2 = kaiteki 15 = true
let test3 = kaiteki 20 = true
let test4 = kaiteki 25 = true
let test5 = kaiteki 28 = false

(* 目的 : 現在の気温から快適度を表す文字列を計算する *)
(* kion : int -> string *)
let kion t =
  if kaiteki t then "快適"
               else "普通"

(* test *)
let test1 = kion  7 = "普通"
let test2 = kion 15 = "快適"
let test3 = kion 20 = "快適"
let test4 = kion 25 = "快適"
let test5 = kion 28 = "普通"