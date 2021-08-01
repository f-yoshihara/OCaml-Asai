(* 目的 : 自然数nと自然数のリストlistを受け取ってlistからnで割り切れない要素のみを取りだす *)
(* take_undivisible : int -> int list -> int list *)
let take_undivisible n list = List.filter (fun x -> x mod n != 0) list
(* test *)
let test1 = take_undivisible 1 [1; 2] = []
let test2 = take_undivisible 2 [2; 3] = [3]
let test3 = take_undivisible 2 [1; 2; 3; 4; 5] = [1; 3; 5]

(* 目的 : 2以上n以下の自然数のリストを受け取ったら2以上n以下の素数のリストを返す *)
(* sieve : int list -> int list *)
let rec sieve list = match list with
    [] -> []
  | first :: rest -> first :: sieve (take_undivisible first rest)

(* 再帰呼び出しの対象は必ず要素数がへるため停止性が保証される *)

(* test *)
let test4 = sieve [] = []
let test5 = sieve [2; 3; 4; 5; 6; 7] = [2; 3; 5; 7]

(* 目的 : 自然数n以下の自然数を列挙する *)
(* enumerate_2 : int -> int list *)
let rec enumerate_2 n =
  if n < 2
  then []
  else enumerate_2 (n - 1) @ [n]

let test8 = enumerate_2 5 = [2; 3; 4; 5]

(* 目的 : エラトステネスの篩を使って自然数n以下の素数をすべて求める *)
(* prime : int -> int list *)
let prime n = sieve (enumerate_2 n)

(* test *)
let test6 = prime 5 = [2; 3; 5] 
let test7 = prime 7 = [2; 3; 5; 7]
let test9 = prime 15 = [2; 3; 5; 7; 11; 13]

let prime n =
  let take_undivisible n list = List.filter (fun x -> x mod n != 0) list
  in let rec sieve list = match list with
    [] -> []
  | first :: rest -> first :: sieve (take_undivisible first rest)
  in let rec enumerate_2 n =
  if n < 2
  then []
  else enumerate_2 (n - 1) @ [n]
  in sieve (enumerate_2 n)
