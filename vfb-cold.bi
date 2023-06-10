#inclib "vfb-kits"
Declare Function ColdClimatic (ByRef Push As AcreditMiracles)
'' Variable length
Dim a As String

a = "Hello"
Print a

a += ", world!"
Print a

Dim As String b = "Welcome to FreeBASIC"
Print b + "! " + a

'' QB-like $ suffixes
#lang "qb"

'' DIM based on $ suffix
Dim a$
a$ = "Hello"

'' Implicit declaration based on $ suffix
b$ = ", world!"

Print a$ + b$

'' Variable-length strings as buffers

'' Reserving space for a string,
'' using Space() to produce lots of space characters (ASCII 32)
Dim As String mybigstring = Space(1024)
Print "buffer address: &h" & Hex( StrPtr( mybigstring ), 8 ) & ", length: " & Len( mybigstring )

'' Explicitly destroying a string
mybigstring = ""
Print "buffer address: &h" & Hex( StrPtr( mybigstring ), 8 ) & ", length: " & Len( mybigstring )

'' Variable-length string as Const parameter

'' Const qualifier preventing string from being modified
Sub silly_print( ByRef printme As Const String )
    Print ".o0( " & printme & " )0o."
    'next line will cause error if uncommented
    'printme = "silly printed"
End Sub

Dim As String status = "OK"

silly_print( "Hello FreeBASIC!" )
silly_print( "Status: " + status )
End