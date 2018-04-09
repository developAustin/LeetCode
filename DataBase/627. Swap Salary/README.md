二进制异或运算可以解决：A^B^A=B,A^B=B^A<br>
但是运用于数据库的字符时要注意要转为ASCII<br>
```myql
update salary set sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));
```