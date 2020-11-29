(* 目的 : 受け取った list の中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum list = match list with
    [] -> max_int
  | first :: rest ->
      let min = minimum rest in
      if first <= min
      then first
      else min

(* test *)
let test1 = minimum [3] = 3
let test2 = minimum [1; 2] = 1
let test3 = minimum [3; 2] = 2
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1