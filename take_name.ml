#use "person_t.ml" ;;

(* 目的 : person_t型のデータを受け取ってその名前フィールドを返す無名関数 *)
(* person_t -> string *)
fun person_t -> match person_t with 
    {namae = n; sincho = s; taiju = t; tuki = tu; hi = h; ketsueki = k} ->
    n;;