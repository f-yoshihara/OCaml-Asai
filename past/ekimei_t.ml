(* 各駅の駅名、ひらがな、ローマ字表記、路線名を表す型 *)
type ekimei_t = {
  kanji : string;
  kana : string;
  romaji : string;
  shozoku : string;
}