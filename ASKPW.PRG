* PROGRAM : ASKPW.PRG
* WRITTEN BY AMJAD IZHAR
* LAST REVISED ON 03-04-2001
*------------------------------------


SET TALK OFF
PUBLIC pass,mm1,Permit
CLEAR

pass=SPACE(9)
mm1=space(9)
Permit = Space(2)

DEFINE WINDOW upper FROM 0,0 TO 22,78 NONE
ACTIVATE WINDOW upper
@ 1,1 SAY "Password:"

DEFINE WINDOW inwin FROM 2,0 TO 10,20 NONE
DEFINE WINDOW hidewin FROM 2,0 TO 8,20 NONE
ACTIVATE WINDOW hidewin NOSHOW
HIDE WINDOW hidewin IN WINDOW inwin

@ 1,1 GET pass PICT "@!"
READ COLOR 1,1

USE Usr

LOCATE FOR usrcode = mMenu

DO back

DO CASE
	
	CASE pass <> mm1
	
		CLEAR WINDOWS
	
		*FOR a = 1 TO 4
		*	SET BELL TO 300,1
		*	?? CHR(7)
		*	SET BELL TO
		*	DO ACSSDEN
		
			Permit = "OK"
		
		*ENDFOR
	
	CASE pass = mm1
			Permit = "OK"

ENDCASE

CLEAR WINDOWS
DEACTIVATE WINDOW upper
DEACTIVATE WINDOW inwin
DEACTIVATE WINDOW hidewin


*******************
PROCEDURE AcssDen
********************

*******************************************************************
*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 07/23/96             ACSSDEN.SPR               13:13:49 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � Author's Name                                           �
*       �                                                         �
*       � Copyright (c) 1996 Company Name                         �
*       � Address                                                 �
*       � City,     Zip                                           �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�


#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat

IF SET("TALK") = "ON"
	SET TALK OFF
	m.talkstat = "ON"
ELSE
	m.talkstat = "OFF"
ENDIF
m.compstat = SET("COMPATIBLE")
SET COMPATIBLE FOXPLUS

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �                MS-DOS Window definitions                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �              ACSSDEN/MS-DOS Screen Layout               �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1


@ 13,33 SAY "Access Denied!" ;
	SIZE 1,14, 0






#REGION 0
IF m.talkstat = "ON"
	SET TALK ON
ENDIF
IF m.compstat = "ON"
	SET COMPATIBLE ON
ENDIF

RETURN
***************************



************************
PROCEDURE back
************************

*PUBLIC mm1

STORE SUBSTR(pw,1,1) TO ncode1
STORE SUBSTR(pw,2,1) TO ncode2
STORE SUBSTR(pw,3,1) TO ncode3
STORE SUBSTR(pw,4,1) TO ncode4
STORE SUBSTR(pw,5,1) TO ncode5
STORE SUBSTR(pw,6,1) TO ncode6
STORE SUBSTR(pw,7,1) TO ncode7
STORE SUBSTR(pw,8,1) TO ncode8
STORE SUBSTR(pw,9,1) TO ncode9


mm1 = chr(asc("&ncode1")+30)+;
	  chr(asc("&ncode2")+28)+;
	  chr(asc("&ncode3")+29)+;
	  chr(asc("&ncode4")+21)+;
	  chr(asc("&ncode5")+19)+;
	  chr(asc("&ncode6")+13)+;
	  chr(asc("&ncode7")+12)+;
	  chr(asc("&ncode8")+18)+;
	  chr(asc("&ncode9")+19)


RETURN
