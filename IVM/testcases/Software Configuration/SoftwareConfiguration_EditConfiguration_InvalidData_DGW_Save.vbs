'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_EditConfiguration_InvalidData_DGW_Save
' Description					:   Edit configuration for DGWs for invalid value
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_InvalidData_DGW_Save", "SOF_CONF_TC_001"


strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")
StrVersionAtTop=testcasedata.getvalue("StrVersionAtTop")
StrSWConfNameError=testcasedata.getvalue("StrSWConfNameError")
StrError2=testcasedata.getvalue("StrError2")
StrError3=testcasedata.getvalue("StrError3")

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
		
		.webElement("SWConfNameError").assertErrorText StrSWConfNameError
			    
		.webElement("Error3").assertErrorText StrError3
		
		
		.assertformRecord frmCreateSoftwareConfiguration,False,strSoftwareConfName,strSoftwareConfName
        
		ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
	    
		.webButton("Ok").press 

		wait wait30

End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_EditConfiguration_InvalidData_DGW_Save", "SOF_CONF_TC_001"

