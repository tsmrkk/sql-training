# Day 3
## ROWNUM(ORACLE)
行を何行か取り出す方法。疑似列と呼ばれていて、実際のテーブルには存在しないのに、あたかも存在する列であるかのよう扱えるような仕組み

先頭から2から4までの行を取り出している

```
SELECT * FROM tbl_ehon
  WHERE ROWNUM BETWEEN 2 AND 4;
```

## LIMIT(MySQL)
ROWNUMと同じことをする。若干PostgreSQLとは構文が異なる

0行目から10行目までを指定してとってくる

```
SELECT * FROM tbl_ehon ORDER BY key LIMIT 0, 10;
```

## GROUP BY
指定した列ので0田が同じである場合に、それらの行を一つにまとめる。集約関数(今回の例の場合のCOUNTのような関数を指す)と一緒に利用する。COUNTは()の中で指定された列に存在する行の数を返す。

```
SLECT price, COUNT(title) FROM tbl_ehon GROYP BY price;
```

## DISTINCT

指定した列にある重複したデータを取り除いて表示が可能。以下の例であれば、titleで重複を除いて表示を行っている

```
SELECT DISTICT title FROM tbl_ehon;
```

## AS
列名のaliasみたいなのができる

```
SELECT code AS bookcode FROM tbl_ehon;
```

## IDENTITY

第一引数に始まりの値、第二引数に増分を指定する。作成されたレコードに自動的にIDを付与したい場合などに用いる。テーブルの中で一つの列だけ指定可能。また、IDENTITYを指定した列にNULLは入れられない

この例だと0が始まりの値で、10が増分。idは0から始まって、新しいレコードは前に作られたレコードのidに10を足したものになる。

```
id INT IDENTITY (0, 10)
```

以下のように指定した場合は、(1, 1)を設定したのと同じになる。1, 2, 3, 4, 5, ...のようにIDの数が増えていく。

```
id INT IDENTITY
```

## 算術演算子

nameとsumの一覧が返ってくる

```
USE db_ehon;
SELECT name, (eng_score, math_score) AS sum FROM tbl_exam;
GO
```

```
USE db_ehon;
SELECT name, (math_score + eng_score) / 2 AS average
  FROM tbl_exam ORDER BY average DESC;
GO

```

## 条件式の評価

```
USE db_ehon;
SELECT id, name, eng_socre FROM tbl_exam WHERE eng_score > 90;
SELECT id, name, math_socre FROM tbl_exam WHERE name='kokitsumura';
GO
```

## 論理演算子

```
USE db_ehon;
SELECT * FROM tbl_exam
  WHERE ((id % 2) < 1) AND (eng_score >= 80);
```

## 文字列連結演算子
文字を連結するときには、`||` を使う

```
SELECT name || last_name FROM tbl_meibo;
```

MySQLの場合

```
SELECT concat(name, last_name) FROM tbl_meibo;
```

## 文字列の比較
文字列から特定の文字を含むデータを取り出す場合に使う。あいまい検索。演算子としては `_` や `%` がある。`%`は0から任意の長さの文字列に相当する。`_`は一文字に相当する。

```
SELECT name FROM tbl_ehon WHERE name LIKE 'し%'
```

## BETWEEN

値の範囲を指定することができる

```
SELECT score FROM game WHERE score BETWEEN 10 AND 20;
```

## IS NULL

以下の例ではpriceがNULL出ないものをとってくる

```
USE db_ehon;
SELECT * FROM tbl_bookprice WHERE price IS NOT NULL;
GO
```

以下の例ではpriceがNULLなものをとってくる

```
USE db_ehon;
SELECT * FROM tbl_bookprice WHERE price IS NULL;
GO
```

## IN

指定した列のデータの中から、()内のいずれかの値と一致するデータだけを取り出せる

numberが5か10のものとってくる

```
SELECT player FROM tbl_team WHERE number IN (5, 10);
```

## SQL文における句の実行順序

SQLの評価順序

```
1. FROM
2. ON
3. JOIN
4. WHERE
5. GROUP BY
6. WITH CUBE(WITH ROLLUP)
7. HAVING
8. SELECT
9. DISTINCT
10. ORDER_BY
```
