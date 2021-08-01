(* #use "koushin1.ml"  *)
#use "eki_t.ml" 
#use "get_ekikan_kyori.ml"

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 

let list = [eki1; eki2; eki3; eki4] 

(* 目的: 直前に確定した駅と未確定の駅のリストを受け取って必要な更新処理を行なった後の未確定の駅のリストを返す *)
(* koushin: eki_t -> eki_t list -> eki_t list *)
(* let koushin eki list = 
    let f = koushin1 eki in 
    List.map f list *)

let koushin eki list = 
  let f q = koushin1 eki q in 
  List.map f list

(* let koushin eki list =
  let f eki t = match eki with
  {namae = n; saitan_kyori = sk; temae_list = tl} -> match t with
  {namae = tn; saitan_kyori = tsk; temae_list = ttl} ->
  let kyori = get_ekikan_kyori n tn global_ekikan_list in
  if(kyori = infinity) then t
                       else if(sk +. kyori > tsk) then t
                       else {namae = n; saitan_kyori = sk +. kyori; temae_list = n::ttl} in
  List.map f list *)

(* let koushin eki list = match eki with
  {namae = en; saitan_kyori = es; temae_list = et} -> 
    (* 目的 : 未確定の駅を必要に応じて更新した駅を返す *)
    (* koushin1 : eki_t -> eki_t -> eki_t *)
    let koushin1 q = match eki with
      {namae = qn; saitan_kyori = qs; temae_list = qt} ->
  let kyori = get_ekikan_kyori p
  let koushin1 eki_p eki_q = match eki_p with
    {namae = np; saitan_kyori = skp; temae_list = tlp} -> match eki_q with
    {namae = nq; saitan_kyori = skq; temae_list = tlq} ->
    let kyori = get_ekikan_kyori np nq global_ekikan_list in
    if(kyori = infinity)
    then eki_q
    else if (skp +. kyori > skq)
    then eki_q
    else {namae = nq; saitan_kyori = skp +. kyori; temae_list = nq::tlp} in
  List.map koushin1 list *)


let koushin p v = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    (* 目的：未確定の駅 q を必要に応じて更新した駅を返す *) 
    (* koushin1 : eki_t -> eki_t -> eki_t *) 
    let koushin1 q = match q with 
      {namae = qn; saitan_kyori = qs; temae_list = qt} -> 
	let kyori = get_ekikan_kyori pn qn global_ekikan_list in 
	if kyori = infinity 
	then q 
	else if ps +. kyori < qs 
	then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt} 
	else q in 
    List.map koushin1 v 

let koushin p v = match p with 
  {namae = pn; saitan_kyori = ps; temae_list = pt} -> 
    (* 目的：未確定の駅 q を必要に応じて更新した駅を返す *) 
    (* koushin1 : eki_t -> eki_t -> eki_t *) 
    List.map (
      fun q -> match q with
      {namae = qn; saitan_kyori = qs; temae_list = qt} ->
      let kyori = get_ekikan_kyori pn qn global_ekikan_list in
      if kyori = infinity
      then q
      else if ps +. kyori < qs
      then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt} 
	    else q 
      ) v

(* test *)
let test1 = koushin eki2 [] = [] 
let test2 = koushin eki2 list = 
 [{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}; 
  eki2; eki3; eki4] 