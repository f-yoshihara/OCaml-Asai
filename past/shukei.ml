#use "gakusei_t.ml" 

(* 目的 : 学生のlistを受け取って成績ごとにそれぞれの人数を集計して4つの組にして返す *)
(* shukei : gekusei_t list -> int * int * int * int *)
(* let rec shukei list = match list with
    [] -> (0, 0, 0, 0)
  | {namae=n; tensuu=t; seiseki=s} :: rest -> 
      let shukei_rest = shukei rest in
      match shukei_rest with 
          (a, b, c, d) -> if s = "A" then (a + 1, b, c, d)
                     else if s = "B" then (a, b + 1, c, d)
                     else if s = "C" then (a, b, c + 1, d)
                                     else (a, b, c, d + 1) *)

let rec shukei list = match list with
    [] -> (0, 0, 0, 0)
  | {namae=n; tensuu=t; seiseki=s} :: rest -> 
      let (a, b, c, d) = shukei rest in
          if s = "A" then (a + 1, b, c, d)
          else if s = "B" then (a, b + 1, c, d)
          else if s = "C" then (a, b, c + 1, d)
                          else (a, b, c, d + 1)

(* test *)
let test1 = shukei list1 = (0, 0, 0, 0)
let test2 = shukei list2 = (1, 0, 0, 0)
let test3 = shukei list3 = (0, 2, 0, 0)
let test4 = shukei list4 = (0, 2, 0, 0)
let test5 = shukei list5 = (2, 2, 2, 0)
let test1 = shukei list1 = (2, 1, 2, 1)