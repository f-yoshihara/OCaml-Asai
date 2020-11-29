(* 目的 : ２つのlistを引数にとってそれらを結合したリストを返す *)
(* append : 'a list -> 'b list -> 'c list  *)
(* let rec append list1 list2 = match list1 with
    [] -> list2
  | first :: rest -> first :: append rest list2 *)

let append list1 list2 = 
  List.fold_right (fun first rest_result -> first :: rest_result) list1 list2

(* test *)
let test1 = append [] [] = []
let test2 = append [] [1; 2] = [1; 2]
let test3 = append [1; 2] [] = [1; 2]
let test4 = append [1; 2] [3; 4] = [1; 2; 3; 4]
let test5 = append ["a"; "b"; "c"; "d"; "e"] ["f"; "g"] = ["a"; "b"; "c"; "d"; "e"; "f"; "g"]
