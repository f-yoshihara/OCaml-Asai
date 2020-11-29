#use "eki_t.ml" 
(* 目的 : saitan_wo_bunri を fold_right を使って定義する *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
let saitan_wo_bunri list = List.fold_right (
    fun first (min, rest) ->
    match (min, first) with
    ({namae= mn; saitan_kyori = msk; temae_list = mtl}, {namae= n; saitan_kyori = sk; temae_list = tl}) ->
    if msk = infinity then (first, rest)
    else if sk < msk
    then (first, min :: rest)
    else (min, first :: rest)
    ) list ({namae= ""; saitan_kyori = infinity; temae_list = []}, [])

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* テスト *) 
(* let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4])  *)
let test = saitan_wo_bunri lst