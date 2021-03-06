# 特に面白かった部分

## 型について

OCamlでは型を厳密に扱う。
四則演算にも型がある。正確に言えば扱うデータの型によって演算子に種類があるということ。
例えば実数を扱うには+.のように.をつけなければならない。
これはrubyのメソッドにも似ているかもしれない。

対して比較演算子にはそれらの区別がない。比較演算子の評価によって帰ってくるあたいはbooleanとなる。
OCamlではインタプリタによって計算を行うと型とその値をセットで返してくれる。

OCamlは変数の値を書き換えることができない。変数というよりはむしろ定数に近い。

これは型推論をサポートするための機能である。

関数が呼び出される時には二つのことが行われる。

- 関数呼び出しを呼び出された関数の中身で置き換える
- 置き換えられた関数のうち引数を実引数で置き換える

OCamlでは関数があたかも変数であるかのように振る舞う。
関数には”中身”がある。関数がコールされるとそれが中身に置き換わる。
だからこそ関数自体に型が必要になる。そしてそれを順次実行しながら式を評価してゆく。

## 関数定義に対するデザインレシピ

デザインレシピは機械的な前進によって開発に推進力を与えるという目的と気づきを得るという少なくとも２つの意味があると思う。
最初から全てを見通すことはできない。どんなに簡単そうに見えることであっても。なのでわからなくてもデザインレシピによって前進して、途中で得たものによってさらに加速していくことができる。
test(例)を書いて出入力を具体的に書いておくことによって関数の定義を劇的にわかりやすくすることができる。なるべく具体的に機械的に対処することが大切。再帰関数もデザインレシピを使ってあらかじめ得られる答えを予想することができる。
関数を定義する時の考え方が面白い。最初に欲しい答えを考えておく。そしてその答えを出してくれる関数があることにして、関数を組み立てていく。なければ作る。この考え方に従えば、できないはずのことができるようなる。
常に再帰呼び出しの結果とfirstの関係を表現すればいい。firstは具体的な値であるため関数を使う必要がない。
仕様が定まっていない場合でそれが人に依頼されて作っているものである場合は頼んだ人に聞く。そうでない場合は自分で考える。

デザインレシピを精密に作ることができれば一秒前は他人プログラミングが可能になる。どういうことかというとステップごとに考えるべきことが決まっていてまた独立して存在しているので連続的に前の処理の結果をみてその時にやることに集中できる。これの逆の方法は常に最終のゴールとこれまでの実装を意識して考えるべきことが増え続け、実装の複雑さは増すばかりということになる。

### 目的

作成する関数が何をするものなのかを考える。何を受け取り、何を返すのかを考え、関数の型を決定する。
これを元に関数の出だし、ヘッダを作成する。

### 例

関数の動きをより明確かつ具体的にするため作成する関数に望まれる入力と出力の例を作成する。
そしてそれを実行可能なテストプログラムにする。

### 本体

関数の本体を作成する。目的のところでは関数が「何を」するのかを考えたが、ここではそれを「どうやって」実現するのかを考える。

### テスト

望む動作をしているか作ったテストプログラムを使って確認する。
望む動作をしていなかったら原因をデザインレシピに沿って考え、誤りを正す。

### レコードとパターン変数

関数の本体は->の引数。そこまではmatch文によってパターンマッチを行う。対象の値を探してそれを取り出しwithの引数の型に当てはめて関数全体の引数の値を当てはまる形式でパターン変数に格納する。そうした上で関数本体の計算と評価を行う。
パターン変数とはパターンマッチによって見つけ出した変数を細かい要素に分解してそれぞれを格納した変数のこと。

### データ定義の必要なデザインレシピ

- データを定義する
- テスト用のデータを作る
- 目的を書く
- 入力値と出力値の型を書く
- 例（test）を書く（境界値を網羅する）
- 関数のプロトタイプを書く（返り値は単純な値）
- テストが失敗することを確認する
- テンプレートを初期化する
- 本体を書く
- テストが通ることを確認する

例とテストはコード的には同じもの。最後に例を使ってテストを行う。
出入力に関してデータが構造を持つようであればその型を定義する。
入力の一部が構造を持つ場合、その中身を取り出すためのmatch文を書く。
match文を書いた段階でmatch文自体の構造が正しいことを確認するためにtestを行う。

