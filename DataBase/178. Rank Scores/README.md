solution思路
-------------

要对分数排名，即要形成行号，第一个想法就是用用户变量记录<br>
因为相同分数排名相同，因此distinct倒序记行号<br>
要将行号关联到原分数表上，马上能想到的是与原表关联<br>

其他解决方案
------------
1.与前一个分数对比，来判断行号是否+1
```mysql
SELECT
  Score,
  @rank := @rank + (@prev <> (@prev := Score)) Rank
FROM
  Scores,
  (SELECT @rank := 0, @prev := -1) init
ORDER BY Score desc
```
<br>
2.用子查询来统计当前的分数是第几大

```mysql
SELECT
  Score,
  (SELECT count(distinct Score) FROM Scores WHERE Score >= s.Score) Rank
FROM Scores s
ORDER BY Score desc
```
<br>
以上，行号计算：1.变量，2.COUNT分数第几大