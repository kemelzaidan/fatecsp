program pessoas;

uses crt;
	
var nome : array[1..10] of string;
	sexo : array[1..10] of char;
	homens : array[1..10] of string;
	mulheres : array[1..10] of string;
	i, h, f : byte;
	Opcao : char;
	
	procedure entrada_dados;
	var c : char;			

	begin
	c:= '0';
	i := 1;	

	clrscr;
		repeat
			writeln('Digite os dados ou ESC para encerrar');
			c:=readkey;			
			write('Digite o nome ', i, ': ');
			readln(nome[i]);
			write('Digite o sexo (m/f): ');
			readln(sexo[i]);
			i:=i+1;

		until (i=10) or (c=Chr(27));
	end;

	procedure calcular;	
	begin
	h := 0; f :=0;// i := 1;
	
		for i:= 1 to 10 do
		begin
		if (sexo[i] = 'm') then
			begin
				h:=h+1;
				homens[h]:= nome[i];
			end
		else
			begin
				f:=f+1;
				mulheres[f]:=nome[i];;
			end;
		end;
	end;
	
	procedure exibir_resultados;
	begin
	clrscr;
	writeln('Lista dos homens');
		for i := 1 to h do
		begin			
			writeln(	i, ' - ', homens[i]);
			writeln('Lista de mulheres');
		end;
		for i := 1 to f do
			writeln(	i, ' - ', mulheres[i]);
	end;
		
	
	procedure exibir_totais;
	begin
		writeln('Listagem de totais');
		for i := 1 to 10 do
			writeln(	i, ' - ', nome[i], ' - ', sexo[i]);
	end;

	procedure saida;
	begin
		clrscr;
		writeln('Até logo! (pressione qualquer tecla para sair)');
		readkey;
	end;
		
BEGIN
	Opcao := '0';
	while Opcao <> '4' do
	begin
	{montar menu}
		clrscr;
		gotoxy(8,1); writeln('* Lista por sexo *');
		writeln(' 1 - Ler lista');
		writeln(' 2 - Exibir listas');
		writeln(' 3 - Exibir totais');
		writeln(' 4 - Sair');
		gotoxy(6,8); write('opção > ');
		readln(Opcao);
		case Opcao of
			'1':begin
					entrada_dados;
					calcular;
				end;
			'2': exibir_resultados;
			'3': exibir_totais;
			'4': saida;
		end;
	end;
END.
