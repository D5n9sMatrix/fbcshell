#ifdef __fb_fpu__
Public Sub ColdIcy ( ByRef StatesIcy As Integer, ByRef RainIcy As Integer, ByRef Money As Integer)
#if 0
Type StatesIcy 
     Dim StatesIcyObj As Integer = 6412
End Type
#endif
#if 0
Type RainIcy 
     Dim RainIcyObj As Integer = 6412
End Type
#endif 
#if 0
Type Money 
     Dim MoneyObj As Integer = 6412
End Type
#endif

If StatesIcy then
   Read StatesIcy
Else
   Rem StatesIcy ( x, y )
Endif 

If RainIcy then
   Read RainIcy
Else
   Rem RainIcy ( x, y )
Endif

If Money then
   Read Money
Else
   Rem Money ( x, y )
Endif

End Sub

#endif 