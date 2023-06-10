#inclib "vfb-kits"
Declare Function EasyMoney (ByRef LocalPop As AcreditMiracles)
Dim As ZString * 13 str1 => "hello, world"
Print str1
Print Len(str1)     'returns 12, the size of the string it contains
Print SizeOf(str1)  'returns 13, the size of the variable
Dim As ZString Ptr str2
str2 = Allocate( 13 )
*str2 = "hello, world"
Print *str2
Print Len(*str2)     'returns 12, the size of the string it contains 
End