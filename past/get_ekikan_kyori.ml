#use "global_ekikan_list.ml"

(* 目的 : 漢字の駅名をふたつと駅間リストを受け取ってふたつの駅の間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori ekimei1 ekimei2 list = match list with
    [] -> infinity
  | {kiten=ki; shuten=sh; keiyu=ke; kyori=ky; jikan=ji} :: rest -> (* get_ekikan_kyori rest *)
  if (ki = ekimei1 && sh = ekimei2) || (ki = ekimei2 && sh = ekimei1)
  then ky
  else get_ekikan_kyori ekimei1 ekimei2 rest

(* test *)
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test2 = get_ekikan_kyori "早稲田" "高田馬場" global_ekikan_list = 1.7
let test3 = get_ekikan_kyori "茗荷谷" "早稲田" global_ekikan_list = infinity
let test4 = get_ekikan_kyori "高田馬場" "神楽坂" global_ekikan_list = infinity
let test5 = get_ekikan_kyori "高田馬場" "早稲田" global_ekikan_list = 1.7
