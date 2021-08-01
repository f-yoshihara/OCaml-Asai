#use "global_ekimei_list.ml" ;;

let eki1 = {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}
let eki2 = {kanji="住吉"; kana="すみよし"; romaji="sumiyoshi"; shozoku="半蔵門線"}

let list1 = [ 
{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
]
let list2 = [ 
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
{kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
{kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
]
let list3 = [ 
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"}; 
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}; 
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
]
let list4 = []

let list5 = [
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
]

(* 目的 : ekimei_tがekimei_tのリストの駅と重複するかどうかをチェックしてboolで返す *)
(* is_duplicated : ekimei_t -> ekimei_t list -> bool *)
(* let rec is_duplicated ekimei_t list = match list with
    [] -> false
  | ({kanji=kj; kana=kn; romaji=rm; shozoku=sz} as first) :: rest -> 
    if is_duplicated ekimei_t rest then true
    else if first = ekimei_t then true
    else false *)

(* test *)
(* let test1 = is_duplicated eki1 list1 = true
let test2 = is_duplicated eki2 list2 = false
let test3 = is_duplicated eki1 list4 = false *)

(* 目的 : ひらがなの順に並んでいるekimei_listのリストの正しい位置にekimei_listを挿入する(駅名が重複していない場合のみ) *)
(* eki_insert : ekimei_t list -> ekimei_t list *)
let rec eki_insert ekimei_t list = match list with
    [] -> [ekimei_t]
  | ({kanji=fkj; kana=fkn; romaji=frm; shozoku=fsz} as first) :: rest -> 
  match ekimei_t with {kanji=kj; kana=kn; romaji=rm; shozoku=sz} ->
    if fkn < kn then first :: eki_insert ekimei_t rest
    else if fkn = kn then list
    else ekimei_t :: list

(* test *)
let test4 = eki_insert eki1 list5 = list5
let test5 = eki_insert eki2 list5 = eki2 :: list5

(* 目的 : ekimei_t型のリストを受け取ってそれをひらがなの順に整列しさらに駅の重複を取り除く *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu list = match list with
    [] -> []
  | first :: rest -> eki_insert first (seiretsu rest)


let test6 = seiretsu list1 = [
  {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
  {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
]
let test7 = seiretsu list2 = [
  {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
  {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
]
let test8 = seiretsu list3 = [
  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
  {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}; 
]
let test9 = seiretsu list4 = []
