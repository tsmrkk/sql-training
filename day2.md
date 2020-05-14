# Day 2
## CREATE
TableやDBの作成をするときに使う

## USE
どのDBを使うかを指定するときに使う


## GO
クエリを`GO + Enter`で実行できる

## INSERT
テーブルにデータを追加するときに使う。登録先のテーブルを`INTO`の後に指定する

```
INSET INTO tbl_ehon (code, title, price) VALUES (111, 'C book', 1380);
```

## SELECT
テーブルに登録してあるデータを取り出すときに使う。どこのテーブルから取り出したいかは`FROM`を使って指定する

テーブルにある全ての列を取り出す例

```
SELECT * FROM tbl_ehon;
```

titleの列だけを取り出す例

```
SELECT title FROM tbl_ehon;
```

## WHERE
特定の条件に会ったデータだけ取り出したいときに使う。WHEREの後に、取り出した列とその条件を指定する

`zip_code`が`170-0000`にマッチするものをとってくる例

```
SELECT * FROM tbl_address WHERE zip_code='170-0000';
```

## ORDER BY
降順で条件にマッチしたものを取り出す例

```
SELECT * FROM tbl_address WHERE score >= 80 ORDER BY id DESC;
```

## TOP
先頭から何行まで取り出すかを指定するときに使う

先頭から10行取り出す例
```
SELECT TOP (10) id FROM tbl_a ORDER BY id;
```

先頭から上位20%までのものを取り出す例
```
SELECT TOP (20) PERCENT id FROM tbl_a ORDER BY id;
```

