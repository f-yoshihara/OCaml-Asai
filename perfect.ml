(* 目的 : 整数を受け取って1からその整数までの整数をリストにして返す *)
(* enumerate : int -> int list *)
let rec enumerate n =
    if n = 0 then []
    else n :: enumerate (n - 1)

(* test *)
let test1 = enumerate 1 = [1]
let test2 = enumerate 3 = [3; 2; 1]
let test3 = enumerate 6 = [6; 5; 4; 3; 2;]

(* 目的 : 整数を受け取ってその約数をリストにして返す *)
(* divsor : int -> int list *)
let divsor n = List.filter (fun int -> n mod int = 0) (enumerate n)

(* test *)
let test4 = divsor 6 = [6; 3; 2; 1]
let test5 = divsor 0 = []
let test6 = divsor 1 = [1]
let test7 = divsor 2 = [2; 1]
let test8 = divsor 10 = [10; 5; 2; 1]

let sum list = List.fold_right (+) list 0
let test13 = sum [1;1;1] = 3
let test14 = sum [1;1;3] = 5

(* 自然数を受け取ってその数字以下の完全数をリストにして返す *)
(* perfect : int -> int list *)
(* let perfect n = List.filter (
    fun int -> sum(divsor int) - int = int
    ) (enumerate n) *)

let perfect m = List.filter (fun n -> List.fold_right (+) (divsor n) 0 - n = n) (enumerate m)

(* test *)
let test9 = perfect 6 = [6]
let test10 = perfect 1 = []
let test11 = perfect 7 = [6]
let test12 = perfect 29 = [28; 6]
let test15 = perfect 10000;;