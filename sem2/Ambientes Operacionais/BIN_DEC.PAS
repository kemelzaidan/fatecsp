program bin_dec;
uses crt;


Function hexbin (nhex:string): String;
Begin
	if nhex = '0' then hexbin:='0000'
	else if nhex = '1' then hexbin:='0001'
	else if nhex = '2' then	hexbin:='0010'
	else if nhex = '3' then hexbin:='0011'
	else if nhex = '4' then hexbin:='0100'
	else if nhex = '5' then hexbin:='0101'
	else if nhex = '6' then hexbin:='0110'
	else if nhex = '7' then hexbin:='0111'
	else if nhex = '8' then hexbin:='1000'
	else if nhex = '9' then hexbin:='1001'
	else if ((nhex = 'A') or (nhex = 'a')) then hexbin:='1010'
	else if ((nhex = 'B') or (nhex = 'b')) then hexbin:='1011'
	else if ((nhex = 'C') or (nhex = 'c')) then hexbin:='1100'
	else if ((nhex = 'D') or (nhex = 'd')) then hexbin:='1101'
	else if ((nhex = 'E') or (nhex = 'e')) then hexbin:='1110'
	else if ((nhex = 'F') or (nhex = 'f')) then hexbin:='1111';
end;


FUNCTION BD_INT (svalor:string; nexpo, nloop: integer): Real;
{Trata numeros inteiros convertendo de binario para decimal
	svalor: valor para conversao
	ne: primeiro loop (em geral o comprimento do numero)
	nloop: numero de loops}
Var
	s, x, y, z, e: integer;
	nexp: Real;
	l: string[1];

Begin

	{Verifica a quantida de posicoes do numero a ser convertido}
	s:= length (svalor);
    nexp:= 0;
    {Expoente em trabalho}

	if nloop = 0 then nloop := s;
    if nexpo = 0 then nexpo := s-1;

    x:= 1;
    z:= nexpo;

    While x <= nloop do
	{trabalha o numero binario comecando pela ultima posicao}
	begin
		{Posicao do numero Binario}
		l:= copy (svalor, x, 1);
		if l = '1' then nexp:= nexp + ((Exp(ln(2) * (z))));
		z:= z - 1;
        x:= x + 1;
	end;
    BD_INT := nexp;
End;




var
	lhexa, sexp: string[8];
	bin: string[32];
	l, s: string[1];
	PNum: String[25];
	n, x, y, z, ne: integer;
	PIN: longint;
	PDE: real;

Begin

    CLRSCR;

	Repeat
	Begin
		Write ('Informe o numero hexadecimal, no padrao ieee 754 para conversao: ');
		readln(lhexa);
		While length(lhexa)<>8 do
		Begin
            If ((lhexa = 'exit') or (lhexa = 'EXIT')) then exit;
			Writeln('Valor invalido. O valor em Hexadecimal deve conter 8 posicoes.');
			Writeln('Informe novo numero: ');
			readln(lhexa);
		end;

        bin:= '';

		For x:=1 to 8 do
		Begin
			l:= copy (lhexa, x, 1);
			bin:= concat (bin, hexbin (l));
		End;

		s:= copy (bin, 1, 1);
        sexp:= copy (bin, 2, 8);
        PNum:= copy (bin, 10, 23);

        ne:= trunc(bd_int(sexp, 7, 8)) - 127;
        PDE:= bd_int('1'+ PNum, ne, 24);
        writeln ('(' , lhexa , ')ieee754 =====> (', PDE:5:10 , ')10');
		ReadKey;
	END;
	Until ((lhexa = 'exit') or (lhexa = 'EXIT'))
End.
