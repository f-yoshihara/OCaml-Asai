#use "person_t.ml"

(* 目的 : 名前昇順のperson_t listと person_t型personを受け取ってpersonをlistの正しい位置に挿入する *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert list person = match list with
    [] -> [person]
  | ({namae = fn; sincho = fs; taiju = fw; tuki = fm; hi = fd; ketsueki = fk} as first) :: rest -> 
    match person with
  {namae = n; sincho = s; taiju = w; tuki = m; hi = d; ketsueki = k} ->
    if fn < n then first :: person_insert rest person
    else person :: list

(* test *)
let test1 = person_insert list1 sinji = [sinji]
let test2 = person_insert list2 sinji = [sinji; taro]
let test3 = person_insert list3 sinji = [jiro; sinji; taro]
let test4 = person_insert list4 sinji = [jiro; saburo; sinji; taro]
let test5 = person_insert list5 sinji = [jiro; saburo; sinji; siro; taro]

(* 目的 : person_t 型のリストを受け取ってそれを名前の昇順に整列したリストを返す *)
(* person_sort : person_t list -> person_t list *)
let rec person_sort list = match list with
    [] -> []
  | first :: rest -> 
    person_insert (person_sort rest) first

(* test *)
let test6 = person_sort list6 = []
let test7 = person_sort list7 = [taro]
let test8 = person_sort list8 = [jiro; taro]
let test9 = person_sort list9 = [jiro; saburo; taro]
let test10 = person_sort list10 = [jiro; saburo; siro; taro]