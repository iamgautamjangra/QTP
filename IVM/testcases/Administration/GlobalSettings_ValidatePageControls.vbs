'
' File Name						:	GlobalSettings_ValidatePageControls
' Description					:	Validate UI controls on Global Settings page
' Author 						:   Fonantrix Solution
' Date 							:   20-07-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_ValidatePageControls", "ADMN_GS_TC_01"
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait 10
'Validating the default page tabs.
With ivm.page(GlobalSettings_page)
	
	.webLink("EditSettings").assertExist "True"
	.webLink("EditSettings").assertStatus "Visible"
	
	'Validate the header General Settings
	.webElement("GeneralSettings").assertExist "True"
	.webElement("GeneralSettings").assertStatus "Visible"
	.webElement("LastModified").assertExist "True"
	.webElement("LastModified").assertStatus "Visible"
	.webElement("LocationManager").assertExist "True"
	.webElement("LocationManager").assertStatus "Visible"
	.webElement("ConfigurationService").assertExist "True"
	.webElement("ConfigurationService").assertStatus "Visible"
	.webElement("ConfigurationServicePort").assertExist "True"
	.webElement("ConfigurationServicePort").assertStatus "Visible"
	
	'Validate the header RHQ Connection Settings
	.webElement("RHQConnectionSettings").assertExist "True"
	.webElement("RHQConnectionSettings").assertStatus "Visible"
	.webLink("GoToRHQUI").assertExist "True"
	.webLink("GoToRHQUI").assertStatus "Visible"
	.webElement("IPAddress").assertExist "True"
	.webElement("IPAddress").assertStatus "Visible"
	
	.webElement("Username").assertExist "True"
	.webElement("Username").assertStatus "Visible"
	.webElement("Port").assertExist "True"
	.webElement("Port").assertStatus "Visible"
	.webElement("Password").assertExist "True"
	.webElement("Password").assertStatus "Visible"
	
	'Validate the header Display Settings
	.webElement("DisplaySettings").assertExist "True"
	.webElement("DisplaySettings").assertStatus "Visible"
	.webElement("Date_time").assertExist "True"
	.webElement("Date_time").assertStatus "Visible"
	.webElement("ShowDateAs").assertExist "True"
	.webElement("ShowDateAs").assertStatus "Visible"
	.webElement("ShowTimeIn").assertExist "True"
	.webElement("ShowTimeIn").assertStatus "Visible"
	
	'Validate the header User Settings
	.webElement("UserSettings").assertExist "True"
	.webElement("UserSettings").assertStatus "Visible"
	.webElement("PasswordPolicy").assertExist "True"
	.webElement("PasswordPolicy").assertStatus "Visible"
	.webCheckbox("EnablePasswordExpiration").assertExist "True"
	.webCheckbox("EnablePasswordExpiration").assertStatus "Visible"
	.webElement("EnablePasswordExpiration").assertExist "True"
	.webElement("EnablePasswordExpiration").assertStatus "Visible"
	.webCheckbox("EnablePasswordThreshold").assertExist "True"
	.webCheckbox("EnablePasswordThreshold").assertStatus "Visible"
	.webElement("EnablePasswordLockout").assertExist "True"
	.webElement("EnablePasswordLockout").assertStatus "Visible"
	
	'Validate the header LDAP Settings
	.webElement("LDAPSettings").assertExist "True"
	.webElement("LDAPSettings").assertStatus "Visible"
	.webCheckbox("Ldap").assertExist "True"
	.webCheckbox("Ldap").assertStatus "Visible"
	.webElement("LDAPS").assertExist "True"
	.webElement("LDAPS").assertStatus "Visible"
	.webElement("LDAPhost").assertExist "True"
	.webElement("LDAPhost").assertStatus "Visible"
	.webElement("Port1").assertExist "True"
	.webElement("Port1").assertStatus "Visible"
	.webElement("BaseDN").assertExist "True"
	.webElement("BaseDN").assertStatus "Visible"
	.webElement("BindDN").assertExist "True"
	.webElement("BindDN").assertStatus "Visible"
	.webElement("BindPassword").assertExist "True"
	.webElement("BindPassword").assertStatus "Visible"
	.webElement("SearchAttribute").assertExist "True"
	.webElement("SearchAttribute").assertStatus "Visible"
	
	'Validate the header Default Notification
	.webElement("DefaultNotifications").assertExist "True"
	.webElement("DefaultNotifications").assertStatus "Visible"
	.webElement("NotificationRecipients").assertExist "True"
	.webElement("NotificationRecipients").assertStatus "Visible"
	
	
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_ValidatePageControls", "ADMN_GS_TC_01"
