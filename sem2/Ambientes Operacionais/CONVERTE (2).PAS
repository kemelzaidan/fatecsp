program conversor;
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


FUNCTION BiDec (svalor:string; nexpo, nloop: integer): Real;
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
    BiDec := nexp;
End;


Procedure Bin2Dec;
Var
	lhexa, sexp: string[8];
	Gabarito: string[32];
	l, s: string[1];
	PNum: String[25];
	n, x, y, z, ne: integer;
	PIN: longint;
	Valor: double;

Begin
	Repeat
	Begin
		clrscr;
		gotoxy (1, 2); write ('******************* BINARIO NO PADRAO IEEE 754 PARA DECIMAL ********************');
		gotoxy (1, 3); write ('                 *para sair digite "EXIT" no lugar do numero*                   ');
		gotoxy (1, 4); write ('********************************************************************************');	
		gotoxy (1, 7); writeln ('                     INFORME UM NUMERO PARA CONVERSAO: __                       ');
		gotoxy (56,7); readln(lhexa);

		if (lhexa <> 'exit') and (lhexa <> 'EXIT') then
		Begin
			While length(lhexa) <> 8 do
			Begin
				If ((lhexa = 'exit') or (lhexa = 'EXIT')) then Exit;
                gotoxy (1, 8); Write('        Valor invalido. O valor em Hexadecimal deve conter 8 posicoes.          ');
				gotoxy (56,7); delline ; readln(lhexa);
			end;
		End;
		If ((lhexa = 'exit') or (lhexa = 'EXIT')) then Exit;
		gotoxy (1, 8); delline;

		Gabarito:= '';

		For x:=1 to 8 do
		Begin
			l:= copy (lhexa, x, 1);
			Gabarito:= concat (Gabarito, hexbin (l));
		End;

		s:= copy (Gabarito, 1, 1);
        sexp:= copy (Gabarito, 2, 8);
		ne:= trunc (BiDec(sexp, 7, 8)) - 127;

        PNum:= copy (Gabarito, 10, 23);
		valor:= BiDec('1'+ PNum, ne, 24);
		

		if s= '1' then valor:= -Valor;
		gotoxy (1,  9); write ('           GABARITO: ', Gabarito);
		gotoxy (1, 10); write ('              SINAL: ', s);
		gotoxy (1, 11); write ('   EXPOENTE C/ BIAS: ', sExp, ' = ', (ne + 127));
		gotoxy (1, 12); write ('           EXPOENTE: ', (ne + 127), ' - 127 = ', ne);
		gotoxy (1, 13); write ('  VALOR NORMATIZADO: ', '1,', PNum , ' * 2 ^ ', ne);
		gotoxy (1, 14); write ('   VALOR EM DECIMAL: ', VALOR:5:40);
		ReadKey;
	End;
	Until (lhexa = 'exit') or (lhexa = 'EXIT');

End;


Function b2h (nbin:string) :string;
Begin
	if nbin = '0000' then b2h := '0'
	else if nbin = '0001' then b2h := '1'
	else if nbin = '0010' then b2h := '2'
	else if nbin = '0011' then b2h := '3'
	else if nbin = '0100' then b2h := '4'
	else if nbin = '0101' then b2h := '5'
	else if nbin = '0110' then b2h := '6'
	else if nbin = '0111' then b2h := '7'
	else if nbin = '1000' then b2h := '8'
	else if nbin = '1001' then b2h := '9'
	else if nbin = '1010' then b2h := 'A'
	else if nbin = '1011' then b2h := 'B'
	else if nbin = '1100' then b2h := 'C'
	else if nbin = '1101' then b2h := 'D'
	else if nbin = '1110' then b2h := 'E'
	else if nbin = '1111' then b2h := 'F';
end;


Function dbDEC (PDE, Valor: real; var ne: integer):String;
{converte a parte decimal para binario e retorna o exponte caso o valor nao possua parte inteira}
Var
	dBin: string[24];
    xver: Boolean;
    x, i: integer;
    n: double;
Begin

	x:= 24 - ne;
    i:= 1;
	dBin:='';
    if Valor >= 1 then XVER:= True else XVER:= False;
	Valor:= PDE;
	
	if PDE <> 0 then
	begin
		while i<= x do
		begin
			n:= EXP(ln(2) * (-i));

			if valor>= n then
			begin
				valor:= valor - n;
				dBin:= concat(dBin, '1');
				if ((xVER = False) and (ne=0)) then ne:= -i;
				{Se a Parte inteira e o expoente forem iguais a zero atribui o valor de i ao expoente}
			end
			else
			begin		
				if ((ne = 0) AND (xVer = False) and (PDE <> 0)) then
				   {Se a Parte inteira e o expoente aumenta 1 passo ao laço, para garantir que haja 23 posições significativas}
				   x:= x + 1
				else
				begin
					dBin := concat(dBin, '0');
					if ((PDE = 0) and (xVer = false)) then ne:= -x;
				end;
			end;
			i:= i + 1;
		end;
	End
	Else
	Begin
		for i:= 1 to x do
		Begin
        	dbin := concat(dbin, '0');
			if ne = 0 then ne:= -127;
			
        end;
	end;
	dbDec:= dBin;
