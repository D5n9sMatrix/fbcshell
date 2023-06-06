#ifdef __fb_fpu__
Dim As Integer n

Print "Here are odd numbers between 0 and 10!"
Print
For n = 0 To 10

  If ( n Mod 2 ) = 0 Then
    Continue
  End If
 
  Print n
 
Next n


 '' simple prime number finder

Print "Here are the prime numbers between 1 and 20!"
Print

Dim n As Integer, d As Integer

For n = 2 To 20
   
    For d = 2 To Int(Sqr(n))
       
        If ( n Mod d ) = 0 Then ' d divides n
           
            Continue ' n is not prime, so try next n
           
        End If
       
    Next d
   
    Print n
   
Next n
#endif