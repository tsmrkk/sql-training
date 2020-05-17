# Day 5

## 交差結合
実務においてクロス結合が役に立つケースは多くはない。各テーブルに存在する行動詞のすべての組み合わせを得ることができる。

以下の例は、`fruits`テーブルと、`kansou`テーブルをクロス結合する例。

```
SELECT * FROM fruits CROSS JOIN kansou;
```

## 内部結合
テーブルを結合するキーとなる列名を指定することで、共通の値をもつ行動詞を連結する。以下の例では、t1とt2を内部結合している例である。内部結合はクロス結合の結果から`ON`句で指定された結合条件を満たさない行は削除される。

t1

|id|hiragana|
|---|---|
|1|あ|
|2|い|
|3|う|

t2

|id|eng|
|---|---|
|2|ka|
|3|ki|
|4|ku|


```
SLECT * FROM table t1 INNER JOIN table t2 ON t1.id = t2.id
```

結果

|id|hiragana|id|eng|
|---|---|---|---|
|2|い|2|ka|
|3|う|3|ki|

## 外部結合
内部結合では、`ON`句で指定した条件に当てはまらなかった行は表示されなかったが、外部結合ではどちらかのテーブルに存在しているならば、そのテーブルの情報が欠けることなく出力される。

t1

|id|hiragana|
|---|---|
|1|あ|
|2|い|
|3|う|

t2

|id|eng|
|---|---|
|2|ka|
|3|ki|
|4|ku|

以下のクエリによって、左外部結合を行うと、

```
SLECT * FROM table t1 LEFT OUTER JOIN table t2 ON t1.id = t2.id
```

結果

|id|hiragana|id|eng|
|---|---|---|---|
|1|あ|||
|2|い|2|ka|
|3|う|3|ki|

以下のクエリによって、右外部結合を行うと、

```
SLECT * FROM table t1 RIGHT OUTER JOIN table t2 ON t1.id = t2.id
```

結果

|id|hiragana|id|eng|
|---|---|---|---|
|2|い|2|ka|
|3|う|3|ki|
|||4|ku|

以下のクエリによって、完全外部結合を行うと、

```
SLECT * FROM table t1 FULL OUTER JOIN table t2 ON t1.id = t2.id
```

|id|hiragana|id|eng|
|---|---|---|---|
|1|あ|||
|2|い|2|ka|
|3|う|3|ki|
|||4|ku|

## ビューの作成
ビューテーブルは、仮想テーブルであり、ユーザー毎に実行可能な処理をきめたり、ユーザーがみやすいようにテーブルを加工して見せることが可能である。また、ビューの実体はSQL文であり、テーブルのように大きな容量を必要としない。また、変更が比較的容易である。

order table

|id|order_by|
|---|---|
|120|yamada|
|119|tanaka|

detail table

|id|number|merchandise|
|---|---|---|
|120|1|egg|
|120|2|bread|
|119|3|rice|

```
CREATE VIEW yamada_order_merchandise
  AS SELECT * FROM order, detail
    WHERE order.id = detail.id
    AND order.order_by = 'yamada'
    WITH CHECK OPTION
```

上のクエリを実行すると以下のような結果になる。

yamada_order_merchandise

|id|order_by|number|merchandise|
|---|---|---|---|
|120|yamada|1|egg|
|120|yamada|2|bread|

以下のクエリを実行するとビューの削除ができる

```
DROP VIEW yamada_order_merchandise
```

ビューからデータを追加・更新・削除する場合、あたかもテーブルのデータを操作するように記述することが可能であるが、条件によっては追加・更新・削除ができない場合がある。

<img src="./1.png">

## ビューの利用

## 集合演算子

## 限定述語

## インデックス
インデックス（索引）とは、テーブルに格納されているデータに素早くたどり着くための仕組み。本の索引のようなものだと理解すると良い。テーブルを作成する際に、カラムに対して必要に応じて定義する。カラムに対して、インデックスを作成することを「インデックスを張る」とも言ったりする。

## トランザクション

## コミットとロールバック

## ロックの仕組み

## デッドロック

## 動的SQL

## ストアドプロシージャ

## トリガー

## 拡張SQL

## SQLによるプログラミング

## 拡張SQLの変数

## 拡張SQLの制御文

## 結果セットとカーソル

## データベースドライバ

## 列の構成を変更する

## 制約を追加する

## テーブル名、列名を変更する

## 外部キー

## テーブルとデータベースの削除

## 予約語

