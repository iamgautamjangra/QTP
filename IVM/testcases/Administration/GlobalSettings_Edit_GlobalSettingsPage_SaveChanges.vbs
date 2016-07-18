'
' File Name						:	GlobalSettings_Edit_GlobalSettingsPageControls
' Description					:	Validate UI controls on Global Settings Edit page
' Author 						:   Fonantrix Solution
' Date 							:   06-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_GlobalSettingsPageControls", "ADMN_GS_TC_08"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait Wait5
'Validating the default page tabs.
	strLocationManager = testcasedata.getvalue("LocationManager")
	strConfigurationService = testcasedata.getvalue("ConfigurationService")
	strConfigurationServicePort = testcasedata.getvalue("ConfigurationServicePort")
	strIPAddress = testcasedata.getvalue("IPAddress")
	strPort = testcasedata.getvalue("Port")
	strUserName = testcasedata.getvalue("UserName")
	'strShowDate = testcasedata.getvalue("ShowDate")
	strMonth = Month(date) 
	strDay = Day(date) 
	If Len(Month(date)) = 1 Then
		strMonth = "0" & Month(date) 
	End If
	If Len(Day(date)) = 1 Then
		strDay = "0" & Day(date) 
	End If
	strShowDate1 = strMonth & "/" & strDay & "/" & year(date)
	'strShowDate1 = MonthName(month(date),True) &" " & day(date) & ", "& year(date)
	strShowTime = testcasedata.getvalue("ShowTime")
	strPasswordExpiration = testcasedata.getvalue("PasswordExpiration")
	strPasswordLockout = testcasedata.getvalue("PasswordLockout")
	strLDAPHost = testcasedata.getvalue("LDAPHost")
	strPort1 = testcasedata.getvalue("Port1")
	strSearchAttribute = testcasedata.getvalue("SearchAttribute")
	
With ivm.page(GlobalSettings_page)
	.webLink("EditSettings").press
	wait Wait5
	'Validate the header General Settings
	.webEdit("LocationManager").setValue  strLocationManager
	.webEdit("ConfigurationServiceIP").setValue strConfigurationService
	.webEdit("ConfigurationServicePort").setValue strConfigurationServicePort
	
	.webEdit("IPAddress").setValue strIPAddress
	.webEdit("Port").setValue strPort
	.webEdit("Username").setValue strUserName
	.webList("ShowDate").selectItem strShowDate1
	.webList("ShowTime").selectItem strShowTime
	.webEdit("PasswordExpiration").setValue strPasswordExpiration
	.webEdit("PasswordLockout").setValue strPasswordLockout
	.webEdit("LDAPhost").setValue strLDAPHost
	.webEdit("LdapPort").setValue strPort1
	.webEdit("SearchAttribute").setValue strSearchAttribute
	
	.webLink("SaveChanges").press
	wait 10
	.webElement("PasswordExpiration1").assertText strPasswordExpiration&" days"
	
	
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_GlobalSettingsPageControls", "ADMN_GS_TC_08"
