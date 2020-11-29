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

(* 目的 : person_t を受け取って名前を返す *)
(* take_name : person_t -> string *)
let take_name person_t = match person_t with
  {namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;}->
  n

(* test *)
let test5 = take_name {namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"} = "taro"
let test6 = take_name {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"} = "jiro"

(* 目的 : 関数とリストを受け取ってリストの各要素に関数を引数とした結果をリストとして返す *)
(* map : ('a -> 'b) -> a' list -> 'b list *)
let rec map f list = match list with
    [] -> []
  | first :: rest -> f first :: map f rest

(* test *)
let test1 = map take_name list1 = []
let test2 = map take_name list2 = ["taro"]
let test3 = map take_name list3 = ["taro"; "jiro"]
let test4 = map take_name list4 = ["taro"; "jiro"; "saburo"]

let person_namae list = map take_name list

(* 目的 : person_t list を受け取ってその中に出てくる人の名前のリストを返す *)
(* person_namae : person_t list -> person_t list *)
(* let rec person_namae list = match list with 
  [] -> []
| {namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;} :: rest -> 
n :: person_namae rest *)

(* test *)
let test7 = person_namae list1 = []
let test8 = person_namae list2 = ["taro"]
let test9 = person_namae list3 = ["taro"; "jiro"]
let test10 = person_namae list4 = ["taro"; "jiro"; "saburo"]