(* 各人の名前、身長(m)、体重(kg)、誕生月、誕生日、血液型を表す型 *)
type person_t = {
  namae : string;
  sincho : float;
  taiju : float;
  tuki : int;
  hi : int;
  ketsueki : string;
}

let taro   = {namae = "taro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"}
let jiro   = {namae = "jiro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "O"}
let saburo = {namae = "saburo"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "AB"}
let siro   = {namae = "siro"; sincho = 1.8; taiju = 60.; tuki = 4; hi = 19; ketsueki = "A"}
let sinji  = {namae = "sinji"; sincho = 1.3; taiju = 60.; tuki = 4; hi = 19; ketsueki = "B"}

let list1 = []
let list2 = [taro]
let list3 = [jiro; taro]
let list4 = [jiro; saburo; taro]
let list5 = [jiro; saburo; siro; taro; sinji]

let list6 = []
let list7 = [taro]
let list8 = [taro; jiro]
let list9 = [taro; jiro; saburo]
let list10 = [taro; jiro; saburo; siro]