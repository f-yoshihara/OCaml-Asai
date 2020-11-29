#use "gakusei_t.ml" 

(* 目的 : first と rest_result の和を返す *)
let add_tensuu first rest_result = match first with
  {namae=n; tensuu=t; seiseki=s} -> t + rest_result

(* 目的 : 学生のリストを受け取って得点の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum list = List.fold_right add_tensuu list 0

(* test *)
let test1 = gakusei_sum list1 = 0
let test2 = gakusei_sum list2 = 80
let test3 = gakusei_sum list3 = 145
let test4 = gakusei_sum list4 = 145
let test5 = gakusei_sum list5 = 440
let test6 = gakusei_sum list6 = 420