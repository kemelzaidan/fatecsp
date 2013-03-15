program soma_1ate100;
// lista 2 - exerc C

uses crt;
var i : byte;
	resultado : integer;

BEGIN

i := 0; resultado := 1;

writeln ('Pressione qualquer tecla para começar ');
readkey;

while (i < 100) do
	begin
		resultado := resultado + i;
		i := i+1;
	end;
	
write ('O resultado da soma dos numeros inteiros de 1 a 100 é : ', resultado);

END.