構造体としてのrecordで未定義のfieldがあるとエラーになる
またrecordのfieldとして宣言していないfieldを代入しようとすると未結合のfieldとしてエラーになる

OCamlではデータはval test1 : bool = falseの形で表される。
変数名:型＝実データの形式。
関数も同様に表現されてval hyoji : 'a -> string = <fun>の形になる。
関数名:入力値の型->出力値の型=<fun>の形。

### リスト

リストとは同じ型のデータが任意の個数並んだデータのこと。
リストはリスト型のデータであるだけでなく〇〇型のリスト型という形式で型を持つ。
[]のリストの場合は'a型のリスト型となる。
組は複数のデータが決められた個数分並ぶ構造を持つ。
ただし、型は共通していなくても良い。

リストでは型さえ共通していれば要素の個数は任意となる。
要素の数が限定されないという性質は柔軟で応用範囲が広いが、柔軟であるがゆえに扱いは組よりも複雑になる。
柔軟なデータを系統的に扱うためには構造を正確に把握する必要がある。

1. 空のリストは[]で表現できる。
2. first::restの場合firstは要素でrestがリストである。左辺右辺は対象ではない。::はcons(構成する)と呼ばれる。

リストを定義するためにはリストが必要になる。
初期化のためのリストとして空のリスト[]を利用することができる。

このように定義の方法としてその型のデータを使用する型のことを再帰的なデータ型と呼ぶ。
あるいは自己参照をするデータ型と呼ばれることもある。

再帰的にデータ型の由来は要素の数が可変であることと関係があるのかもしれない。
初期化に代入を必要とするのではなく、その型のデータに要素を追加することで定義できるタイプの型であるということだ。

初期化に代入が必要である場合は代入を行った時点でデータの構造が確定してしまうため、要素やデータを変更することができない。

リストに::で要素を追加する場合、要素はリストの先頭に追加される。なので直感的に要素を並べて構成した場合、左から右へと書いた順番と同じように代入されていく。
リストは構造的には常に要素1::要素2::要素3::[]の形を持っている（内部的に）。
ただし、OCamlでは慣習的に[要素1; 要素2; 要素3;]の記法も許容している。あくまでも内部的には::[]の形になっている。式の評価値として。

リストのパターンマッチはこれまでのものと異なる。
match [1;2;3;]with
  [] -> 0
  | first :: rest -> first;;
- : int = 1

上記のように|でパターンをいくつか提示する必要がある。少なくとも[]のケースとそうでないケースの2パターンがないとwarningが出る

### ここまでの疑問点

- リストでのパターンマッチの理屈。|で条件分岐していく理屈がわからない。
- 逆になんで組やrecordでそれが担保されているのか？->要素の数と型が決まっているから。
- 組の要素の数が変えられないってどういうこと？そもそも組は型じゃないんじゃないの？->組自体は型ではない->組は型である。ただし、内容が固定される。
- 要素の数も変えられるんじゃないの？->組自体は型ではなく、それによって定義されるものが型である。なので一度その型が宣言されたらその型の要素の数と要素ごとの型が決まる
- レコードではなく組と比較されるのはなぜ？->レコードも同様。説明を簡略化するための配慮だと思われる。

### プログラムの信頼性

強力に型付けされている言語ではほとんどのエラーが実行前に起こる。型チェックに通ればある程度の信頼性を担保されたことになる。
なので実行後のエラーはほとんど起こらないはず。逆に言えば、ほとんどのエラーは変数への再代入や処理中の型のエラーによるものであると考えられる。
ただし、型が正しくてもエラーが出る場合もある。それはパターンの記入漏れによるものが多い。これは言い換えれば、場合分けが十分に網羅されていないケースと言い換えることができる。
変数に何が入ってくるかは動的型付け言語であればさらに不確定な要素になりうる。

### 実務での応用案

デザインレシピを作ってみる。アクションなどの。
例えばバリデーションなんかがその要素のなると思うんだけど、バリデーションはいくつかのパターンがあるはずそれを覚えよう。
OCamlでは入力データの型が決まればプログラムの形も自然を定まる。これはPHPでのプログラミングでも応用できるかもしれない。

### 再帰関数

