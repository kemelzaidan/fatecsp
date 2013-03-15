program calc_tabuada;
//lista 2 - exerc B

uses crt;
var tabuada : array[1..10] of integer;
	i : byte;
	numero : integer;

BEGIN
//pede o número a ser calculado
writeln('Cálculo de tabuada');
writeln;
write('Digite o número para o cálculo: ');
readln (numero);

//cálculo
for i := 1 to 10 do
		tabuada[i] := (numero*i);

//exibição
for i := 1 to 10 do
	writeln (numero, ' X ', i, ' = ', tabuada[i]);	
	
END.
