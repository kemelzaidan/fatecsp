{
   iee754.pas
   
   Copyright 2012 Kemel <kemel@piolin>
   
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


program ieee754;

uses crt;
var i, tam_bin, tam_bin_int, tam_bin_frac, tam_bin_exp : byte;
	num, part_inteira, part_fracionaria, exp_dec : real;
	bin_ieee, mantissa, bin_exp, bin_int, bin_frac : array[0..31] of ShortInt;
	

procedure get_num();
begin
//recebe número a ser convertido
	write('Digite o número a ser convertido: ');
	readln(num);
	part_inteira := Int(num);
	part_fracionaria := Frac(num);
end;

//determina o primeiro bit do número na versão ieee
procedure sinal_ieee();
begin
	if (num >= 0) then
		bin_ieee[0] := 0
	else
		bin_ieee[0] := 1;
	i := i + 1;
end;

//converte decimal inteira em binário e guarda num array
procedure dec_int2bin(var dec : real; var binario : array of ShortInt; var tam_bin : byte);
var bit : real;
	i : byte;
	
	
	begin
		bit := 65536;
		i := 0;

//encontra o bit inicial		
		if (bit > dec) then
		repeat
			bit := bit / 2;
		until bit <= dec;
//converte para binário e salva em um vetor
		while (bit >= 1) do
			begin
				if (dec >= bit) then
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
	end;

//converte a parte fracionária em binário
procedure frac2bin(var dec : real; var binario : array of ShortInt; var tam_bin : byte);
 
var i : byte;
	part_frac : real;
	
begin
i := 0;
part_frac := Frac(dec);

	if (part_frac = 0) then
	begin
		bin_frac[i] := 0;
		i := i + 1;
	end
	else
	begin
		while (part_frac <> 0) or (i = 31) do
		begin
					part_frac := part_frac*2;
					binario[i] := trunc(part_frac);
					part_frac := frac(part_frac);
					i := i + 1;
		end;
	end;
	tam_bin_frac := i-1;
end;

//exibe o número binário do array
procedure exibe_bin(var array_bin : array of ShortInt; var tam_bin : byte);
var i : byte;
begin
	for i :=0 to tam_bin do
		write(array_bin[i]);
end;	

procedure calculo_expoente();
var expoente : byte;
	exp_dec : real;
const bias = 127;

begin
	expoente := tam_bin_int - 1;
	exp_dec := expoente + bias;
	dec_int2bin(exp_dec, bin_exp, tam_bin_exp);
end;


//exibe os resultados da conversão decimal para ieee
procedure exibe_dec2ieee();
begin
	writeln('A parte inteira do número é: ', part_inteira:6:0);
	write('A parte inteira convertida em binário é: ');
	exibe_bin(bin_int, tam_bin_int);
	writeln;
	writeln('A parte fracionária do número é: ', part_fracionaria:0:6);
	write('A parte frac. convertida em binário é: ');
	exibe_bin(bin_frac, tam_bin_frac);
	writeln;
	write('O número ', num, ' em binário é :');
	if (tam_bin_frac = 0) then 
		exibe_bin(bin_int, tam_bin_int)
		else
		begin
			exibe_bin(bin_int, tam_bin_int);
			exibe_bin(bin_frac, tam_bin_frac);
		end;
	writeln;
	writeln('O expoente em decimal é: ', exp_dec);
	write('O expoente em binário é: ');
	exibe_bin(bin_exp, tam_bin_exp);
end;

BEGIN

get_num;
dec_int2bin(num, bin_int, tam_bin_int);
frac2bin(num, bin_frac, tam_bin_frac);
calculo_expoente();
exibe_dec2ieee();
	
END.
