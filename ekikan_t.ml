(* ekikan_t : 駅と駅の接続情報を格納する型 *)
type ekikan_t = {
  kiten : string;
  shuten : string;
  keiyu : string;
  kyori : float; (* km *)
  jikan : int (* 分 *)
}