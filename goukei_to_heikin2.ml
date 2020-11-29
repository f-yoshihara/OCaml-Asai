(* 目的 : 5教科の点数を与えられたらその合計点と平均点を組みにして返す *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin k s e r sh = 
(k + s + e + r + sh,
(k + s + e + r + sh) / 5)

(* test *)
let test1 = goukei_to_heikin 1 1 1 1 1 = (5, 1)
let test2 = goukei_to_heikin 1 1 1 1 10 = (14, 2)
let test3 = goukei_to_heikin 0 0 0 0 0 = (0, 0)




(* 目的：５教科の点数の合計点と平均点を組にして返す *) 
(* goukei_to_heikin : int -> int -> int -> int -> int -> int * int *) 
let goukei_to_heikin kokugo suugaku eigo rika shakai = 
  (kokugo + suugaku + eigo + rika + shakai, 
   (kokugo + suugaku + eigo + rika + shakai) / 5) 
 
(* テスト *) 
let test1 = goukei_to_heikin 80 100 90 85 75 = (430, 86) 
let test2 = goukei_to_heikin 90 70 95 65 90 = (410, 82) 
let test3 = goukei_to_heikin 60 50 70 55 65 = (300, 60) 