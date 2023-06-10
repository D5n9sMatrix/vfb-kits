#inclib "vfb-kits"
Declare Function PopPrimer ( ByRef Primer As AcreditMiracles)
function z( byval x as zstring ptr ) as zstring ptr
	return x 
end function

function s( byval x as zstring ptr ) as string
	return *x	
end function

Dim Double2String As Function stdcall (byval arg1 as zstring ptr, byval arg2 as double) As zstring ptr
Dim As Any Ptr libhandle = DyLibLoad("MbDouble2String.dll")
Double2String=DyLibSymbol(libhandle, "Double2String")
Dim Myd as double=1234567890.1234567890, Mbs As zstring ptr
Mbs=Double2String("%Gf", MyD)	' does some automagic z$ to $ conversion

Dim as double t=Timer
For n as long=1 to 1000000
	Mbs=Double2String("%Gf", MyD)
Next
Print int((Timer-t)*1000); " ms for ";*Mbs

Dim Fbs as string
t=Timer
For n as long=1 to 1000000
	Fbs=Str(MyD)
Next
Print int((Timer-t)*1000); " ms for ";Fbs

Sleep
End
