(* 目的 : 受け取ったリストの各要素の和を求める *)
(* sum : int list -> int *)
let sum list = 
  (* 目的 : first と rest_result を加える *)
  (* add_int : int -> int -> int *)
  let add_int first rest_result = first + rest_result in 
  fold_right add_int list 0