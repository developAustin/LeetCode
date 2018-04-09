取余函数及CASE WHEN的运用<br>

主要思想
----------
idt1t2t3<br>
    A<br>
1 A B<br>
2 B C A<br>
3 C D B<br>
4 D E C<br>
5 E   D<br>
      E<br>
3表关联后如上，显然student取值要根据id的奇偶，当然对于奇数个学生，要特殊处理<br>
根据id奇偶性，动态取student<br>

其他解法
--------
```mysql
SELECT
    (CASE
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        WHEN MOD(id, 2) != 0 AND counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    seat,
    (SELECT
        COUNT(*) AS counts
    FROM
        seat) AS seat_counts
ORDER BY id ASC;
```
根据id奇偶性，动态改变id取值<br>

```mysql
SELECT
    s1.id, COALESCE(s2.student, s1.student) AS student
FROM
    seat s1
        LEFT JOIN
    seat s2 ON ((s1.id + 1) ^ 1) - 1 = s2.id
ORDER BY s1.id;
```
这里有两个知识点：<br>
1.(id+1)^1-1
-------------
我们知道异或^,与0异或有保持特性，与1异或取反，因此对于二进制0101....101^1=0101...101^0000...001=0101...100<br>
进而，奇数^1=奇数-1，偶数^1=偶数+1<br>
因此，2^1=3,3^1=2,4^1=5,5^1=4,6^1=7<br>

2.COALESCE函数
--------------
返回传入的参数中第一个非null的值