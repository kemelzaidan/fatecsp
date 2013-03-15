program lista2_exec_e;

uses crt;
var i, num, inicio, fim : integer;


function par(num:real):boolean;
begin

       if ( (num mod 2) = 0 ) then
       par := false;
       else 
       par := true;

end;

procedure qualafaixa;
	begin
	write ('Quais são os números ímpares numa faixa numérica?');
	writeln;
	write ('Digite o 1º número da faixa: ');
	readln(inicio);
	write('Digite o último número da faixa: ');
	readln(fim);
	writeln('Os números ímpares entre ', inicio, ' e ', fim, ' são:');
	end;

procedure calculo;
begin
for i := inicio to fim do
	begin
	num:=i;
		if Odd(num) then
			writeln (num);
	end;	
end;

BEGIN
qualafaixa;
calculo;
END.

