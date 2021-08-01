#use "eki_t.ml" 

(* 目的 : eki_t list 型のリストを受け取って「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
(* let rec saitan_wo_bunri list = match list with
      [] -> ({namae= ""; saitan_kyori = infinity; temae_list = []}, [])
    | first :: rest -> 
    let (min, list) = saitan_wo_bunri rest in
    match min with
    {namae= mn; saitan_kyori = msk; temae_list = mtl} ->
    match first with
    {namae= n; saitan_kyori = sk; temae_list = tl} ->
    if sk < msk 
    then (first, min :: list)
    else (min, first :: list) *)

let rec saitan_wo_bunri list = match list with
      [] -> ({namae= ""; saitan_kyori = infinity; temae_list = []}, [])
    | ({namae= n; saitan_kyori = sk; temae_list = tl} as first) :: rest ->
    let (({namae= mn; saitan_kyori = msk; temae_list = mtl} as min), list) = saitan_wo_bunri rest in
    if msk = infinity then (first, rest)
    else if sk < msk 
    then (first, min :: list)
    else (min, first :: list)

(* 目的：受け取った駅のリストを、最短距離最小の駅とそれ以外に分離する *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let rec saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: rest -> 
      let (p, v) = saitan_wo_bunri rest in 
      match (first, p) with 
	({namae = fn; saitan_kyori = fs; temae_list = ft}, 
	 {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
	  if sn = "" then (first, v) 
	  else if fs < ss then (first, p :: v) 
	  else (p, first :: v) 
 
(* あるいは *) 
 
(* 目的：受け取った駅のリストを、最短距離最小の駅とそれ以外に分離する *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
let rec saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: [] -> (first, []) 
  | first :: rest -> 
      let (p, v) = saitan_wo_bunri rest in 
      match (first, p) with 
	({namae = fn; saitan_kyori = fs; temae_list = ft}, 
	 {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
	  if fs < ss then (first, p :: v) 
	  else (p, first :: v) 

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* テスト *) 
let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4]) 