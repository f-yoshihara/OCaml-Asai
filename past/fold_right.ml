(* 目的 : 受け取ったリストの各要素の和を求める *)
(* sum : int list -> int *)
let rec sum list = match list with 
    [] -> 0
  | first :: rest -> first + sum rest

(* 目的 : 受け取ったリストの長さを求める *)
(* length : 'a list -> int *)
let rec length list = match list with
    [] -> 0
  | first :: rest -> 1 + length rest

(* 目的 : list1 と list2 を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let rec append list1 list2 = match list1 with
    [] -> list2
  | first :: rest -> first :: append rest list2

(* 目的 : init から始めてリストの要素を右から順にfを施しこむ *)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right f list init = match list with
    [] -> init
  | first :: rest -> f first (fold_right f rest init) (* fold_right f rest init *)

(* 目的 : first と rest_result を加える *)
(* add_int : int -> int -> int *)
let add_int first rest_result = first + rest_result

(* 目的 : 受け取ったリストの各要素の和を求める *)
(* sum : int list -> int *)
let sum list = fold_right add_int list 0

(* 目的 : first を rest_result に加える *)
(* cons : 'a -> 'a list -> 'a list *)
let cons first rest_result = first :: rest_result

(* 目的 : list1 と list2 を受け取りそれらを結合したリストを返す *)
(* append : 'a list -> 'a list -> 'a list *)
let append list1 list2 = fold_right cons list1 list2