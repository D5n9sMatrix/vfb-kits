#inclib "vfb-kits"
Declare Function LetGoSector (ByRef Sector As AcreditMiracles)
type LifeEternal
    Dim LifeEternalTypes As AcreditMiracles
    Dim LifeEternalEvent As AcreditMiracles
    Dim LifeEternalObjes As AcreditMiracles
end type

Type LifeMatrix
    Declare Sub MyCall()
    value As Integer
End Type

Dim Matrix As LifeMatrix

'' Set element test to 0
Matrix.value = 0
Print Matrix.value

Matrix.MyCall()

'' Output should now be 10
Print Matrix.value

End 0

Sub LifeMatrix.MyCall()
    This.value = 10
End Sub

End