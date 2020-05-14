# Day 4
## 関数の種類(引数が必要なものにおいて)
### 単一行関数
各行に対して処理を行い、行単位で結果を返す。引数には、列名 or 実際の値を指定する

### グループ関数
複数の行を1グループとして処理を行い、一つの結果を返す。引数には列名を指定する


## 数値関数
### CEILING(CEIL)関数
引数以上で最も小さい整数値を返す。引数が実数だった場合は、その小数点以下を切り上げた値を返す

### FLOOR関数
引数以下で最も大きい整数値を返す。引数が実数だった場合は、その小数点以下を切り捨てた値を返す

### RAND関数
0以上1.0未満の範囲の乱数を取得する関数

例
```
SELECT RAND();
SELECT RAND();
SELECT RAND(7);
SELECT RAND(7);
```

実行結果
```
0.454560.....
0.200140.....
0.713703.....
0.713703.....
```

## 集約関数
列を一つのまとまりとして捉えて処理を行う関数。引数には列名を指定する

### AVG関数
列に含まれるすべての値(NULL値を除く)を対象に、その平均値を求める

### SUM関数
列に含まれるすべての値(NULL値を除く)の合計を求める

### COUNT関数
列の行数を求める

重複データをい除いた行数を用いる場合は以下のように`DISTINCT`を使うと良い

```
COUNT(DISTINCT number)
```

### MAX・MIN関数
`MAX`関数は列の中の最大値を求め、MIN関数は`最小値`を求める

### グループ単位で処理を行いたい場合

```
USE db_ehon;
SELECT name, MAX(score) AS high, MIN(score) AS low
  FROM tbl_game GROUP BY name;
GO
```

### HAVING句
`GROUP BY`句でグルーピングした結果から条件に合うデータだけを取り出すには、HAVING句を用いる。`SELECT`を使うときには、WHERE句を使えばよいが、`GROUP BY`を使っている場合には、WHERE句は使えない。だから、HAVING句を用いる必要がある

```
SELECT price, COUNT(title) FROM tbl_ehon GROUP BY price
HAVING COUNT(title) = 1;
```

## サブクエリ
SELECT文の中にもう一つSELECT文を書くことが可能。入れ子になったSELECT文をサブクエリといい、外側にあるSELECT文をメインクエリという。サブクエリで取り出した結果(入れ子になっている方のSELECT文)を基にメインクエリ(外側のSELECT文)が実行される

## INSERT文
### 列名を省略して登録する場合

```
INSERT INTO tbl_tea VALUES (2, '紅茶', 850);
```

### 特定の列にのみ値を登録する場合

```
INSERT INTO tbl_tea (name, code) VALUES ('ほうじ茶', 3)
```

### SELECT文の結果を登録する場合

```
INSERT INTO tbl_petlist (id, name) SELECT no, name FROM tbl_cat
```

## UPDATE文

### 1つの値を更新する
SETで更新する列名と新しい値を指定する

```
UPDATE tbl_lunch SET price = 760 WHERE code = 2;
```

### 複数の値を更新する
複数の列の値を更新するうには、更新内容を感まで区切って列挙する

```
UPDATE tbl_lunch
  SET menu = '今日のランチ', price = 790 WHERE code = 1;
```

## DELETE文
### 条件と一致したデータを削除する

```
DELETE FROM tbl_tel WHERE name = '花田';
```

### すべてのデータを削除する

```
DELETE FROM tbl_tel
```

## サブクエリ
### WHERE句でサブクエリを使用する

```
SELECT * FROM tbl_cake
  WHERE price >= (SELECT AVG(price) FROM tbl_cake);
```

### HAVING句でサブクエリを使用する

```
SELECT code, MIN(arrival) FROM tbl_stock GROUP BY code
  HAVING MIN(arrival) < (SELECT AVG(shipment) FROM tbl_stock);
```

### FROM句でサブクエリを使用する

```
SELECT MIN(price) FROM
  (SELECT * FROM tbl_cake WHERE price >= 250) AS c_price
```
