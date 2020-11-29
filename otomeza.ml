(* 各人の名前、身長(m)、体重(kg)、誕生月、誕生日、血液型を表す型 *)
type person_t = {
  namae : string;
  sincho : float;
  taiju : float;
  tuki : int;
  hi : int;
  ketsueki : string;
}
 (* 8月23日-9月22日 *)
let list1 = []
let list2 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 22; ketsueki = "O"}]
let list3 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 23; ketsueki = "O"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 24; ketsueki = "O"}]
let list4 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 1; ketsueki = "O"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 25; ketsueki = "O"};
             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 22; ketsueki = "A"}]
let list5 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 21; ketsueki = "A"};
             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 23; ketsueki = "A"};
             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 1; ketsueki = "A"}]

(* 目的 : person_t list を受け取って乙女座の人のリストを返す *)
(* otomeza : person_t list -> person_t list *)
(* let rec otomeza list = match list with 
  [] -> []
| first :: rest -> match first with
{namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;} ->
if (tu = 8 && (h >= 23)) || (tu = 9 && (h <= 22)) (* otomeza rest *)
then first :: otomeza rest
else otomeza rest *)

let rec otomeza list = match list with 
  [] -> []
| ({namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k;} as first) :: rest ->
if (tu = 8 && (h >= 23)) || (tu = 9 && (h <= 22)) 
then first :: otomeza rest
else otomeza rest

(* test *)
let test1 = otomeza list1 = []
let test2 = otomeza list2 = []
let test3 = otomeza list3 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 23; ketsueki = "O"};
                             {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 24; ketsueki = "O"}]
let test4 = otomeza list4 = [{namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 8; hi = 25; ketsueki = "O"};
                             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 22; ketsueki = "A"}] 
let test5 = otomeza list5 = [{namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 21; ketsueki = "A"};
                             {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 9; hi = 1; ketsueki = "A"}]  
