(* 目的 : 昇順に並んでいるlistの正しい位置にintを挿入する *)
(* insert : int list -> int -> int list *)
let rec insert list n = match list with
    [] -> [n]
  | first :: rest -> 
      if first < n then first :: insert rest n
      else n :: first :: rest

(* test *)
let test1 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]
let test2 = insert [] 5 = [5]
let test3 = insert [3; 4; 7; 8]  2 = [2; 3; 4; 7; 8]

(* 目的 : 整数のlistを受け取って昇順に並び替える *)
(* ins_sort : int list -> int list *)
let rec ins_sort list = match list with
    [] -> []
  | first :: rest -> insert (ins_sort rest) first (* ins_sort rest *)

(* test *)
let test4 = ins_sort [5; 3; 8; 1; 7; 4] = [1; 3; 4; 5; 7; 8] (* [1; 3; 4; 7; 8] *)
let test5 = ins_sort [] = []
let test6 = ins_sort [10; 3;] = [3; 10]
let test7 = ins_sort [1; 3; 4; 5; 7; 8] = [1; 3; 4; 5; 7; 8]
let test8 = ins_sort [3] = [3]

(* 目的 : first が rest の first よりも小さければ first :: rest (list)を返す *)
