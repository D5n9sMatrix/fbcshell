#if __fb_fpu__
Type MyObj
  Foo As Integer Ptr
 
    '' Constructor to create our integer, and set its value.
  Declare Constructor( ByVal DefVal As Integer = 0 )
    '' Destroy our integer on object deletion.
  Declare Destructor()
End Type

Constructor MyObj( ByVal DefVal As Integer = 0 )
  Print "Creating a new integer in MyObj!"
  Print "The Integer will have the value of: " & DefVal
  Print ""
 
    '' Create a pointer, and set its value to the one passed to the
    '' Constructor.
  This.Foo = New Integer
  *This.Foo = DefVal
End Constructor

Destructor MyObj()
  Print "Deleting our Integer in MyObj!"
  Print ""
 
    '' Delete the pointer we created in MyObj.
  Delete This.Foo
  This.Foo = 0
End Destructor


Scope
    '' Create a MyObj type object
    '' Send the value of '10' to the constructor
  Dim As MyObj Bar = 10
 
    '' See if the integer's been created.  Print its value.
  Print "The Value of our integer is: " & *Bar.Foo
  Print ""
 
  Sleep
End Scope
  '' We've just gone out of a scope.  The Destructor should be called now
  '' Because our objects are being deleted.
Sleep

More advanced construction example, showing constructor overloading among other things:
Type sample

  _text As String

  Declare Constructor ()
  Declare Constructor ( a As Integer )
  Declare Constructor ( a As Single  )
  Declare Constructor ( a As String, b As Byte )

  Declare Operator Cast () As String

End Type

Constructor sample ()
  Print "constructor sample ()"
  Print
  This._text = "Empty"
End Constructor

Constructor sample ( a As Integer )
  Print "constructor sample ( a as integer )"
  Print "  a = "; a
  Print
  This._text = Str(a)
End Constructor

Constructor sample ( a As Single )
  Print "constructor sample ( a as single )"
  Print "  a = "; a
  Print
  This._text = Str(a)
End Constructor

Constructor sample ( a As String, b As Byte )
  Print "constructor sample ( a as string, b as byte )"
  Print "  a = "; a
  Print "  b = "; b
  Print
  This._text = Str(a) + "," + Str(b)
End Constructor

Operator sample.Cast () As String
  Return This._text
End Operator

Print "Creating x1"
Dim x1 As sample

Print "Creating x2"
Dim x2 As sample = 1

Print "Creating x3"
Dim x3 As sample = 99.9

Print "Creating x4"
Dim x4 As sample = sample( "aaa", 1 )

Print "Values:"
Print "  x1 = "; x1
Print "  x2 = "; x2
Print "  x3 = "; x3
Print "  x4 = "; x4

Example of copy constructor:
Type UDT
  Dim As String Ptr p                     ''pointer to string
  Declare Constructor ()                  ''default constructor
  Declare Constructor (ByRef rhs As UDT)  ''copy constructor
  Declare Destructor ()                   ''destructor
End Type

Constructor UDT ()
  This.p = CAllocate(1, SizeOf(String))
End Constructor

Constructor UDT (ByRef rhs As UDT)
  This.p = CAllocate(1, SizeOf(String))
  *This.p = *rhs.p
End Constructor

Destructor UDT ()
  *This.p = ""
  Deallocate This.p
End Destructor


Dim As UDT u0
*u0.p = "copy constructor exists"
Dim As UDT u = u0
*u0.p = ""  ''to check the independance of the result copy with the object copied
Print *u.p
Sleep
#endif