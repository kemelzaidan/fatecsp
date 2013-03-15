program quantosanos;

uses crt;
var nascimento, ano, idade : integer;
	niver : char;
{type resposta=(sim, nao);}

BEGIN
	write ('Digite o ano do seu nascimento: ');
	read (nascimento);
	write ('Digite o ano atual: ');
	read (ano);
		repeat
			write ('Você já fez aniversário este ano? s/n: ');
			readln (niver);
		until ((niver='s') or (niver='n'));
		if (niver='s') then
			idade:=(ano-nascimento);
		if (niver='n') then
			idade:=(ano-nascimento-1);
	{case niver of
		's' : idade:=(ano-nascimento);
		'n' : idade:=(ano-1-nascimento);
		else
			writeln(Chr(7), 'Opcao invalida');
	end;}
	writeln('Sua idade é ', idade);
	{readln (niver);
		if niver='sim' then
			begin
			idade:=(ano-nascimento);
			writeln(('Sua idade é '),idade);
			end
		else
			begin
			idade:=(ano-1-nascimento);
			writeln ('Sua idade é ',idade);
			end;}			
END.
