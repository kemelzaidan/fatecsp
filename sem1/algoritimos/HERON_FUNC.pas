Program heron;
var
 al, ba, ar, la, lb, lc, sp:real;
 tp:string;

function eh_triangulo(a,b,c:real):
                               boolean;
begin
if (a>= b+c ) or (b>= a+c) or (c>= a+b) then
     eh_triangulo := false
     else 
     eh_triangulo := true;
end;


 
function get_la:real;
var a:real;
begin
writeln('Lado A:');read(a);
get_la:=a;
end;

function get_lb:real;
var a:real;
begin
writeln('Lado B:');read(a);
get_lb:=b;
end;

function get_lc:real;
var a:real;
begin
writeln('Lado C:');read(a);
get_lc:=c;
end;

function get_sp(a,b,c:real):real;
begin
get_sp:=(a+b+c)/2;
end;


function get_area(a,b,c,sp:real):real;
begin
get_area:= sqrt(sp*(sp-a)*(sp-b)
			  *(sp-c));
end;
 
function get_base(tp:string;
               a,b,c:real):real;
begin

 if (tp = 'equilatero') then
     get_base:= a;
 
 if (tp = 'isoceles') then
     if (a=b) then
         get_base := c
     else if (a=c) then
	    get_base:= b
	else 
	    get_base:= a;        
         
if (tp = 'escaleno') then
 if (a > b ) and (a > c) then
      get_base := a
 else if (b > a ) and (b > c) then
      get_base := b
 else 
      get_base := c;

end;

function get_altura(ar, ba:real)
                            :real;
begin
   get_altura:= 2 * ar / ba;
end;
      

function get_tipo(a,b,c:real):string;
begin

if (a=b) and (a=c) then
    get_tipo:= 'equilatero'

else if ( a=b )and (a<>c ) or
        ( a=c )and (a<>b ) or
        ( b=c )and (b<>a ) then
    get_tipo:= 'isoceles'
else
    get_tipo:= 'escaleno';
end;

procedure exibir(a,b,c,sp,ar,ba,al:real;
                 tp:string);
begin
clrscr;
writeln('lado A:', a:4:2);
writeln('lado B:', b:4:2);
writeln('lado C:', c:4:2);
writeln('       Area:', ar:4:2);
writeln('     Semper:', sp:4:2);
writeln('     Altura:', al:4:2);
writeln('       Base:', ba:4:2);
writeln('       Tipo:', tp);
delay(10000);
writeln('thauuu thauuu miauu...')
end;             
                 

Begin
// fazer a leitura
 la := get_la;
 lb := get_lb;
 lc := get_lc;
   
if eh_triangulo(la,lb,lc) =  false then
   begin
     writeln('num eh triangulo...!');
     delay(100);
   end
else
   begin
	 sp:= get_sp(la, lb, lc);
	 ar:= get_area(la,lb,lc,sp);
	 tp:= get_tipo(la,lb,lc);
	 ba:= get_base(tp,la,lb,lc);
	 al:= get_altura(ar, ba);
	 exibir(la,lb,lc,sp,ar,ba,al,tp);
   end;

End.
