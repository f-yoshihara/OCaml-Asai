(* 各駅の駅名、ひらがな、ローマ字表記、路線名を表す型 *)
type ekimei_t = {
  kanji : string;
  kana : string;
  romaji : string;
  shozoku : string;
}

let ekimei1 = {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸ノ内線"}

(* 目的 : ekimei_t型のデータを受け取って駅名を表す文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = match ekimei with 
  {kanji = kj; kana = kn; romaji = ro; shozoku = sh;} ->
    sh ^ ", " ^ kj ^ "(" ^ kn ^ ")"

let test1 = hyoji ekimei1 = "丸ノ内線, 茗荷谷(みょうがだに)"