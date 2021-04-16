Program fibonnachi;
uses Crt;
Const
	nombre_archivo='Numeros_Fibonachi.txt';
var
	num:Integer;
Function fileExist (nombre:String): Boolean;
Var
  f: Text;
Begin
  Assign(f,nombre);
 {$I-}
  Reset(f);
 {$I+}
  If (Ioresult=0) Then
    Begin
      Close(f);
      FileExist := True;
    End
  Else
    FileExist := False;
End;
Procedure fibbo;
		Var
			a,b,c, acum:integer;
			arg:Boolean;
			numeros:Text;
		Begin
					arg:=True;
					WriteLn('Introduzca la cantidad de números pertenecientes a la serie fibonnachi que desea.');
					Readln(num);
					a:=0;
					b:=1;
					acum:=0;
					Assign(numeros,nombre_archivo);
					if fileexist(nombre_archivo)=true then Reset(numeros);
					ReWrite(numeros);
						Repeat
							c:=a+b;
							WriteLn(numeros, c);
							a:=b;
							b:=c;
							acum:=acum+1;
						until(num=acum);
					Close(numeros);
		End;

		Begin
				fibbo;
				WriteLn('Proceso realizado existosamente. Los números fueron almacenados en el archuvo llamado:', nombre_archivo);
		end.