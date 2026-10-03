(* 第8章: レコード型の定義と使用例 *)

(* 学生を表すレコード型の定義 *)
type gakusei_t = {
  namae : string;    (* 名前 *)
  tensuu : int;      (* 点数 *)
  seiseki : string;  (* 成績 *)
}

(* 学生データのサンプル *)
let gakusei1 = {namae="田中"; tensuu=85; seiseki="B"}
let gakusei2 = {namae="佐藤"; tensuu=92; seiseki="A"}
let gakusei3 = {namae="鈴木"; tensuu=78; seiseki="C"}

(* 目的: 学生の情報を文字列で表示する *)
(* gakusei_hyouji : gakusei_t -> string *)
let gakusei_hyouji gakusei =
  gakusei.namae ^ "さんは" ^ (string_of_int gakusei.tensuu) ^ "点で成績は" ^ gakusei.seiseki ^ "です"

(* テスト *)
let test1 = gakusei_hyouji gakusei1 = "田中さんは85点で成績はBです"
let test2 = gakusei_hyouji gakusei2 = "佐藤さんは92点で成績はAです"

(* 目的: 点数から成績を決定する *)
(* tensuu_to_seiseki : int -> string *)
let tensuu_to_seiseki tensuu =
  if tensuu >= 90 then "A"
  else if tensuu >= 80 then "B"
  else if tensuu >= 70 then "C"
  else if tensuu >= 60 then "D"
  else "F"

(* テスト *)
let test3 = tensuu_to_seiseki 95 = "A"
let test4 = tensuu_to_seiseki 83 = "B"
let test5 = tensuu_to_seiseki 65 = "D"

(* 目的: 名前と点数から学生レコードを作成する *)
(* make_gakusei : string -> int -> gakusei_t *)
let make_gakusei namae tensuu = {
  namae = namae;
  tensuu = tensuu;
  seiseki = tensuu_to_seiseki tensuu;
}

(* テスト *)
let test6 = make_gakusei "高橋" 88 = {namae="高橋"; tensuu=88; seiseki="B"}
let test7 = make_gakusei "山田" 95 = {namae="山田"; tensuu=95; seiseki="A"}

(* サンプル学生の作成 *)
let yoshihara = make_gakusei "yoshihara" 100
