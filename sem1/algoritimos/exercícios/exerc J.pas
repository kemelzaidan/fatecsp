program exec_J;

var A, B, diferenca, result : integer;

BEGIN
A:=0; B:=0; result:=0; diferenca:=0;
write ('Digite o número inteiro A: ');
readln (A);
write ('Digite o número inteiro B: ');
readln (B);
diferenca:=(A-B);
result:=(diferenca*diferenca);
write ('O resultado é: ', result);
END.
