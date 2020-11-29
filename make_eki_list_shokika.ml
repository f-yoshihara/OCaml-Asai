#use "saitan_kyori.ml" 
#use "global_ekimei_list.ml" ;;
#use "global_ekikan_list.ml" ;;
#use "eki_t.ml" ;;

(* 駅リストの例 *) 
 
let eki_list = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
] 

(* 目的：ekimei list から eki list を作る *) 
(* shokika : eki_t list -> string -> eki_t list *)
let shokika eki_list kiten = 
    List.map (
      fun eki -> match eki with
          {namae = k; saitan_kyori = s; temae_list = t} ->
          if k = kiten
              then {namae = k; saitan_kyori = 0.; temae_list = [k]}
              else eki
      ) eki_list

(* ここで対象のリストの全ての要素に対して行なっていることは何か？ *)
(* 名前が起点と等しいかどうかを調べてそうであれば値を書き換えるそうでなければそのまま返す *)

let test1 = shokika [] "茗荷谷" = [] 
let test2 = shokika eki_list "茗荷谷" = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
] 

(* 目的 : 駅名のリストを受け取って頂点のリストを生成する *)
(* eki_t : ekimei_t list -> eki_t list *)
let make_eki_list list = List.map
    (
      fun eki -> match eki with
          {kanji=kj; kana=kn; romaji=rm; shozoku=sz} ->
          {namae=kj; saitan_kyori=infinity; temae_list=[]}
    ) list

let ekimei_list = [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
] 

(* test *)
let test2 = make_eki_list [] = []
let test3 = make_eki_list ekimei_list = [ 
{namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
{namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
{namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
] 
 
