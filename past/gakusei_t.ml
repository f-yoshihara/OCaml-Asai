(* 学生一人分のデータ()を表す型 *)
type gakusei_t = {
  namae : string; (* 名前 *)
  tensuu : int;   (* 点数 *)
  seiseki : string (* 成績 *)
}

(* 学生のデータの例 *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"} 
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"} 
let gakusei7 = {namae="tanaka"; tensuu=55; seiseki="D"}
 
(* 学生のリストの例 *) 
let list1 = [] 
let list2 = [gakusei2] 
let list3 = [gakusei3; gakusei4] 
let list4 = [gakusei4; gakusei3] 
let list5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3] 
let list6 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei7] 