'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_ValidData_DGW_Save
' Description					:   Edit DGW software configuration
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_ValidData_DGW_Save", "SOF_CONF_TC_001"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")
REM StrVersionAtTop=testcasedata.getvalue("StrVersionAtTop")


ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

          wait wait30
		
With ivm.page(SoftwareConfiguration_page)
 
         .clickLink strSoftwareConfName1
          wait wait10	
 
        .webLink("Actions").press 

		.webLink("Edit").assertExist "True"
		.webLink("Edit").assertStatus "Visible"
		
		REM .webLink("Delete").assertExist "True"
		REM .webLink("Delete").assertStatus "Visible"
		
		.webLink("Monitor").assertExist "True"
		.webLink("Monitor").assertStatus "Visible"
		
		.webLink("ImportConfiguration").assertExist "True"
		.webLink("ImportConfiguration").assertStatus "Visible"
		
		.webLink("ExportConfiguration").assertExist "True"
		.webLink("ExportConfiguration").assertStatus "Visible"
		
	    .webLink("Edit").press 

		wait wait10		
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		
	    .webLink("SaveChanges_2").press 
		
		wait wait10		
		
		.assertformRecord frmCreateSoftwareConfiguration,True,strSoftwareConfName,strSoftwareConfName

		ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

          wait wait10	
		
		
		REM .assertExistLink strSoftwareConfName
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_ValidData_DGW_Save", "SOF_CONF_TC_001"

