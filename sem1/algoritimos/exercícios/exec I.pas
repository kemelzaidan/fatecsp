program exercicio_i;

uses crt;
var num, result : integer;

BEGIN
num:=0; result:=0;
write ('Digite um número inteiro: ');
read (num);
result:=(num*num);
write ('O quadrado de ', num,' é ', result);
END.
