program calc_quad_1a200;
// lista 2 - exec A

uses crt;
var resultado : array[1..186] of real;
	i, base: byte;

BEGIN
//pede o número a ser calculado
writeln('Cálculo dos quadrados dos números inteiros de 15 a 200');
writeln;
writeln('Digite qualquer tecla para continuar');
readkey;

//cálculo
i :=1; base := 15;
while (base <= 200) do
	begin
		resultado[i] := (base*base);
		writeln ('O quadrado de ', base, ' é: ', resultado[i]:0:0);
		i:=i+1;
		base := base +1;
	end;

END.
