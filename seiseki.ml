(* 目的 : 名前と成績の組を受け取って「〇〇さんの評価は△です」という文字列を計算する *)
(* seiseki : (string * string) -> string *)
let seiseki pair = match pair with
  (name, grade) -> name ^ "さんの評価は" ^ grade ^ "です"

(* test *)
let test1 = seiseki ("fumiro", "s") = "fumiroさんの評価はsです"
let test1 = seiseki ("naoko", "a") = "naokoさんの評価はaです"