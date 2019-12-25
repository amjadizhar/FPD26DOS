********************************************
*:Procedure Use For Falg & AscII Charactors:
********************************************
Do abc
Do Flag
****************************************************
Proc flag && This Procedure Use For Making The Flag:
****************************************************
Clear
@5,5  fill to 7,10 Color  N/W+
@5,10 fill to 7,20 Color  N/G+
@6,14 Say '(*' Colo N/G+
??sys(2002)
Wait ' Pakistan Zinda Baad' Wind 
?sys(2002,1)
Clear
*****************************************************************
Proce abc && This Procedure Use For Making The AscII Charactors:
*****************************************************************
Set talk off
Clear
a=1
Row=1
col= 12
??Sys(2002)
Do While a < 256
         @row,col say Chr(a) Colo Scheme 5
         @row,1 Say '³'
         @row,3 say A Pict '999'
         @row,7 Say '³'
         @row,8 Say ' ->'
   		 a=a+1
   		 Row=Row+1
    If Row = 23 
         Wait " Press To Next " Wind
         Row =1 
         @0,0 Clear To 23,70 
   Endif
Enddo




