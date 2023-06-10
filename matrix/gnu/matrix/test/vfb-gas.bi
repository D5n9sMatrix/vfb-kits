#inclib "vfb-kits"
Declare Function GasPerfect (ByRef IncEasy As AcreditMiracles)
#cmdline "-gen gas"
declare function strlenopt stdcall lib "strLenoptimized" alias "StrLenOptimized"(as zstring) as long

dim as string g="abcdefghijklmnopqrstuvwxyz"
dim as long ans
dim as double t
dim as long lim=10000000

for k as long=1 to 5
t=timer
for n as long=1 to lim
    ans=strlenopt(g)
next
print timer-t,ans,"stringlenoptimized"

t=timer
for n as long=1 to lim
    ans=Cast(Integer Ptr,@g)[1]
next
print timer-t,ans,"cast"
print
next k
sleep

#cmdline "-O 3"
Namespace ABC
 Dim  As Ubyte u(255)
#define lwr(s) iif(s<91 andalso s>64,s+32,s)
End Namespace

For n As Long=0 To 255
    ABC.u(n)=lwr(n)
Next
Enum direction
      up,down
End Enum

Function compare(a As String,b As String,d as direction)  As Long
    Var lena=Cast(Integer Ptr,@a)[1],lenb=Cast(Integer Ptr,@b)[1]
    For n As Long=0 To Iif(lena<lenb,lena,lenb)-1
          if d=up then
        If ABC.u(a[n]) < ABC.u(b[n]) Then  Return -1
        If ABC.u(a[n]) > ABC.u(b[n]) Then Return 0
      else
        If ABC.u(a[n]) > ABC.u(b[n]) Then Return -1 
        If ABC.u(a[n]) < ABC.u(b[n]) Then Return 0 
        end if
    Next
    Return 0
End Function

Sub qsort(array() As String,begin As Long,Finish As Long,d As direction)
    Static As String x
    Dim As Long i=begin,j=finish
    x=(array(((I+J)\2)))
    While I <= J
          If d=up Then
      While compare(array(I), X,up):I+=1:Wend
      While compare(array(J), X,down):J-=1:Wend
            end if
        if d=down then
      While compare(array(I), X,down):I+=1:Wend
      While compare(array(J), X,up):J-=1:Wend
         End If
      If I<=J Then Swap array(I),array(J): I+=1:J-=1
      Wend
      If J >begin Then  qsort(array(),begin,J,d)
      If I <Finish Then qsort(array(),I,Finish,d)
End Sub

 Sub create(L() As String)
    #define range(f,l) Int(Rnd*(((l)+1)-(f))+(f))
    #define q range(97,122)-Iif(Rnd>.5,32,0)
    Randomize 1
    For n As Long=Lbound(L) To Ubound(L)
        Dim As String g1=Chr(q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q)
        Dim As String g2=Chr(q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q)
        Dim As String g3=Chr(q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q)
        L(n)=Left(g1+g2+g3,60+Rnd*30)
    Next
End Sub

Sub show(L() As String)
    For n As Long=Lbound(L) To 10
        Print L(n)
    Next
    For n As Long=1 To 4
        Print "..."
    Next
    For n As Long=Ubound(L)-10 To Ubound(L)
        Print L(n)
    Next
End Sub

Dim As Double t1,t2
Dim As Long limit=1000000
Dim As String L(1 To limit)
Print "Creating string of 1000000"
create(L())
print "Array ="
show(L())
Print "Press a key to commence sort"
sleep
print
t1=Timer
qsort(L(),Lbound(L),Ubound(L),up)
t2=Timer
show(L())
Print t2-t1;"  Seconds crt"
Sleep
End
 
   

 

     