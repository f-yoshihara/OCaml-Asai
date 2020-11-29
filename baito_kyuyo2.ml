(* 目的 : 時給850円からスタートして一年経過するごとに時給が100円づつ上がるアルバイトの給与を計算する。年数と働いた時間が与えられる *)
let jikyu = 850
(* baito_kyuyo : int -> int -> int *)
let baito_kyuyo y h = (jikyu + 100 * y) * h

(* test *)
let test1 = baito_kyuyo 1 1 = 950
let test2 = baito_kyuyo 2 1 = 1050
let test3 = baito_kyuyo 3 10 = 11500