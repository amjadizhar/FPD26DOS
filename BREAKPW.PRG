CLEAR
CLOSE ALL
CLEA ALL


         USE ac-pw
* 1
         LOCATE FOR PW_CODE=1

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			CLEAR 
			@ 1,1 SAY "1-"+FMCODE

* 2
         LOCATE FOR PW_CODE=2

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 2,1 SAY "2-"+FMCODE
         
* 3
         LOCATE FOR PW_CODE=3

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 3,1 SAY "3-"+FMCODE

* 4
         LOCATE FOR PW_CODE=4

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 4,1 SAY "4-"+FMCODE

* 5
         LOCATE FOR PW_CODE=5

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 5,1 SAY "5-"+FMCODE

* 6
         LOCATE FOR PW_CODE=6

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 6,1 SAY "6-"+FMCODE

* 7
         LOCATE FOR PW_CODE=7

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 7,1 SAY "7-"+FMCODE

* 8
         LOCATE FOR PW_CODE=8

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+30)+;
             CHR(ASC(MCODE2)+28)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 8,1 SAY "8-"+FMCODE




* pw.dbf
*            FMCODE= CHR(ASC(MCODE1)-26)+;
					CHR(ASC(MCODE2)-30)+;
					CHR(ASC(MCODE3)-29)+;
					CHR(ASC(MCODE4)-21)+;
					CHR(ASC(MCODE5)-19)+;
					CHR(ASC(MCODE6)-13)
* 8
		use pw
         LOCATE FOR PW_CODE=8

            MCODE1= SUBSTR(PW,1,1)
            MCODE2= SUBSTR(PW,2,1)
            MCODE3= SUBSTR(PW,3,1)
            MCODE4= SUBSTR(PW,4,1)
            MCODE5= SUBSTR(PW,5,1)
            MCODE6= SUBSTR(PW,6,1)
            
            FMCODE= CHR(ASC(MCODE1)+26)+;
             CHR(ASC(MCODE2)+30)+;
             CHR(ASC(MCODE3)+29)+;
             CHR(ASC(MCODE4)+21)+;
             CHR(ASC(MCODE5)+19)+;
             CHR(ASC(MCODE6)+13)

			 
			@ 10,1 SAY "pw.dbf 8-"+FMCODE
