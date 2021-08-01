#use "length.ml"

(* 学生一人分のデータ(名前, 点数, 成績)を表す型 *)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
}

(* gakusei_t list 型のケースの例 *)
let list1 = []
let list2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let list3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let list4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
             {namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]

(* 目的 : 学生のデータを受け取ってその成績がAか否かを判断する *)
(* is_A : gakusei_t -> bool *)
let is_A a = match a with {namae = n; tensuu = t; seiseki = s} ->
s = "A"

(* 目的 : gakusei_tのリストを受け取って成績がAの人だけ取り出し、そのリストの長さを返す *)
 let count_A list = length (List.filter is_A list)

(* test *)
let test1 = count_A list1 = 0 
let test2 = count_A list2 = 0
let test3 = count_A list3 = 1
let test4 = count_A list4 = 2