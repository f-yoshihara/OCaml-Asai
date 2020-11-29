(* string list は
 - [] 空のリストあるいは
 - first :: rest (first がstring, restがstring list)の形を持つ *)

 (* 目的 : string list を受け取ってそれらを繋げた一つの文字列を返す *)
 (* concat : string list -> string *)
 (* let rec concat list = match list with
  [] -> ""
| first :: rest -> first ^ concat rest (* concat rest *)

 (* test *)
 let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
 let test2 = concat [] = "" *)
 
(* 目的 : first と rest_result を繋げた文字列を返す *)
(* implode : string -> string *)
(* let implode first rest_result = first ^ rest_result *)

(* 目的 : string list を受け取ってそれらを繋げた一つの文字列を返す *)
(* concat : string list -> string *)
(* let concat list = List.fold_right implode list "" *)

(* let concat list = 
  let implode first rest_result = first ^ rest_result in
  List.fold_right implode list "" *)

let concat list = List.fold_right (^) list ""

(* test *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test2 = concat [] = ""