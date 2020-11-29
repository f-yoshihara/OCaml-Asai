(* 各人の名前、身長(m)、体重(kg)、誕生月、誕生日、血液型を表す型 *)
type person_t = {
  namae : string;
  sincho : float;
  taiju : float;
  tuki : int;
  hi : int;
  ketsueki : string;
}

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

(* 目的 : person_t list を受け取って血液型がA型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A list = match list with 
  [] -> 0
| {namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;} :: rest -> 
if k = "A" then 1 + count_ketsueki_A rest
           else count_ketsueki_A rest

(* test *)
let test1 = count_ketsueki_A list1 = 0
let test2 = count_ketsueki_A list2 = 0
let test3 = count_ketsueki_A list3 = 0
let test4 = count_ketsueki_A list4 = 1
let test5 = count_ketsueki_A list5 = 3