これは繰り返し処理のバリエーションでforやwhileの代わりにあるものである。再帰的に処理を行なっていく
再帰関数は let rec によって宣言する。
再帰関数では関数の本体で自分自身を呼びだす。こうした処理の対象となるのは再帰的な構造を持ったデータに限られる。
再帰的な構造をもつデータとは自己参照型のデータと言うこともできる。
再帰的データの構造と1対1に対応した再帰のことを構造に従った再帰と呼ぶ。
再帰が構造に従っている限り、無限ループなどの危険を回避することができる。
再帰関数では未来を予想する。
まだできていない関数を使って関数を作る。

### 局所変数

文

``` OCaml
let 変数名 = 式1 in 式2 ;;
```

例

``` OCaml
let x = 2 in x + x ;;
- : int = 4
```

式2内の変数名を式1に置き換えて実行してください、ただしこの置き換えは式2内でのみ有効です。という意味。
この置き換えが有効な範囲のことをスコープと呼ぶ。
そしてこのlet文の返り値は4ということになる。重要なのはxの定義についての情報は返らないということである。なのでスコープの外からは変数xの値は見えない。というよりも変数x自体が見えない。
またスコープの中からは外で定義された変数を参照することはできない。
複数の局所変数を使いたい場合にはlet文をネストさせる。

``` OCaml
let x = 2 in (let y = 3 in x + y) ;;
- : int = 5
```

#### そもそもなぜ変数を使いたいのか？

変数とはあるメモリにある値を格納してそれを参照することである。
もしも同じ関数の返り値を複数回参照したい場合、関数の呼び出しを複数回行うことでそれを解決することができるが、それでは無駄な処理が走ることになる。つまり関数の返り値は最初の一回を行う時点で求まっているのに、複数回呼び出すことによって同じ計算を無駄に行うことになるからだ。変数に格納しておけば、それをショートカットすることができる。計算量の節約になる。

#### 自然数の構造

自然数も再帰的な構造をしている！

1. 0は自然数である。
2. nが自然数であればn+1も自然数である。

自然数の再帰性を利用すれば再帰的な関数を作ることもできる。
自然数は0あるいは n + 1 一つ小さい自然数nに1を加えたもの（nが自己参照のケース）という形
再帰的な関数を作るということは繰り返しの中で0に収束していく値(n - 1)を扱うということである。
(n - 1)を再帰関数の引数にした時にそれが何を意味するのか、どうすれば目的となる値を出すことができるのか、nとの関係を考えることで関数を求めることができる。

#### 一般化と高階関数

一般化することによってプログラムの使い回しができるとともにより抽象度の高い思考をすることができるようになる。
一般化は同じようなプログラムの共通部分をくくりだすことから始まる。
関数型言語では関数を整数や実数と同じような値として扱うことができる。関数を引数として渡すこともできるし、関数を関数の結果として扱うこともできる。関数がfirst-classであるというように表現する。
mapのように関数自体を引数として受け取る関数のことを高階関数と呼ぶ。だからこそ関数にも型がある。

#### 多相型と多相関数

多相性とは型を限定せずに受け入れる性質のこと。この多相性をもつ関数を多相関数と呼ぶ。また任意の型を表現する'aのような表現のことを型変数と呼ぶ。型変数を含む型のことを多相型と呼ぶ。
高階関数であるmapも多相関数である。mapの型は下記のように表現される。

```ocaml
('a -> 'b) -> 'a list -> 'b list
```

('a -> 'b)が第一引数であるfの型に相当する。任意の型の'aを受け取って任意の型の'bを返すfを第一引数にとり、'a list を第二引数として'b listを返すという意味である。
関数を引数として受け取る高階関数は基本的に多相関数として機能する。

#### 値としての関数

##### 関数を返す関数

```ocaml
let twice f =
  let g x = f(f x)
  in g
```

上記の関数twiceはgという関数を返している。gがどういう関数かということは二行目に局所変数として定義されている。
局所変数はinで指定される式の中で有効なのでg自身の中で二行目が適応されるということになる。そしてそのgがそのまま返り値となる。これも再帰的な構造をしている。
twiceを呼び出すと必ずgが返ってきてそのgの定義としてtwiceの引数として渡した関数が二行目のfの部分にアサインされる。

#### 名前のない関数

OCamlでは名前をつけることなく関数を扱うことができる。
逆に名前をつけているときはその名前が変数のような働きをしているのと同じである。
ただし、let rec で定義される再帰関数の場合は名前をつけることが必須になる。

```OCaml
fun 引数 -> 式
```

