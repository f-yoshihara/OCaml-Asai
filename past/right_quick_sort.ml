(* 目的 : 受け取ったリストをクイックソートで昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort list = 
  (* 目的 : list から n よりも p である値のみを取り出す *)
  (* take : int -> int list -> (int -> int -> bool) -> int list *)
  let take n list p = List.filter (fun x -> p n x) list
  (* 目的 : 整数とリストを受け取って整数より小さな要素のみのリストを返す *)
  (* take_less : int -> int list -> int list *)
  in let take_less n list = take n list (>=)
  (* 目的 : 整数とリストを受け取って整数より大きな要素のみのリストを返す *)
  (* take_greater : int -> int list -> int list *)
  in let take_greater n list = take n list (<)
  in match list with
    [] -> [] (* 自明に答えがでるケース *)
  | first :: rest -> (* それ以外のケース *)
  quick_sort (take_less first rest) 
  @ [first]
  @ quick_sort (take_greater first rest)

(* test *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
let test6 = quick_sort [5; 5; 9; 8; 2; 3] = [2; 3; 5; 5; 8; 9]