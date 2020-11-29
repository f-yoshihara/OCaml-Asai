#use "person_t.ml" 

(* 目的 : person_t型のlistを受け取って各血液型の人数を組にして返す *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei list = match list with
    [] -> (0, 0, 0, 0)
  | {namae = n; sincho = s; taiju = w; tuki = m; hi = d; ketsueki = k} :: rest -> 
      let (a, b, ab, o) = ketsueki_shukei rest in
          if k = "A"       then (a + 1, b, ab, o)
          else if k = "B"  then (a, b + 1, ab, o)
          else if k = "AB" then (a, b, ab + 1, o)
                           else (a, b, ab, o + 1)

(* test *)
let test1 = ketsueki_shukei list1 = (0, 0, 0, 0)
let test2 = ketsueki_shukei list2 = (0, 0, 0, 1)
let test3 = ketsueki_shukei list3 = (0, 0, 0, 2)
let test4 = ketsueki_shukei list4 = (0, 0, 1, 2)
let test5 = ketsueki_shukei list5 = (1, 1, 1, 2)