{
  Ambientes Operacionais - FATEC SP - Outubro 2012
  Kemel Zaidan
  Tayssa Teixeira

  Conversor Numeros decimais <==> Binarios (IEEE 754)
}
program converter;
uses crt;

{trata a parte inteira do numero real}
function db_int (var decimal: integer): string;

var
	valbin: string;
	pin, y, x, i: integer;
BEGIN

  	pin:= trunc (valdec);
	valbin := '';

	if pin>0 then
	begin
		x := trunc(ln(pin)/ln(2));

		for i:= x downto 0 do
		{verifica se a parte inteira e maior que potencia de 2 e atribui 0 ou 1}
		begin
		y := trunc(exp(ln(2)*i));
		if pin >= y then
		begin
			valbin := concat(valbin, '1');
			pin := pin - y;
		end
		else
		begin
			valbin:= concat(valbin,'0');
		end;
	end;
	end;
	db_int:=valbin
END;


function db_dec (var valdec: real; sz: integer): string;
{trata a parte decimal do numero real}
var
	valbin: string;
	pde, y: real;
	i: integer;
begin
	pde:= valdec - trunc(valdec);
	y:= pde;
	for i:= 1 to (23-sz) do
	{verifica se a parte decimal é maior que potencia de -2 e atribui 0 ou 1}
	begin
		y:= y * 2;
		if y>= 1 then
		begin
			valbin:= concat(valbin,'1');
			y:= y-1;
		end
		else
			valbin:=concat(valbin,'0');
	end;
	db_dec:= valbin;
end;


function dec2ieee (var valdec: real) : string;
{trasforma o numero real em binario no padrao ieee 754}
var
	pde: real;
	pin, y: integer;
	valbin: string;

begin
    pin:= trunc(valdec);
	if pin>1 then valbin := db_int(pin);
	dec2ieee:= valbin;
	
	y := length (valbin);
	pde:= valdec - pin;
	valbin:= db_dec(pde, length (valbin));
	dec2ieee := concat(dec2ieee(valdec), ',', valbin);
	writeln(dec2ieee(valdec));
end;

function bin2dec (var valbin: string): real;
{transforma um valor em binario para decimal}
begin
     readkey;
end;


var
   valbin : string[8];
   valdec : real;
   t : byte;

begin
     clrscr;
     writeln ('===============conversao de numeros decimal <==> binario ieee 754=============\n');
     writeln;
     writeln ('informe o tipo de convesao: 1: decimal --> binario ');
     writeln ('                            2: binario --> decimal ');
     writeln ('                            0: sair');
     readln (t);
     while ((t<>1) and (t<>2) and (t<>0)) do
     begin
          writeln ('tipo invalido, informe 1,2 ou 0');
          read(t);
     end;

     case t of
          1: begin
            write ('informe um numero decimal positivo para conversao: ');
            readln (valdec);
			while valdec<0 do
			begin
				writeln ('valor invalido, informe um numero positivo:');
				readln (valdec);
			end;
            writeln (dec2ieee (valdec));
            end;
          2:begin
             end;
     end;
     writeln ('============================ fim =========================');
     readkey;
end.
