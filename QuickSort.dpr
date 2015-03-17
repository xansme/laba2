program quick;

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

procedure sort(L,R: integer);
var
i,j: integer;
w,x: integer;
begin
i:=L;
j:=R;
x:=vhpr[(L+R) div 2];
REPEAT
while vhpr[i]<x do
i:=i+1;
while x<vhpr[j] do
j:=j-1;
if i<=j then
begin
w:=vhpr[i];
vhpr[i]:=vhpr[j];
vhpr[j]:=w;
i:=i+1;
j:=j-1;
end;
UNTIL i>j;
if L<j then
sort(L,j);
if i<R then
sort(i,R);
end;
procedure QuickSort;
begin
sort(1,N);
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
QuickSort;
Vremja:= Now-Vremja;
DecodeTime(Vremja, Chasy, Minuty, Secundy, MilliSecundy);
SummaVremeni:= MilliSecundy/1000 + Secundy + 60*Minuty + 3600*Chasy;
writeln(file2, n);
for i:= 1 to n-1 do
write(file2, vhpr[i], ' ');
writeln(file2, vhpr[n]);
Write(file2, 'Бытрая');
writeln(file2);
Writeln(file2, floattostr(SummaVremeni));
Writeln(file2);
CloseFile(file1);
CloseFile(file2);
end.