上記のような形で関数を扱うことができる。
名前をつける場合であれば関数名を書く所に関数であることを意味するfunを書く。そして引数を渡して本体となる処理を->の右辺に記述する。

```OCaml
let add1 = fun x -> x + 1 ;;
let add1 x = x + 1 ;;
```

#### infix関数とprefix関数

関数を先に書いて続けて引数を書くような関数のことをprefix関数と呼ぶ。OCamlでは基本的にはprefix関数を使うが例外的にinfix関数を用いる場合もある。+などの演算子がそれである。関数を引数の間に置く場合である。infix関数はそれを()で囲むことによってprefix関数として扱うこともできる

```OCaml
(+) 3 5 ;; 
(* int = 8 *)
```

普通にinfix関数を呼ぶ場合は特にprefixにするメリットはないが例えば高階関数の引数として関数を渡す場合などはprefixにすることによってそれが可能になる。

```OCaml
let sum list = List.fold_right (+) list 0
```

#### 高階関数と思考の抽象化

高階関数を使うことによってリスト（配列）を一つのデータとして取り扱うことができるようになる。その要素一つ一つを取り扱うのではなくあくまで一つのデータとして扱うことによって一つずつのデータの扱いなど、本質的でない思考から距離を置くことができる。そしてリストを一つのデータとして取り扱う思考に慣れていくことでより本質的な思考が身につくようなる。高階関数を使うことによってコードがその重要な部分を際立たせる形になる。

### 第15章 新しい形の再帰

データ構造に従わないより一般的な再帰を考える

#### 再帰関数の構造

再帰関数では書くべき処理が三つある。一つは自明な答えがある処理。二つ目は再帰的なデータのより小さな塊に対する再帰関数の呼び出し。三つ目は二つ目の処理の結果と個別に扱う小さなデータとの関係の定義。
再帰的なデータ構造に対する再帰関数を作る上では最初の二つは自動的に決まるため頭を使わなければならない部分は三つ目のみ。

しかしより一般的な再帰を行う関数を作る場合にはこれら三つについて下記のように頭を使って定義する必要がある。

- 自明に答えが出るのはどのような場合か？
- より小さな部分問題はどのようにしたら作ることができるか？
- 再帰呼び出しの結果から全体の結果がどのように得られるか？

#### 例としてクイックソート

分割統治法の考え方

- 問題を部分問題に分割する
- 各々の部分問題を独立に解く
- 得られた解から全体の解を計算する

クイックソートでは上記の考え方を応用する。
与えられたリストから一つの要素を取ってくる。これを基準の要素と呼ぶ。
これを元にしてリストを二つに分割する。基準の要素より小さなリストと大きなリスト。
それぞれを独立に整列させる。
小さなリスト、基準の要素、大きなリストの順に並べる。

#### 補助関数を都合よく作り出す。

複雑な仕事をする必要ができた時には補助関数を作る。基本的に一つの関数は一つの仕事のみを行うことを前提とする。一つの関数に複数の処理をさせると間違いが増えるばかりでなく見通しも悪くなり信頼性が落ちる。複雑な仕事をしなければならない場合には補助関数を使うようにする。
なので関数を作っているときにその関数の本来の仕事と切り離せる別の仕事をする必要が出てきた時には都合の良い関数（こんな関数があればなあ...）をでっちあげてその仕事をさせるようにする。
これは再帰呼び出しをする際にその関数がまだ完成していないのにも関わらずそれを使用するのと同様である。
この方法を取ることで目的の関数をシンプルかつとても簡単に実装することができる。
またでっちあげた補助関数も入力と期待する出力が明確になっているので簡単に実装できる。これは実装の複雑さを極端に軽減させる方法なので「できないはずのことをできるようにする方法」と言っても良いと思う。デザインレシピの魔法の一つかもしれない。

``` OCaml
(* 目的 : 整数とリストを受け取って整数より小さな要素のみのリストを返す *)
(* take_less : int -> int list -> int list *)
let take_less n list = []

(* 目的 : 整数とリストを受け取って整数より大きな要素のみのリストを返す *)
(* take_greater : int -> int list -> int list *)
let take_greater n list = []

(* 目的 : 受け取ったリストをクイックソートで昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort list = match list with
    [] -> [] (* 自明に答えがでるケース *)
  | first :: rest -> [] (* それ以外のケース *)
  (* take_less first rest *)
  (* take_greater first rest *)
```

これで補助関数を使って部分問題を作ることができた。
