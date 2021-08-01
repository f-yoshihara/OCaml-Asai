(* 各人の名前、身長(m)、体重(kg)、誕生月、誕生日、血液型を表す型 *)
type person_t = {
  namae : string;
  sincho : float;
  taiju : float;
  tuki : int;
  hi : int;
  ketsueki : string;
}

let user1 = {namae = "fumiro"; sincho = 1.8; taiju = 67.; tuki = 4; hi = 19; ketsueki = "o";}
let user2 = {namae = "taro"; sincho = 1.8; taiju = 67.; tuki = 4; hi = 19; ketsueki = "a";}
let user3 = {namae = "jiro"; sincho = 1.8; taiju = 67.; tuki = 4; hi = 19; ketsueki = "b";}
let user4 = {namae = "saburo"; sincho = 1.8; taiju = 67.; tuki = 4; hi = 19; ketsueki = "ab";}

(* 目的 : person_t型のデータを受け取って名前と血液型を表示する *)
(* ketsueki_hyouji : person_t -> string *)
let ketsueki_hyouji user = match user with 
  {namae = n; sincho = s; taiju = t; tuki = ts; hi = h; ketsueki = k;} ->
    n ^ "さんの血液型は"^k^"型です"


let test1 = ketsueki_hyouji user1 = "fumiroさんの血液型はo型です"
let test2 = ketsueki_hyouji user2 = "taroさんの血液型はa型です"
let test3 = ketsueki_hyouji user3 = "jiroさんの血液型はb型です"
let test4 = ketsueki_hyouji user4 = "saburoさんの血液型はab型です"