'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_InvalidData_Report_Save
' Description					:   Edit configuration for Reports for invalid value
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_InvalidData_Report_Save", "SOF_CONF_TC_001"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")
StrVersionAtTop=testcasedata.getvalue("StrVersionAtTop")
StrSWConfNameError=testcasedata.getvalue("StrSWConfNameError")
StrError2=testcasedata.getvalue("StrError2")
StrError3=testcasedata.getvalue("StrError3")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

	          wait wait20	

With ivm.page(SoftwareConfiguration_page)
	     .clickLink strSoftwareConfName1
          wait wait30

         .webLink("Actions").press 

		.webLink("Edit").assertExist "True"
		.webLink("Edit").assertStatus "Visible"
		
		.webLink("Delete").assertExist "True"
		.webLink("Delete").assertStatus "Visible"
		
		.webLink("Monitor").assertExist "True"
		.webLink("Monitor").assertStatus "Visible"
		
		.webLink("ImportConfiguration").assertExist "True"
		.webLink("ImportConfiguration").assertStatus "Visible"
		
		.webLink("ExportConfiguration").assertExist "True"
		.webLink("ExportConfiguration").assertStatus "Visible"
		
	    .webLink("Edit").press 

		wait wait20	
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		
		 .webLink("SaveChanges_2").press 
		
		REM .webElement("SWConfNameError").assertText StrSWConfNameError
		
	    
		.webElement("Error3").assertText StrError3
		
		
ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
        .webButton("Ok").press 
	     
		 wait wait20	


End with
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_InvalidData_Report_Save", "SOF_CONF_TC_001"
