'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_ValidData_Report_Save
' Description					:	Edit configuration for Reports for invalid value
' Author 						:   Fonantrix Solution
' Date 							:   18-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_ValidData_Report_Save", "SOF_CONF_TC_001"

strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
StrSelectedValue=testcasedata.getvalue("StrSelectedValue")
StrSelectedVersion=testcasedata.getvalue("StrSelectedVersion")
StrSoftwareComponent=testcasedata.getvalue("StrSoftwareComponent")
strVersion=testcasedata.getvalue("strVersion")
strVersion1=testcasedata.getvalue("strVersion1")

strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait20

With ivm.page(SoftwareConfiguration_page)
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"
		
	    .webLink("SeaChange").press 
		wait wait20

		.webLink("CreateConfiguration").press 

		wait wait30
End with

With ivm.page(SoftwareConfiguration_page)	
        
		.webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		.webList("ComponentId").selectItem StrSoftwareComponent
		.webList("Display_version").selectItem StrSelectedVersion
		
		
		.webLink("CreateSoftwareConfiguration").press
		
		wait wait10
		
End with
		
With ivm.page(SoftwareConfiguration_page)
	     REM .webTable("ConfigurationName").assertValue strSoftwareConfName,1

		 .assertExistLink strSoftwareConfName
		 
		 .clickLink strSoftwareConfName
		  wait wait10
		
        .webElement("SoftwareConfigurationName1").assertText StrSelectedValue

		REM .webElement("LastModified").assertStatus "Visible"
	
       .webElement("VersionAtTop").assertText strVersion1

	
		.webElement("NewSoftwareConfiguration").assertText strSoftwareConfName
		
		.webElement("SoftwareComponent3").assertText StrSoftwareComponent
		
		.webElement("SoftwareComponentVersion1").assertText strVersion
		
		.webElement("Note").assertExist "True"
		.webElement("Note").assertStatus "Visible"
		
		
		.webElement("Note1").assertExist "True"
		.webElement("Note1").assertStatus "Visible"
		
		.assertformRecord frmCreateSoftwareConfiguration,True,strSoftwareConfName,strSoftwareConfName

	
		
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_ValidData_Report_Save", "SOF_CONF_TC_001"
