(* 学生一人分のデータ(名前, 点数, 成績)を表す型 *)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
}

(* gakusei_t 型のケースの例 *)
let gakusei1 = {namae = "fumiro"; tensuu = 90; seiseki = "A"}

(* gakusei_t list 型のケースの例 *)
let list1 = []
let list2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let list3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let list4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
             {namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let list5 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]

(* 目的 : tensuu での昇順に並んでいるgakusei_t listの正しい位置に gakusei_tを挿入する *)
(* gakusei_t_insert : gakusei_t list -> gakusei_t_ -> gakusei_t list *)
(* let rec gakusei_t_insert list ({namae = n; tensuu = t; seiseki = s} as gakusei) = match list with
    [] -> [gakusei]
  | ({namae = fn; tensuu = ft; seiseki = fs} as first) :: rest ->  
    if ft < t then first :: gakusei_t_insert rest gakusei
    else gakusei :: list *)

let rec gakusei_t_insert list gakusei = match list with
    [] -> [gakusei]
  | ({namae = fn; tensuu = ft; seiseki = fs} as first) :: rest ->
      match gakusei with {namae = n; tensuu = t; seiseki = s} ->
        if ft < t then first :: gakusei_t_insert rest gakusei
                  else gakusei :: list

let test1 = gakusei_t_insert list1 gakusei1 = [{namae = "fumiro"; tensuu = 90; seiseki = "A"}]
let test2 = gakusei_t_insert list2 gakusei1 = [{namae = "asai"; tensuu = 70; seiseki = "B"};{namae = "fumiro"; tensuu = 90; seiseki = "A"}]
let test3 = gakusei_t_insert list3 gakusei1 = [{namae = "asai"; tensuu = 70; seiseki = "B"};{namae = "kaneko"; tensuu = 85; seiseki = "A"};{namae = "fumiro"; tensuu = 90; seiseki = "A"}]


(* 目的 : gakusei_t list を受け取ってtensuuフィールドの順に整列したlistを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort list = match list with
    [] -> []
  | first :: rest -> gakusei_t_insert (gakusei_sort rest) first

(* test *)
let test1 = gakusei_sort list1 = []
let test2 = gakusei_sort list2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let test3 = gakusei_sort list3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
                               {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let test4 = gakusei_sort list4 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
                                  {namae = "yoshida"; tensuu = 80; seiseki = "A"};
                                  {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let test5 = gakusei_sort list5 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
                                  {namae = "kaneko"; tensuu = 85; seiseki = "A"}]