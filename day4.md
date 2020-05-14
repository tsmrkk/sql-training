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
