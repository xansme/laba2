program Programmpiromidka;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 1000000;

type
  arr = array [1..P] of Integer;

var
  a: arr;
  h: boolean;
  n, i: Integer ;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
  name1, name2: string[80];
  otvet: Char;

procedure WriteMas(n: integer);
var i: integer;
begin
  for i := 1 to n do
    write(a[i], ' ');
  writeln;
  writeln;
end;


procedure HeapSort(N: integer);
procedure sift(L,R: integer);
var
i,j: integer;
x:
integer;
begin
i:=L;
j:=2*i;
x:=a[i];
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
while (j<=R) and (x<a[j]) do
begin
a[i]:=a[j];
i:=j;
j:=2*j;
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
end;
a[i]:=x;
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
x:=a[1];
a[1]:=a[R];
a[R]:=x;
R:=R-1;
sift(L,R);
end;
end;

begin
  begin
    write('Please, enter the name of input file: ');
    Readln(name1);
    AssignFile(f1,name1);
    {$I-}
    Reset(f1);
    {$I+};
    If ioresult=2 then
    begin
    Writeln('Sorry, but you file not found...');
    readln;
    end
    else
    begin
      write('Please, enter the name of output file: ');
      readln(name2);
      AssignFile(f2, name2);
      Rewrite(f2);
      read(f1, n);
      for i:= 1 to n do
      read(f1, a[i]);

    writeln;
    end;
      begin
      time:= Now;
      Heapsort(n);
      Time:= Now-time;
      Writeln('Sorting is over.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, a[i], ' ');
      writeln(f2, a[n]);
    Write(f2, 'Пирамидальная');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln;
    CloseFile(f1);
    CloseFile(f2);
    Readln;
  { TODO -oUser -cConsole Main : Insert code here }
  end;
end.
