program versor;
uses crt;

Var
	n, Ndec: real;
	i, e, x: integer;

Function bin2hex (nbin:string) :string;
Begin
	if nbin = '0000' then bin2hex := '0';
	if nbin = '0001' then bin2hex := '1';
	if nbin = '0010' then bin2hex := '2';
	if nbin = '0011' then bin2hex := '3';
	if nbin = '0100' then bin2hex := '4';
	if nbin = '0101' then bin2hex := '5';
	if nbin = '0110' then bin2hex := '6';
	if nbin = '0111' then bin2hex := '7';
	if nbin = '1000' then bin2hex := '8';
	if nbin = '1001' then bin2hex := '9';
	if nbin = '1010' then bin2hex := 'A';
	if nbin = '1011' then bin2hex := 'B';
	if nbin = '1100' then bin2hex := 'C';
	if nbin = '1101' then bin2hex := 'D';
	if nbin = '1110' then bin2hex := 'E';
	if nbin = '1111' then bin2hex := 'F';
end;

Function DB_INT (valor: Longint; var ne: integer):String;
VAR
	lbin: string;
Begin
	{calcula a primeira potencia de 2 da parte inteira}

	if valor > 0 then
	Begin
		e:= trunc((ln(Valor)/ln(2))+ 0.0000000000000001);
		ndec:= Valor;
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
			if ndec >= n then
			begin
				ndec := Ndec - n;
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
    db_int:= lbin;
END;

Function DB_DEC (PDE: real; var ne: integer; xver: Boolean):String;
{converte a parte decimal para binario e retorna o exponte caso o valor nao possua parte inteira}
Var
	dBin: string[24];
    valor: real;
Begin
	x:= 24 - ne;
    i:= 1;
	dBin:='';

    valor := PDE;

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
	db_dec:= dBin;
End;


Function ExpcBias (expoente: integer; var ExpCB: integer): String;
{Calcula o Expoente com Bias}
Var
	lgh: integer;
    lexp: string[8];
Begin
	e:= expoente + 127;
	lexp:= db_int (e, x);
	lgh:= length(lexp);

	while lgh < 8 do
	begin
		lexp:= Concat ('0', lexp);
		lgh:= length(lexp);
	end;
	ExpCB:= expoente + 127;
	ExpcBias:= lexp;
End;


FUNCTION dec2Ieee754 (Valor: real; VAR Ieee754: string ): String;
VAR
    PDE: real;
    PIN: longint;
    ne: integer;
    IntBi, DecBi, ExpBi: String;
	dec2ieee_32: string;
	nbin: string[4];
	numbin: string;
	nver : boolean;

Begin
	{Verifica se um numero e negativo ou positivo,
	 se for positivo, atribui o primeiro digito do gabarito como 0,
	 se for negativo, atribui como 1}

	if Valor >= 0 then dec2ieee_32 := '0' else dec2ieee_32 := '1';

	{Obtem o modulo do numero trabalhado}
	Valor:= abs (valor);
	{Le a parte inteira do numero}
	PIN:= trunc(valor);
	{converte a parte inteira em binario e retorna o expoente}
	IntBi:= db_int(PIN, ne);

	if PIN > 0 then NVER:= true else NVER:= False;

	PDE:= Valor - PIN;
	DecBi:= db_dec (PDE, ne, nver);
	if Valor=0 then ne:=-127;

	expBi:= ExpcBias (ne, e);
	if nver=true then numbin:= concat(intbi, decbi) else numbin:= decbi;
    numbin:= Copy(numbin, 2, 23);


	dec2ieee_32:= CONCAT(dec2ieee_32, expBI, numbin);
	dec2Ieee754 := dec2ieee_32;

	numbin := '';

	For i:= 0 to 7 DO
	Begin
		x:= i * 4;
		nbin := copy (dec2ieee_32, x+1, 4);
        numbin := concat(numbin, bin2hex (nbin));
	End;
	IEEE754:= numbin;
End;


VAR
    valor: real;
	Gabarito, lhexa: String;
	t: integer;

Begin
	clrscr;
	writeln ('============== Conversao de numeros DECIMAL <==> BINARIO IEEE 754 ==============');
	Repeat
	Begin
        writeln ('Informe o tipo de convesao: 1: Decimal --> Binario ');
		writeln ('                            2: Binario --> Decimal ');
		writeln ('                            0: Sair');
		readln (t);

		while ((t<>1) and (t<>2) and (t<>0)) do
		begin
			writeln ('Tipo invalido, Informe 1, 2 ou 0');
			read(t);
		end;

		Case t of
			1:
			BEGIN
				write ('Informe o numero decimal para conversao: ');
				readln(valor);
				
				Gabarito := dec2Ieee754 (valor, lhexa);
				writeln ('GABARITO EM BINARIO:= ', Gabarito);
				writeln ('PADRAO IEEE 754 (HEXA):= ', lhexa);
				readkey;
			End;
		End;
        writeln;
	End;
	Until (t=0);
	writeln (' ======================== Fim ======================== ');
	ReadKey;
End.