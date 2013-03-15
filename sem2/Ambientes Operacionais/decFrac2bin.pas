{
   decFrac2bin.pas
   
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


program sem título;

uses crt, sysutils;
var i, limite : byte;
	dec, partFrac, partFrac_orig, temp : real;
	partFrac_bin : array[0..22] of integer;
const lim = 23;

//pede o número a ser transformado
procedure pedeNum;
begin
	Write ('Digite um número com parte decimal ');
	readln(dec);
	partFrac = Frac(dec);
end;	

// convert binário de array para string
function bin_str(binario:array of integer; tam_bin:byte):string;
var i : byte;
var str : string;

	begin
		i := 0;
		str := '';
		
		while i <= tam_bin do
			begin
				str := str + IntToStr(binario[i]);
				i := i + 1;
			end;
	bin_str := str;
	end;
	
BEGIN
	pedeNum;
	
	i := 0;
	
	while partFrac <> 0 or i <= limite do
	begin
		temp := partFrac * 2;
		partFrac_bin[i] = Int(temp);
		partFrac = Frac(temp);
	end;


	
	
	
	
END.

