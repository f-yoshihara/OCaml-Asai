#use "global_ekimei_list.ml"

(* 目的 : ローマ字の駅名と駅名リストを受け取ってその駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string -> ekimei_t list *)
let rec romaji_to_kanji romaji list = match list with
    [] -> ""
  | {kanji=kan; kana=kana; romaji=r; shozoku=sh} :: rest ->
  if romaji = r then kan
  else romaji_to_kanji romaji rest

(* test *)
let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test2 = romaji_to_kanji "yoyogiuehara" global_ekimei_list = "代々木上原"
let test3 = romaji_to_kanji "edogawabasi" global_ekimei_list = "江戸川橋"
let test4 = romaji_to_kanji "waseda" global_ekimei_list = "早稲田"