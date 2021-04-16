Program ejercicio1;
Uses crt;

Const
  limit_id = 30;
Type
  reporte = Record
    id: Integer;
    titulo: String;
    categoria: String;
    contenido: String;
    fecha: String;
    status: Boolean;
  End;
  ids_arr = Array [1..limit_id] Of Integer;
Var
  rep: reporte;
  ids: ids_arr;
  t: Text;
Procedure init_array(Var a:Array Of Integer);
Var
  i: Integer;
Begin
  i := 1;
  Repeat
    a[i] := 0;
    i := i+1;
  Until (i<=limit_id);
End;
Function ob_poscvac(a:Array Of Integer): Integer;
Var
  posc,i: Integer;
Begin
  i := 1;
  Repeat
    If (a[i]=0) Then ob_poscvac := i;
  Until (i<=limit_id);
End;

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
      FileExist := False;
    End
  Else
    FileExist := True;
End;
Function dirExist (nombre:String): Boolean;
Begin
 {$I-}
  Mkdir(nombre);
 {$I+}
  If (Ioresult=0) Then
    Begin
      Rmdir(nombre);
      dirExist := False;
    End
  Else
    dirExist := True;
End;
Procedure save_rep(rep:reporte; Var f:Text);
Begin
  Write(f, 'id: ');
  Writeln(f, rep.id);
  Write(f, 'Titulo: ');
  Writeln(f, rep.titulo);
  Write(f, 'Categoría: ');
  Writeln(f, rep.categoria);
  Write(f, 'Contenido: ');
  Writeln(f, rep.contenido);
  Write(f, 'Fecha: ');
  Writeln(f, rep.fecha);
  Write(f, 'Status: ');
  Writeln(f, rep.status);
End;
Procedure read_rep(Var rep:reporte);
Var
  temp: Integer;
  x: String;
  y: String;
Begin
  GetDir(0,y);
  Writeln('Introduzca los siguientes valores');
  Writeln('Categoría: ');
  Readln(rep.categoria);
  If dirExist(rep.categoria)=True Then
    Begin
      ChDir(rep.categoria);
      Writeln('id: ');
      Repeat
        Readln(rep.id);
        Str(rep.id,x);
        Insert('.txt',x,(Length(x)+1));
        If fileExist(x)=False Then Writeln('Ya existe un reporte con ese ID.');
      Until (fileExist(x)=True);
      ChDir(y);
    End
  Else
    Begin
      Writeln('id: ');
      Readln(rep.id);
    End;
  Writeln('Titulo: ');
  Readln(rep.titulo);
  Writeln('Contenido: ');
  Readln(rep.contenido);
  Writeln('Fecha: ');
  Readln(rep.fecha);
  Writeln('Status: ');
  Repeat
    Writeln('1:true, 0: false.');
    temp := 0;
    Read(temp);
    If ((temp=1)Or(temp=0)) Then
      Case temp Of
        1: rep.status := True;
        0: rep.status := False;
      End
    Else Writeln('Valor inválido.');
  Until ((temp=1)Or(temp=0));
End;
Procedure menu_p;
Var
  temp: String;
Begin
  Writeln('Creación de nuevo registro.');
  read_rep(rep);
  If dirExist(rep.categoria)=False Then
    Begin
      Mkdir(rep.categoria);
      ChDir(rep.categoria);
    End
  Else
    Begin
      ChDir(rep.categoria);
    End;
  Str(rep.id,temp);
  Insert('.txt',temp,(Length(temp)+1));
  If fileExist(temp)=True Then
    Begin
      Assign(t,temp);
      Rewrite(t);
      save_rep(rep,t);
      Writeln('Reporte registrado exitosamente.');
      Close(t);
    End
  Else
    Writeln('Ya existe un Archivo con ese Id.');
End;
Begin
  menu_p;
End.
