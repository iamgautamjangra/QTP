'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	SoftwareConfiguration_CreateConfiguration_InvalidData_JobManager_Save
' Description					:   Edit configuration for Reports for invalid value
' Author 						:   Fonantrix Solution
' Date 							:   19-12-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_InvalidData_JobManager_Save", "SOF_CONF_TC_001"


strSoftwareConfName=testcasedata.getvalue("strSoftwareConfName")
StrSelectedValue=testcasedata.getvalue("StrSelectedValue")
StrSelectedVersion=testcasedata.getvalue("StrSelectedVersion")
StrSoftwareComponent=testcasedata.getvalue("StrSoftwareComponent")
strVersion=testcasedata.getvalue("strVersion")
strVersion1=testcasedata.getvalue("strVersion1")

strSoftwareConfName1=testcasedata.getvalue("strSoftwareConfName1")

ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait40

With ivm.page(SoftwareConfiguration_page)
		.webElement("SeaChange").assertExist "True"
		.webElement("SeaChange").assertStatus "Visible"
		
		.webLink("CreateConfiguration").assertExist "True"
		.webLink("CreateConfiguration").assertStatus "Visible"
		
	    .webLink("SeaChange").press 
		wait wait20

		.webLink("CreateConfiguration").press 

		wait wait20		
End with

With ivm.page(SoftwareConfiguration_page)	
        
		.webEdit("SoftwareConfig_name").setValue strSoftwareConfName
		.webList("ComponentId").selectItem StrSoftwareComponent
		.webList("Display_version").selectItem StrSelectedVersion
		
		
		.webLink("CreateSoftwareConfiguration").press
		
		wait wait20
		
End with
		
With ivm.page(SoftwareConfiguration_page)
	     .webTable("ConfigurationName").assertValue strSoftwareConfName,1

        .assertExistLink strSoftwareConfName
		.clickLink strSoftwareConfName
		
		REM .webElement("VersionAtTop").assertText strVersion1

		.webElement("NewSoftwareConfiguration").assertText strSoftwareConfName
		
		.webElement("SoftwareComponent1").assertText StrSoftwareComponent
		
		.webElement("SoftwareComponentVersion1").assertText strVersion
		
		.webElement("Note").assertExist "True"
		.webElement("Note").assertStatus "Visible"
		
		
		.webElement("Note1").assertExist "True"
		.webElement("Note1").assertStatus "Visible"
		
		REM .assertformRecord frmCreateSoftwareConfiguration,True,strSoftwareConfName,strSoftwareConfName
		
		
ivm.ClickToMenu MENU_SOFTWARE_CONFIGURATION

wait wait20
		
End with

'End Test Case
 executionController.stopTestCase_w_TestCaseNumber "SoftwareConfiguration_CreateConfiguration_InvalidData_JobManager_Save", "SOF_CONF_TC_001"

