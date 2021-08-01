(* 目的 : 整数を受け取って3で割って1余るかどうかを判定しbool型を返す *)
(* mod3_1 : int -> bool *)
let is_mod3_1 int = int mod 3 = 1

(* test *)
let test1 = is_mod3_1 0 = false
let test2 = is_mod3_1 1 = true
let test3 = is_mod3_1 2 = false
let test4 = is_mod3_1 3 = false
let test5 = is_mod3_1 4 = true

let list1 = []
let list2 = [1]
let list3 = [1; 2; 3]
let list4 = [1; 2; 3; 4]

(* 目的 : 整数のリストを受け取ってその中から3で割って1余る数のみ取り出す *)
(* filter_mod3_1 : int list -> int list *)
let rec filter_mod3_1 list = match list with
    [] -> []
  | first :: rest -> (* filter_mod3_1 rest *)
    let rest_result = filter_mod3_1 rest in
    if is_mod3_1 first then first :: rest_result
                       else rest_result

let rec filter_positive list = match list with
    [] -> []
  | first :: rest -> (* filter_positive rest *)
      let rest_result = filter_positive rest in
      if first > 0 then first :: rest_result
                   else rest_result

(* test *)
let test6 = filter_mod3_1 list1 = []
let test7 = filter_mod3_1 list2 = [1]
let test8 = filter_mod3_1 list3 = [1]
let test9 = filter_mod3_1 list4 = [1; 4]

(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter p list = match list with
    [] -> []
  | first :: rest -> (* filter p rest *)
    let filter_p_rest = filter p rest in
    if p first then first :: filter_p_rest
               else filter_p_rest

(* test *)
let test10 = filter is_mod3_1 list1 = []
let test11 = filter is_mod3_1 list2 = [1]
let test12 = filter is_mod3_1 list3 = [1]
let test13 = filter is_mod3_1 list4 = [1; 4]