regardless if there is an address for each of those people<br>
主要训练外连接，提交方案为左连，当然右连可以<br>
```mysql
SELECT FIRSTNAME,LASTNAME,CITY,STATE
FROM ADDRESS A
RIGHT JOIN PERSON B ON A.PERSONID=B.PERSONID
```