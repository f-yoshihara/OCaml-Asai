(* 学生一人分のデータ(名前, 点数, 成績)を表す型 *)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
}

(* gakusei_t list は
    - []            空のリストかあるいは
    - first :: rest first が gakusei_t 型 で rest が 自己参照型のケース *)

(* gakusei_t list 型のケースの例 *)
let list1 = []
let list2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let list3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let list4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
             {namae = "asai"; tensuu = 70; seiseki = "B"};
             {namae = "kaneko"; tensuu = 85; seiseki = "A"}]

(* 目的 : 学生リスト list のうち成績がAの人の数を返す *)
(* count_A : gakusei_t list -> int *)
(* let rec count_A list = match list with
  [] -> 0
| first :: rest -> (match first with 
                    {namae = n; tensuu = t; seiseki = s}
                    -> if s = "A" then 1 + count_A rest
                                  else count_A rest) *)

let rec count_A list = match list with
  [] -> 0
| ({namae = n; tensuu = t; seiseki = s} as first) :: rest 
    -> if s = "A" then 1 + count_A rest
                  else count_A rest

(* test *)
let test1 = count_A list1 = 0 
let test2 = count_A list2 = 0
let test3 = count_A list3 = 1
let test4 = count_A list4 = 2