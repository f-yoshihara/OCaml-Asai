#use "global_ekimei_list.ml" ;;
#use "global_ekikan_list.ml" ;;
#use "eki_t.ml" ;;

(* 目的 : 駅名のリストを受け取って頂点のリストを生成する *)
(* eki_t : ekimei_t list -> eki_t list *)
let rec make_eki_list list = match list with
    [] -> []
  | {kanji=kj; kana=kn; romaji=rm; shozoku=sz} :: rest ->
    {namae=kj; saitan_kyori=infinity; temae_list=[]} :: make_eki_list rest

(* test *)
let test1 = make_eki_list [] = []