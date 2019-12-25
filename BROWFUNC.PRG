**************************************
* PROGRAM: BROWFUNC.PRG
* PROGRAMMER AMJAD IZHAR
* General Routine for Brows functions
**************************************
**************************************
PROCEDURE brdept
**************************************

DEFINE WINDOW outer FROM 8,0 TO 24,79 DOUBLE
ACTIVATE WINDOW outer 
DEFINE WINDOW mainbrowse FROM 9,1 TO 23,78;

*CLOSE
*GROW; 
*FLOAT; 
*ZOOM; 
*MINIMIZE

IF USED("DEPTT")
	SELECT deptt
ELSE
	USE DEPTT IN 0
ENDIF

*mbrfields = FIELD(1) + "," +;
			FIELD(2)
				
ON KEY LABEL CTRL+N DO ignkey
ON KEY LABEL CTRL+T DO ignkey
ON KEY LABEL INS DO additem
ON KEY LABEL DEL DO delitem

BROWSE FIELDS;
	DEPTCODE :H = "Code",;
	DEPTNAME :H = "Department Name";
	TITLE "        ";		
	WINDOW mainbrowse;
	FOR NOT DELETED()
	
DEACTIVATE WINDOW outer
ON KEY
	
*	DEPTCODE :H = "Deptt. Code",;
*	DEPTNAME :H = "Deptt. Name";
*	TITLE "Department Codes";
*	NOLGRID NORGRID IN SCREEN
	
PROCEDURE ignkey

? CHR(7)
RETURN	

PROCEDURE additem
APPEND BLANK
RETURN

PROCEDURE delitem

	DELETE
	SKIP
	
		IF EOF()
		GOTO BOTTOM
		ENDIF
	
RETURN
*********************************************************************
Date : 1-1-96
*********************************************************************

PROCEDURE 