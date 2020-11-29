(* 目的 : list から n よりも p である値のみを取り出す *)
(* take : int -> int list -> (int -> int -> bool) -> int list *)
let take n list p = List.filter (fun x -> p n x) list

let take_less n list = take n list (>)
let take_greater n list = take n list (<)

(* 目的 : 整数とリストを受け取って整数より小さな要素のみのリストを返す *)
(* take_less : int -> int list -> int list *)
(* let take_less n list = List.filter ( fun x -> n > x ) list *)

let test6 = take_less 2 [] = []
let test7 = take_less 3 [1; 2; 3; 4] = [1; 2]
let test8 = take_less 3 [4; 2; 3; 1] = [2; 1]

(* 目的 : 整数とリストを受け取って整数より大きな要素のみのリストを返す *)
(* take_greater : int -> int list -> int list *)
(* let rec take_greater n list = match list with
    [] -> []
  | first :: rest ->
  if first > n then first :: take_greater n rest
  else take_greater n rest *)

let test9 = take_greater 2 [] = []
let test10 = take_greater 3 [1; 2; 3; 4] = [4]
let test11 = take_greater 2 [4; 2; 3; 1] = [4; 3]

(* 目的 : 受け取ったリストをクイックソートで昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort list = match list with
    [] -> [] (* 自明に答えがでるケース *)
  | first :: rest -> (* それ以外のケース *)
  quick_sort (take first rest (>)) 
  @ [first]
  @ quick_sort (take first rest (<))

(* test *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
