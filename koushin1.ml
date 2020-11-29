#use "eki_t.ml" 
#use "get_ekikan_kyori.ml"

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 

(* 目的: 直前に確定した駅pと未確定の駅qを受け取ってpとqが直接つながっているかどうかを調べる。
つながっていた場合は最短距離と手前リストを必要に応じて更新したものを返す。
つながっていない場合はqをそのまま返す *)
(* koushin1: eki_t -> eki_t ->eki_t *)
let koushin1 eki_p eki_q = match eki_p with
    {namae = np; saitan_kyori = skp; temae_list = tlp} -> match eki_q with
    {namae = nq; saitan_kyori = skq; temae_list = tlq} ->
    let kyori = get_ekikan_kyori np nq global_ekikan_list in
    if(kyori = infinity)
    then eki_q
    else if (skp +. kyori > skq)
    then eki_q
    else {namae = nq; saitan_kyori = skp +. kyori; temae_list = nq::tlp}
    

(* test *)
let test1 = koushin1 eki3 eki1 = eki1 
let test2 = koushin1 eki3 eki2 = eki2 
let test3 = koushin1 eki3 eki3 = eki3 
let test4 = koushin1 eki3 eki4 = 
	{namae="後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]} 
let test5 = koushin1 eki2 eki1 = 
	{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]} 
let test6 = koushin1 eki2 eki2 = eki2 
let test7 = koushin1 eki2 eki3 = eki3 
let test8 = koushin1 eki2 eki4 = eki4 

(* 手前リストとはスタートからその駅に到達するまでに経由する駅全てのリストのこと *)