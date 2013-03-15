Program media_laco ;

var

nota, media, saldo: real;
qtdnotas: integer;
continua: boolean;

 Begin
 clrscr;{apaga a tela}
 continua:=true; media:=0.0; saldo:=0.0; nota:=0.0; qtdnotas:=1;
 while (continua=true) do
 	 begin
	 write ('Digite o valor da nota ', qtdnotas,' :');
	 readln (nota) ;
 	 qtdnotas:=(qtdnotas+1);
 	 saldo:=(saldo+nota);
 	 media:=(saldo/qtdnotas);
 	 write ('Deseja continuar? true ou false: ');
 	 readln (continua);
 end;
 
 write ('O valor da média é: ',media:4:2);
 
 End.
