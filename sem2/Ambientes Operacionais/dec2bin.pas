{
   dec2bin.pas
   
   Copyright 2012 Kemel Zaidan <kemel@gmail.com>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program dec2bin;

uses crt;
var i, tam_bin : byte;
	dec, dec_orig, bit : real;
	binario : array[0..31] of ShortInt;

//recebe o número decimal
procedure recebe_num();
begin
	Write ('Digite o número decimal: ');
	readln(dec);
	dec_orig := dec;

end;

procedure exibe_bin(var array_bin : array of ShortInt);
begin
	for i :=0 to tam_bin do
		write(array_bin[i]);
end;


BEGIN
recebe_num;

bit := 1024;
i := 0;

//escolhe o bit inicial	
	if bit > dec then
		repeat
			bit := bit / 2;
		until bit <= dec;
//converte para binário e salva em um vetor
	while bit >= 1 do
	begin
		{if (bit = 1) then
			begin
				binario[i] :=0
			end
		else} if (dec >= bit) then
			begin
				dec := dec - bit;
				bit := bit / 2;
				binario[i] := 1;
				i := i +1;
			end
		else
			begin
				bit := bit / 2;
				binario[i] := 0;
				i := i +1;
			end;
//salva o tamanho do array numa variável
		tam_bin := i -1;
		
	end;

	write('O número ', dec_orig:0:0, ' em binario é: ');
	exibe_bin(binario);
	
	
	
	
END.

