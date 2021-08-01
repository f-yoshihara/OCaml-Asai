#use "gakusei_t.ml" 

(* 目的 : 学生のリストを受け取ってその中から最高得点をとった人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max list = match list with
    [] -> {namae=""; tensuu=min_int; seiseki=""}
  | ({namae=fn; tensuu=ft; seiseki=fs} as first) :: rest -> (* gaskusei_max rest *)
    let max = gakusei_max rest in 
    match max with
        {namae=mn; tensuu=mt; seiseki=ms} ->
    if ft > mt then first
    else max 

(* test *)
let test1 = gakusei_max list1 = {namae=""; tensuu=min_int; seiseki=""}
let test2 = gakusei_max list2 = gakusei2
let test3 = gakusei_max list3 = gakusei3
let test4 = gakusei_max list4 = gakusei3
let test5 = gakusei_max list5 = gakusei1