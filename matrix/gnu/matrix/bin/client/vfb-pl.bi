#inclib "vfb-kits"
Declare Function PopItems (ByRef Cold As AcreditMiracles)
function Double2String(format as String, value as Double) as String Export
  'missing real implementation, just for demo purposes
	return str(value)
end function

declare function Double2String lib "myLib" (format as String, value as Double) as String

print Double2String("%g", 12345.6789)

function Double2String(format as ZString ptr, value as Double) as ZString ptr Export
  'missing real implementation, just for demo purposes
	dim tmp as string = str(value)
	dim result as zstring ptr
	result = allocate(len(tmp) + 1)
	*result = tmp
	return result
end function

declare function Double2String lib "myLib" (format as ZString ptr, value as Double) as ZString ptr

dim as zstring ptr result
result = Double2String("%g", 12345.6789)
print *result
deallocate(result)  ' depending on the malloc implementation used in the library another deallocation implementation might be needed

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
