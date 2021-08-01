(* int list は
    - []  空のリストあるいは
    - first :: rest 最初の要素がfirstあるいは残りのリストがrest(first が int, restが自己参照型のケース)という形 *)

(* 目的 : int list を受け取ってそのlistの長さを返す *)
(* length : int list -> int *)
(* let rec length list = match list with
  [] -> 0
| first :: rest -> 1 + length rest *)

let length list =
  List.fold_right (fun first rest_result -> 1 + rest_result) list 0

(* test *)
let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1;2;3] = 3
let test4 = length [10000; 0; 10] = 3
let test5 = length [2;2;2;2;2;2;2;2;22;2] = 10