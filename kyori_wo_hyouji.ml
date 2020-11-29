#use "global_ekimei_list.ml" ;;
#use "global_ekikan_list.ml" ;;
#use "get_ekikan_kyori.ml" ;;
#use "romaji_to_kanji.ml" ;;

(* 目的 : ２つの駅の間の距離を文字列で表現する *)
let kyori_wo_hyouji eki1 eki2 ekimei_list ekikan_list = 
    let kanji_eki1 = romaji_to_kanji eki1 global_ekimei_list in
    if kanji_eki1 = "" then eki1 ^ "という駅は存在しません"
    else let kanji_eki2 = romaji_to_kanji eki2 global_ekimei_list in
        if kanji_eki2 = "" then eki2 ^ "という駅は存在しません"
        else let kyori = get_ekikan_kyori kanji_eki1 kanji_eki2 global_ekikan_list in
            if kyori = infinity then kanji_eki1 ^ "と" ^ kanji_eki2 ^ "はつながっていません"
            else kanji_eki1 ^ "から" ^ kanji_eki2 ^ "までは" ^ string_of_float kyori ^ "kmです"

(* test *)
let test1 = kyori_wo_hyouji "waseda" "takadanobaba" global_ekimei_list global_ekikan_list = "早稲田から高田馬場までは1.7kmです"
let test2 = kyori_wo_hyouji "takadanobaba" "waseda" global_ekimei_list global_ekikan_list = "高田馬場から早稲田までは1.7kmです"
let test3 = kyori_wo_hyouji "kagurazaka" "waseda" global_ekimei_list global_ekikan_list = "神楽坂から早稲田までは1.2kmです"
let test4 = kyori_wo_hyouji "takadanobaba" "kagurazaka" global_ekimei_list global_ekikan_list = "高田馬場と神楽坂はつながっていません"
let test5 = kyori_wo_hyouji "takadanobababa" "waseda" global_ekimei_list global_ekikan_list = "takadanobababaという駅は存在しません"