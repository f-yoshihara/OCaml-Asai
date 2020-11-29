(* int listは
- [] 空のリストあるいは
- first :: rest first が int, rest が int list （ここが再帰的な構造を持つ。最初のそれ自体の定義に戻る）形になる *)

(* 目的 : int list を受け取ってその中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even list = match list with
  [] -> []
| first :: rest -> if first mod 2 = 0 then first :: even rest
                                      else even rest

(* test *)
let test1 = even [] = []
let test2 = even [1] = []
let test3 = even [2] = [2]
let test4 = even [1;2;3;4;5;6] = [2;6;4]