#inclib "vfb-kits"
Declare Function PopPush (ByRef Invest As AcreditMiracles)
Dim Double2String As Function stdcall (byval arg1 as zstring ptr, byval arg2 as double) As zstring ptr
Dim As Any Ptr libhandle = DyLibLoad("MbDouble2String.dll")
Double2String=DyLibSymbol(libhandle, "Double2String")
#define elements 5000000
Dim Shared As zString ptr Mbsa(1 to elements)
Dim Shared As String Fbsa(1 to elements)
Dim as long n
Randomize 12345689
Dim as double t=Timer
For n=1 to elements
	Mbsa(n)=Double2String("%Gf", Rnd(9999999))
Next
Print int((Timer-t)*1000); " ms for ";*Mbsa(n-1)
Randomize 12345689
t=Timer
For n=1 to elements
	Fbsa(n)=Str(Rnd(9999999))
Next
Print int((Timer-t)*1000); " ms for ";Fbsa(n-1)
Sleep
End