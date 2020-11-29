#use "person_t.ml"

let list1 = []
let list2 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"}]
let list3 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"}]
let list4 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"};
             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "A"}]
let list5 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "A"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "A"};
             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "A"}]

(* 目的 : person_t list と対象の血液型 を受け取って血液型がA型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki list b = match list with 
  [] -> 0
| {namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;} :: rest -> 
if k = b then 1 + count_ketsueki rest b
           else count_ketsueki rest b

(* test *)
let test1 = count_ketsueki list1 "A" = 0
let test2 = count_ketsueki list2 "B" = 0
let test3 = count_ketsueki list3 "AB" = 0
let test4 = count_ketsueki list4 "O" = 2
let test5 = count_ketsueki list5 "A" = 3