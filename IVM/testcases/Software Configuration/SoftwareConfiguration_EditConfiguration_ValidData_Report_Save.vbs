'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_ValidData_Report_Save
' Description					:   Edit configuration for Reports
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_ValidData_Report_Save", "SOF_CONF_TC_001"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")


ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

          wait wait30	

With ivm.page(SoftwareConfiguration_page)
 		 .clickLink strSoftwareConfName1
          wait wait40
 
 
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

		wait wait30	
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		
	    .webLink("SaveChanges_2").press 
		
		wait wait20
		
		REM .assertExistLink strSoftwareConfName
		
		.assertformRecord frmCreateSoftwareConfiguration,True,strSoftwareConfName,strSoftwareConfName

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
      
	  .webButton("Ok").press 
        wait wait30	
		

		  
End with
'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_ValidData_Report_Save", "SOF_CONF_TC_001"

