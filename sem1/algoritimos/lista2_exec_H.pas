program lista2_exec_H;

uses crt;
var i : byte;
	base, expoente : integer;
	resultado : Longint;

//programa para mostrar um número elevado a uma potência
BEGIN
	writeln('Qual é o resultado da potência do número que você quer saber?');
	writeln;
	write('Digite o número da base: ');
	readln(base);
	write('Digite o número do expoente: ');
	readln(expoente);
	
	resultado := 1;
	for i:=1 to expoente do
		resultado := resultado*base;
	
	writeln(base, ' elevado a ', expoente, ' = ', resultado);
	
END.

