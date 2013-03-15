program lista2_exec_g;

uses crt;
var i : byte;
	base : integer;
	resultado : Longint;



{for i:= 1 to 14 do
begn
digie a bae:

resultado:= pot(base, i);
end;

function pot(base, expo:real): real;
begin






pot := resultado;
end;}


//programa para mostrar um número elevado até a 15 potência
BEGIN
	writeln('Quer saber as 15 primeiras potências de um número?');
	write('Digite o número da base: ');
	readln(base);
	writeln;
	writeln(base, ' elevado a 0 = 1');
	
	resultado := 1;
	for i:=1 to 15 do
		begin
		resultado := resultado*base;
		writeln(base, ' elevado a ', i, ' = ', resultado);
		end;
	
END.

