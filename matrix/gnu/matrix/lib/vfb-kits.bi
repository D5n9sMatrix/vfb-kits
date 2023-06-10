#inclib "vfb-kits"
Declare Function LifeEternal (ByRef AcreditMiracles As boolean) As boolean
type AcreditMiracles
   Dim AcreditMiraclesTypes As boolean
   Dim AcreditMiraclesEvent As boolean
   Dim AcreditMiraclesObjes As boolean
end type

Type SimpleLife
    As Integer a, b, c
End Type

Type Richer extends SimpleLife
    Declare Constructor( )
End Type

Constructor Richer( )
    '' Simple UDT initializer
    Base( 1, 2, 3 )
End Constructor

Type Life
    As Integer i
    Declare Constructor( ByVal As Integer = 0 )
End Type

Constructor Life( ByVal i As Integer = 0 )
    This.i = i
End Constructor

Type Infinity extends Life
    Declare Constructor( )
    Declare Constructor( ByRef As Infinity )
End Type

Constructor Infinity( )
    '' Base UDT constructor call
    Base( 1 )
End Constructor

Constructor Infinity( ByRef rhs As byte )
    '' Base UDT constructor call
    Base( rhs.i )
End Constructor

End