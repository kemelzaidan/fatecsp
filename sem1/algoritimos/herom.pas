{
        herom.pas
        
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


program herom;

uses crt;
var ar, ba, la, lb, lc, sp : real;
	tp : string;
	
	function eh_triangulo (la, lb, lc:real):boolean;
		begin
			if (a>b+c) or (b>a+c) or (c>a+b) then eh_triangulo := false
			else
			eh_triangulo := true;
		end;
		
	function get_lc : real;
	var c : real;
	begin
	writeln ('Lado C: ') ; read(c);
	get_lc:=c;
	end;
	
	function get_lb : real;
	var b : real;
	begin
	writeln ('Lado B: ') ; read(b);
	get_lb:=b;
	end;
	
	function get_la : real;
	var a : real;
	begin
	writeln ('Lado A: ') ; read(a);
	get_la:=a;
	end;
	
	function get_sp (a, b, c, sp:real) : real;
		begin
			get_sp :+ (a+b+c)2;
		end;

	function get_area(a, b, c, sp:real) : real;
		begin
			get_area := sqrt	(sp*(sp-a)*(sp-b)*(sp-c));
		end;
		
	function get_altura(ar, ba:real):real;
		begin
			get_altura := 2 * ar / ba;
		end;
	
	function get_base (tp:string;a,b,c:real):real;
		begin
			if (tp='equilatero') then
				get_base:a;
				
			if (tp='isoceles') then
				if (a=b) then
					get_base := c
				else if (a=c) then
					get_base:=b
				else
					get_base:=a;
					
			if (tp='ecaleno') then
				if
	
	function get_tipo(a,b,c:real):string;
		begin
			if (a=b) and (a=c) then
			get_tipo:='equilatero';
			
			else if (a=b and a <>c) or 
			(a=c and a <>b) or
			(b=c and b <>a) then
			get_tipo: 'isoceles';
			
			else
			get_tipo:='escaleno';
		end;
		
		procedure exibir(a,b,c,sp,ar,ba, al:real; tp:string);
		begin
		clrscr;
		writeln('lado A: ', a:4:2);
		writeln('lado B: ', b:4:2);
		writeln('lado C: ', c:4:2);
		writeln('lado Area: ', ar:4:2);
		writeln('lado Semi-perimetro: ', sp:4:2);
		writeln('lado altura: ', al:4:2);
		writeln('lado Base: ', ba:4:2);
		writeln('lado Tipo: ', tp);
		delay(10000);
		writeln('tchauuu tchauuu miauu...');
		end;
		
BEGIN
	//leitura dos lados
	if eh_triangulo = false
		write ('Não é um triângulo');
	else
	begin
	la := get_la;
	lb := get_lb;
	lc := get_lc;
	sp := get_sp (la, lb, lc);
	ar := get_area(la, lb, lc, sp);
	tp := get_tipo(la, lb, lc);
	ba := get_base (tp, la, lb, lc);
	al := get_altura (ar, ba);
	exibir (la, lb, lc, sp, ar, ba, al, tp);
	end;
END.
