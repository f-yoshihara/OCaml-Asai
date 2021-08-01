(* 目的 : 昇順に並んでいるリスト list1 list2 をマージする *)
(* merge : int list -> int list -> int list *)
let rec merge list1 list2 = match (list1, list2) with
    ([], []) -> []
  | ([], first2 :: rest2) -> list2
  | (first1 :: rest1, []) -> list1
  | (first1 :: rest1, first2 :: rest2) -> (* merge rest1 rest2 *)
  if first1 < first2 
  then first1 :: merge rest1 list2
  else first2 :: merge list1 rest2       
                         
(* test *)
let test1 = merge [] [] = []
let test2 = merge [] [1; 2] = [1; 2]
let test3 = merge [1; 2] [] = [1; 2]
let test4 = merge [1; 3] [2; 4] = [1; 2; 3; 4]
let test5 = merge [2; 4] [1; 3] = [1; 2; 3; 4]
let test6 = merge [1; 4] [1; 3] = [1; 1; 3; 4]