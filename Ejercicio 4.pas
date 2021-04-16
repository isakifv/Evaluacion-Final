program ejercicio4;
uses crt;
Var
archivo:text;
Begin
	Assign(archivo, 'archivo.txt');
	ReWrite(archivo);
	WriteLn(archivo, 'Hola mundo');
	close(archivo);
end.
//lineas restantes---------------------------
//reset(archivo);
//eof(archivo);
//WriteLn(archivo, 'Hola mundo');