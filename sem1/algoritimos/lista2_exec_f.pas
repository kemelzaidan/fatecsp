program lista2_exec_f;

uses crt;
var i, num, inicio, fim : integer;

procedure qualafaixa;
	begin
	write ('Quais são os números divisíveis por 4 numa faixa numérica?');
	writeln;
	write ('Digite o 1º número da faixa: ');
	readln(inicio);
	write('Digite o último número da faixa: ');
	readln(fim);
	writeln('Os números divisíveis por 4 entre ', inicio, ' e ', fim, ' são:');
	end;
	
procedure calculo;
begin
for i := inicio to fim do
	begin
	num:=i;
		if (num mod 4 = 0) then
			writeln (num);
	end;
end;

BEGIN
qualafaixa;
calculo;
END.

