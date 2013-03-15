Program media ;
var v1,v2,m:real;
Begin
     write ('Digite v1: ');
     read(v1);
     write ('Digite v2: ');
     read (v2);
     m:=(v1+v2)/2;
     if (m<6)then
      begin
      writeln('Desculpe, mas você foi REPROVADO ',m:4:2);
      end
      else
      begin
      writeln('Parabéns! Você foi APROVADO ',m:4:2);
      end
     ;
End.
