{
        teste_array.pas
        
        Copyright 2010 Kemel Zaidan <kemel@arrelia>
        
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


program teste_array;

uses crt;
var i : byte;
	media, soma : real;
	valor : array[1..10] of real;

BEGIN
	i:=1;
	soma:=0;
	media:=0; 
	for i:=1 to 10 do
		begin	
			write('Digite o valor do índice ', i,': ');
			readln(valor[i]);
		end;
	{valor[1]:=2.5;
	valor[2]:=3.5;
	valor[3]:=4.5;
	valor[4]:=5.5;
	valor[5]:=6.5;
	valor[6]:=7.5;
	valor[7]:=8.5;
	valor[8]:=9.5;
	valor[9]:=10.5;
	valor[10]:=11.5;}
	
	for i:=1 to 10 do
		begin
		writeln('O valor do item ', i,' é: ', valor[i]:4:2);
		soma:=(soma+valor[i]);
		end;
	media:=soma/i;
	write('A média do array é: ', media:4:2);
		
END.
