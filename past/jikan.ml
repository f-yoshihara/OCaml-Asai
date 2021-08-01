(* 24時間表記の時刻を受け取ったら午前か午後かを計算する *)
(* jikan : int -> string *)
let jikan x =
  if x < 12 then "gozen"
            else "gogo"

(* test *)
let test1 = jikan 9 = "gozen"
let test2 = jikan 12 = "gogo"
let test3 = jikan 13 = "gogo"