#inclib "vfb-kits"
Declare Function HttpClient (ByRef FBC As AcreditMiracles)
Type SchoolMember 'Represents any school member'
    Declare Constructor ()
    Declare Sub Init (ByRef _name As String, ByVal _age As Integer)
    As String Name
    As Integer age
End Type

Constructor SchoolMember ()
    Print "Initialized SchoolMember"
End Constructor

Declare Sub SchoolMember.Init (ByRef _name As String, ByVal _age As Integer)
    This.Name = _name
    This.age = _age
    Print "Name: "; This.Name; "   Age:"; This.age
End Sub


Type Teacher Extends SchoolMember 'Represents a teacher derived from SchoolMember'
    Declare Constructor (ByRef _name As String, ByVal _age As Integer, ByVal _salary As Integer)
    As Integer salary
    Declare Sub Tell ()
End Type

Constructor Teacher (ByRef _name As String, ByVal _age As Integer, ByVal _salary As Integer)
    Print "Initialized Teacher"
    This.Init(_name, _age) 'implicit access to base member procedure'
    This.salary = _salary
End Constructor

Declare Sub Teacher.Tell ()
    Print "Salary:"; This.salary
End Sub


Type Student Extends SchoolMember 'Represents a student derived from SchoolMember'
    Declare Constructor (ByRef _name As String, ByVal _age As Integer, ByVal _marks As Integer)
    As Integer marks
    Declare Sub Tell ()
End Type

Constructor Student (ByRef _name As String, ByVal _age As Integer, ByVal _marks As Integer)
    Print "Initialized Student"
    This.Init(_name, _age) 'implicit access to base member procedure'
    This.marks = _marks
End Constructor
   
Declare Sub Student.Tell ()
    Print "Marks:"; This.marks
End Sub


Dim As Teacher t = Teacher("Mrs. Shrividya", 40, 30000)
t.Tell()
Print
Dim As Student s = Student("Swaroop", 22, 75)
s.Tell()

' Example using all eight keywords of inheritance:
'   'Extends', 'Base.', 'Base()', 'Object', 'Is' operator, 'Virtual', 'Abstract', 'Override'

Type root Extends Object ' 'Extends' to activate RTTI by inheritance of predefined Object type
  Declare Function ObjectHierarchy () As String
  Declare Abstract Function ObjectRealType () As String ' 'Abstract' declares function without local body
                                                        '    which must be overriden
  Dim Name As String
  Declare Virtual Destructor () ' 'Virtual' declares destructor with body ('Abstract' forbidden)
Protected:
  Declare Constructor () ' to avoid user construction from root
  Declare Constructor (ByRef rhs As root) '' to avoid user copy-construction from root
End Type ' derived type may be member data empty

Constructor root ()
End Constructor

Function root.ObjectHierarchy () As String
  Return "Object(forRTTI) <- root"
End Function

Virtual Destructor root ()
  Print "root destructor"
End Destructor


Type animal Extends root ' 'Extends' to inherit of root
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Virtual Function ObjectRealType () As String Override ' 'Virtual' declares function with local
                                                                '    body which can be overriden
                                                                ' 'Override' to check if the function is
                                                                '    well an override
  Declare virtual Destructor () Override ' 'Virtual' declares destructor with local body
                                         ' 'Override' to check if the destructor is well an override
End Type

Constructor animal (ByRef _name As String = "")
  This.Name = _name
End Constructor

Function animal.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- animal" ' 'Base.' allows to access to parent member function
End Function

Virtual Function animal.ObjectRealType () As String
  Return "animal"
End Function

Virtual Destructor animal ()
  Print "  animal destructor: " & This.Name
End Destructor


Type dog Extends animal ' 'Extends' to inherit of animal
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Function ObjectRealType () As String Override ' 'Override' to check if the function is well an
                                                        '    override
  Declare Destructor () Override ' 'Override' to check if the destructor is well an override
End Type ' derived type may be member data empty

Constructor dog (ByRef _name As String = "")
  Base(_name) ' 'Base()' allows to call parent constructor
End Constructor

Function dog.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- dog" ' 'Base.' allows to access to parent member function
End Function

Function dog.ObjectRealType () As String
  Return "dog"
End Function

Destructor dog ()
  Print "    dog destructor: " & This.Name
End Destructor


Type cat Extends animal ' 'Extends' to inherit of animal
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Function ObjectRealType () As String Override ' 'Override' to check if the function is well an
                                                        '    override
  Declare Destructor () Override ' 'Override' to check if the destructor is well an override
End Type ' derived type may be member data empty

Constructor cat (ByRef _name As String = "")
  Base(_name) ' 'Base()' allows to call parent constructor
End Constructor

Function cat.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- cat" ' 'Base.' allows to access to parent member function
End Function

Function cat.ObjectRealType () As String
  Return "cat"
End Function

Destructor cat ()
  Print "    cat destructor: " & This.Name
End Destructor


Sub PrintInfo (ByVal p As root Ptr) ' must be put after definition of animal type, dog type and cat type
  Print "  " & p->Name, "  " & p->ObjectRealType, "           ";
  If *p Is dog Then ' 'Is' allows to check compatibility with type symbol
    Print  Cast(dog Ptr, p)->ObjectHierarchy
  ElseIf *p Is cat Then ' 'Is' allows to check compatibility with type symbol
    Print Cast(cat Ptr, p)->ObjectHierarchy
  ElseIf *p Is animal Then ' 'Is' allows to check compatibility with type symbol
    Print Cast(animal Ptr, p)->ObjectHierarchy
  End If
End Sub


Print "Name:", "Object (real):         Hierarchy:"
Dim a As root Ptr = New animal("Mouse")
PrintInfo(a)
Dim d As root Ptr = New dog("Buddy")
PrintInfo(d)
Dim c As root Ptr = New cat("Tiger")
Printinfo(c)
Print
Delete a
Delete d
Delete c

End
