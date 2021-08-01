(* 目的 : 受け取った整数が偶数かどうかを判断する *)
(* is_even : int -> bool *)
let is_even int = int mod 2 = 0

(* 目的 : int list を受け取ってその中の偶数の要素のみを含むリストを返す *)
(* filter_even : int list -> int list *)
let filter_even list = List.filter is_even list

(* test *)
let test1 = filter_even [] = []
let test2 = filter_even [1] = []
let test3 = filter_even [2] = [2]
let test4 = filter_even [1;2;3;4;5;6] = [2;4;6]