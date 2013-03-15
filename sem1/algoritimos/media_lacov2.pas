Program media_laco ;

var

nota, media, saldo, continua: real;
qtdnotas: integer;

 Begin
 //clrscr;{apaga a tela}
 continua:=1; qtdnotas:=1; media:=0.0; saldo:=0.0; nota:=0.0; 
 while (continua<>0) do
 	 begin
	 write ('Digite o valor da nota ', qtdnotas,' :');
	 readln (nota) ;
 	 qtdnotas:=(qtdnotas+1);
 	 saldo:=(saldo+nota);
 	 write ('Digite o valor da nota ', qtdnotas,' ou 0 para sair: ');
 	 readln (continua);
 	 	if (continua<>0) then
		begin
		nota:=continua;
		qtdnotas:=qtdnotas+1;
		saldo:=(saldo+nota);
		end
		else
		continua:=0;
		end;
      media:=(saldo/qtdnotas);
 writeln ('Foram lidas ', qtdnotas,' notas e o valor da média é: ',media:4:2);
 
 End.
