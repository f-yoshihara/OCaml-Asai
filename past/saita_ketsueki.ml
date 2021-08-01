#use "ketsueki_shukei.ml" 

(* 目的 : person_t型のlistを受け取って最多数の血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki list = match list with
    [] -> ""
  | list -> let (a, b, ab, o) = ketsueki_shukei list in
    if a > b && a > ab && a > o then "A"
    else if b > a && b > ab && b > o then "B"
    else if ab > a && ab > b && ab > o then "B"
    else "O"

(* test *)
let test1 = saita_ketsueki list1 = ""
let test2 = saita_ketsueki list2 = "O"
let test3 = saita_ketsueki list3 = "O"
let test4 = saita_ketsueki list4 = "O"
let test5 = saita_ketsueki list3 = "O"