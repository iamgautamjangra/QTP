'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_InvalidData_Report_Save
' Description					:	Edit configuration for Reports for invalid value
' Author 						:   Fonantrix Solution
' Date 							:   17-12-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_InvalidData_Report_Save", "SOF_CONF_TC_001"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
StrError2=testcasedata.getvalue("StrError2")
StrError3=testcasedata.getvalue("StrError3")
strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait40

With ivm.page(SoftwareConfiguration_page)
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"

		.webLink("CreateConfiguration").press 

		wait wait20	
End with

With ivm.page(SoftwareConfiguration_page)
		
		.webElement("CreateSoftwareConfiguration").assertExist "True"
		.webElement("CreateSoftwareConfiguration").assertStatus "Visible"
		
		.webElement("SoftwareConfigurationName").assertExist "True"
		.webElement("SoftwareConfigurationName").assertStatus "Visible"
		
	    .webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		
		.webLink("CreateSoftwareConfiguration").assertExist "True"
		.webLink("CreateSoftwareConfiguration").assertStatus "Visible"
	    
		.webLink("CreateSoftwareConfiguration").press
		
		wait wait20
End with
		
With ivm.page(SoftwareConfiguration_page)

		
	    .webTable("ConfigurationName").assertValue strSoftwareConfName,1
		
	    .webTable("ConfigurationName").pressTblLink strSoftwareConfName,1
		wait wait10	
		
		.webLink("Actions").assertExist "True"
		.webLink("Actions").assertStatus "Visible"
		.webLink("Actions").press
		wait wait5
		
		.webLink("Edit").press
		wait wait5
		
		
        .webElement("GeneralSoftwConfSettings").assertExist "True"
		.webElement("GeneralSoftwConfSettings").assertStatus "Visible"
		
	    .webEdit("SoftwareConfig_name").setValue strSoftwareConfName1
		
		.webLink("SaveChanges").press
		wait wait5

	    .webElement("Error3").assertText StrError3
		
		.assertformRecord frmCreateSoftwareConfiguration,True,strSoftwareConfName,strSoftwareConfName
		
		
ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION
       .webButton("Ok").press
				
wait wait20

End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_InvalidData_Report_Save", "SOF_CONF_TC_001"