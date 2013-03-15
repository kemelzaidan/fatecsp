{ Proposta de menu
	1.Ler Dados
	2.Processar
	3.Exibir
	4.Sair}
program menu_equa;

uses crt;
var a, b,c, delta, x1, x2 : real;
	messagem : string;

BEGIN
ClrScr;
{ 1 - Entração da de Dados }
gotoxy(8,5); write('*** Menu da Equação de Segundo Grau ***');

gotoxy(8,8); write('Digite a A:'); read(a);
gotoxy(8,9); write('Digite a B:'); read(b);
gotoxy(8,10); write('Digite a C:'); read(c);

{ procesamentos/calculos }
 if ( a = 0 ) then
		messagem := 'Não é uma equação!'
	else
		delta:=b*b -4*a*c;
			if (delta < 0) then
				messagem := 'Sem solução'
			else
			 begin
			  if (delta = 0) then
				messagem := 'duas raizes reais e iguais';
				
				x1:=(-b+SqrT(delta))/2*a);
				x2:=(-b-SqrT(delta))/(2*a);
			end;
 end;
 
 {exibição de resultados}
 if (a <> 0) then

	if (delta >= 0) then
		begin
		 writeln('Delta:', delta:4:2);
		 writeln('Análise:', messagem);
		 writeln('x1:', delta:4:2);
		 writeln('x2:', delta:4:2);
		end
	else
		begin
		 writeln('Delta:', delta:4:2);
		 writeln('Análise:', messagem);
		end
else
 writeln('Analise:', messagem);
END.
