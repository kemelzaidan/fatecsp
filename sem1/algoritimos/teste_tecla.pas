program teste_tecla;

uses crt;

BEGIN
	writeln('pressione uma tecla');
	if ( readkey = chr(13)) then
		writeln('vc pressionou enter');
	
	if ( readkey = chr(27)) then
		writeln('vc pressionou esc');
	
END.
