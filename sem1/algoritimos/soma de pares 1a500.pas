program soma_1ate500_pares;
// lista 2 - exec D

uses crt;
var i : integer; 
	resultado : word;

BEGIN

i := 0; resultado := 2;

writeln ('Pressione qualquer tecla para começar ');
readkey;

while (i < 500) do
	begin
		resultado := resultado + i;
		i := i+2;
	end;
	
write ('O resultado da soma dos numeros inteiros pares de 1 a 500 é : ', resultado);

END.

