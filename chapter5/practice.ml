(* 目的 : 時間を受け取って午前か午後かを判断する *)
(* jikan : int -> string *)
let jikan x =
    if x < 12 then "before"
              else "after"
(* test *)
let test1 = jikan 0  = "before"
let test2 = jikan 11 = "before"
let test2 = jikan 12 = "after"
let test1 = jikan 23 = "after"
