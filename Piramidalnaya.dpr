program Pyramidka;

{$APPTYPE CONSOLE}

uses
SysUtils;

type
arr = array [1..100000000] of integer ;



var
vhpr: arr;
n, i: Integer;
file1, file2: TextFile;
Vremja: TDateTime;
Chasy, Minuty, Secundy, MilliSecundy: word;
SummaVremeni: double;

procedure HeapSort(N: integer);
procedure sift(L,R: integer);
var
i,j: integer;
x:
integer;
begin
i:=L;
j:=2*i;
x:=vhpr[i];
if (j<R) and (vhpr[j]<vhpr[j+1]) then
j:=j+1;
while (j<=R) and (x<vhpr[j]) do
begin
vhpr[i]:=vhpr[j];
i:=j;
j:=2*j;
if (j<R) and (vhpr[j]<vhpr[j+1]) then
j:=j+1;
end;
vhpr[i]:=x;
end;

var
L,R: integer;
x:integer;
begin
L:=(N div 2)+1;
R:=N;
while L>1 do
begin
L:=L-1;
sift(L,R);
end;
while R>1 do
begin
x:=vhpr[1];
vhpr[1]:=vhpr[R];
vhpr[R]:=x;
R:=R-1;
sift(L,R);
end;
end;

begin
AssignFile(file1, ParamStr(1));
Reset(file1);
AssignFile(file2, ParamStr(2));
Rewrite(file2);
read(file1, n);
for i:= 1 to n do
read(file1, vhpr[i]);
Vremja:= Now;
HeapSort(n);
Vremja:= Now-Vremja;
DecodeTime(Vremja, Chasy, Minuty, Secundy, MilliSecundy);
SummaVremeni:= MilliSecundy/1000 + Secundy + 60*Minuty + 3600*Chasy;
writeln(file2, n);
for i:= 1 to n-1 do
write(file2, vhpr[i], ' ');
writeln(file2, vhpr[n]);
Write(file2, 'Пирамидальная');
writeln(file2);
Writeln(file2, floattostr(SummaVremeni));
Writeln(file2);
CloseFile(file1);
CloseFile(file2);
end.