End;

	
	
Function dbINT (valor: Longint; var ne: integer):String;
VAR
	lbin: string;
	e, i, n: Longint;
Begin
	if valor > 0 then
	Begin
		
		{calcula a primeira potencia de 2 da parte inteira}
		e:= trunc((ln(Valor)/ln(2)) + 0.000000000000001);
		lbin:= ''; {variavel de transicao}
        ne:= e;

		{inicia o For pelo maior expoente}
		for i:= e DownTo 0 Do
		begin
			{calcula o valor de 2^i}
			n:= trunc(EXP(ln(2) * i ));
			{verifica se o numero e maior que a potencia de 2 a i
			 se for maior subtrai a potencia de 2 do numero e
			 atribui 1 ao binario, caso contrario atribui 0.}
			if Valor >= n then
			begin
				Valor := Valor - n;
				lbin:= concat (lbin, '1');
			end
			Else
				lbin:= Concat(lbin, '0');
		end;
	End
	Else
	Begin
		lbin:= '0';
        ne:=0;
	end;
    dbINT:= lbin;
END;


Procedure Dec2bin;

Var
	ldec, nbin: string;
	Gabarito: String[32];
	sNorm, sInt, sDec: String[24];	
	sExp, lhexa : String[8];
	Sinal: String[1];
	Valor, PDE: double;
	PIN: longint;
	x, i, erro: integer;
	ne: Integer;
	
Begin
	Repeat
	Begin
		clrscr;
		gotoxy (1, 2); write ('******************* DECIMAL PARA BINARIO NO PADRAO IEEE 754 ********************');
		gotoxy (1, 3); write ('                 *para sair digite "EXIT" no lugar do numero*                   ');
		gotoxy (1, 4); write ('********************************************************************************');	
		gotoxy (1, 7); writeln ('                     INFORME UM NUMERO PARA CONVERSAO: __                       ');
		gotoxy (56,7); readln (ldec);

		if (ldec <> 'exit') and (ldec <> 'EXIT') then
		Begin
			val (ldec, valor, erro);

			{Verifica se o numero e positivo ou negativo}
			if Valor >= 0 then Sinal:= '0' else Sinal:= '1';
			gotoxy (1, 9); write ('              SINAL: ', Sinal);	
			
			Valor:= abs(Valor);
			
			{Calcula a Parte Inteira}
			PIN:= trunc(Valor);
			sInt:= dbInt (PIN, ne);
			gotoxy (1, 10); write ('      PARTE INTEIRA: ', sInt);
			
			{Calcula a Parte Decimal}
			PDE:= Valor - PIn;
			sDec:= dbDec(PDE, Valor, ne);
			gotoxy (1, 11); write ('      PARTE DECIMAL: ', sDEC);
			
			{Numero Normatizado}
			if PIN > 0 then
				sNorm:= Concat(copy (sInt, 2, 24), sdec)
			else
				sNorm:= copy (sDec, 2, 24);
			
			gotoxy (1, 12); write ('  VALOR NORMATIZADO: ', '1,', sNorm , ' * 2 ^ ', ne);
			
			{Expoente}
			gotoxy (1, 13); write ('           EXPOENTE: ', ne);
			sExp := dbInt ((ne + 127),  x);

            for x:= x + 1 to 7 do
            {Completa com zeros a esquerda}
            Begin
               sExp:= concat('0', sExp);
            end;
			gotoxy (1, 14); write ('   EXPOENTE C/ BIAS: ', ne , ' + 127 := ', sExp);
		
			{Preenche o Gabarito}
			Gabarito:= Concat(Sinal, sExp, sNorm);
			gotoxy (1, 15); write ('           GABARITO: ', Gabarito);
			
			{Converte para HexaDecimal}
			lhexa:='';
			For i:= 0 to 7 DO
			Begin
				x:= i * 4;
				nbin := copy (Gabarito, x+1, 4);
				lhexa := concat(lhexa, b2h (nbin));
			End;
			gotoxy (1, 16); write ('    PADRAO IEEE 754: ', lhexa);
			readkey;
		end;
		
	End;
	Until (ldec = 'exit') or (ldec = 'EXIT');
End;

Var
	t: integer;
Begin

	Repeat
	Begin
		clrscr;
		gotoxy (1,4); write ('================================================================================');
		gotoxy (1,5); write ('              Conversao de numeros DECIMAL <===> BINARIO IEEE 754               ');
		gotoxy (1,6); write ('================================================================================');
		
		gotoxy (1,11); write ('              Informe o tipo de convesao:  ');
		gotoxy (1,12); write ('                           1: Decimal ---> Binario');
		gotoxy (1,13); write ('                           2: Binario ---> Decimal');
		gotoxy (1,14); write ('                           0: Sair');
		gotoxy (44, 11); readln (t);
		
		case t of
			1:  Begin
				dec2bin;
			End;
			
			2: 	Begin
				bin2dec;
			End;
			
			0: Begin
               EXIT;
			End;
			Else Begin
				gotoxy (28,15); write ('Opcao Invalida');
			End;
            End;
	End;
	Until t=0;
End.