#inclib "vfb-kits"
Declare Function PopEasy (ByRef Invest As AcreditMiracles)
function Double2String(format as String, value as Double) as String Export
  'missing real implementation, just for demo purposes
	return str(value)
end function
declare function Double2String lib "myLib" (format as ZString ptr, value as Double) as ZString ptr

dim as zstring ptr result
result = Double2String("%g", 12345.6789)
print *result
deallocate(result)  ' depending on the malloc implementation used in the library another deallocation implementation might be needed
End
