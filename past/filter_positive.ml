let list1 = []
let list2 = [1; 2; 3]
let list3 = [-1; 0; 1]
let list4 = [-2; -1; 0]
let list5 = [-2; -1; 0; 1; 2]

(* 目的: 受け取ったlistから正の整数のみを取り出す *)
(* filter_positive: int list -> int list *)
let rec filter_positive list = match list with
    [] -> []
  | first :: rest -> (* filter_positive rest *)
      let filter_positive_rest = filter_positive rest in
      if first > 0 then first :: filter_positive_rest
                   else filter_positive_rest

(* test *)
let test1 = filter_positive list1 = []
let test2 = filter_positive list2 = list2
let test3 = filter_positive list3 = [1]
let test4 = filter_positive list4 = []
let test5 = filter_positive list5 = [1; 2]