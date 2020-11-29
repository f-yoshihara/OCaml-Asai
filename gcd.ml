(* 目的 : ユークリテッドの互除法二つの自然数mとnの最大公約数を求める *)
(* gcd : int -> int -> int *)
let rec gcd m n =
  if n = 0
  then m
  else gcd n (m mod n)

(* test *)
let test1 = gcd 1 0 = 1
let test2 = gcd 6 4 = 2
let test3 = gcd 12 4 = 4
let test4 = gcd 2 1 = 1
let test5 = gcd 221 153 = 17
let test6 = gcd 5 2 = 1;

(* (m mod n)は再帰のたびに小さくなっていくのでいずれ０になり停止する *)