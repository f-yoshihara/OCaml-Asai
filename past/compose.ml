(* 目的 : 関数をふたつ受け取ってそれらを合成した関数を返す *)
(* compose : ('a -> 'b) -> ('c -> 'a) -> ('c -> 'b) *)
let compose f f2 = 
  let g n = f (f2 n)
  in g
(* test *)
let time2 n = n * 2
let add3 n = n + 3
let test1 = (compose time2 add3) 4 = 14