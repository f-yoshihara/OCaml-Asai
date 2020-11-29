(* int list は
    - [] 空リストあるいは
    - first :: rest 最初の要素がfirstで残りのリストがrest
    という形 *)

let list1 = 1::2::3::4::[]
let list2 = 1::2::3::0::[]
let list3 = [1; 2;]
let list4 = []
let list5 = [0; 2;]

(* 目的 : 受け取ったリストに0が含まれているかどうかを判定してbooleanを返す *)
(* contain_zero : int list -> bool *)
let rec contain_zero list = match list with
  [] -> false
| first :: rest -> if first = 0 then true
                                else contain_zero rest

(* test *)
let test1 = contain_zero list1 = false
let test2 = contain_zero list2 = true
let test3 = contain_zero list3 = false
let test4 = contain_zero list4 = false
let test5 = contain_zero list5 = true