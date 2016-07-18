'
' File Name						:	GlobalSettings_Edit_GlobalSettingsPageControls
' Description					:	Validate UI controls on Global Settings Edit page
' Author 						:   Fonantrix Solution
' Date 							:   06-08-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "GlobalSettings_Edit_GlobalSettingsPageControls", "ADMN_GS_TC_03"

'Validating the default page tabs.
ivm.NavigateToMenu MENU_GLOBAL_SETTINGS
wait Wait5
With ivm.page(GlobalSettings_page)
	
	.webLink("EditSettings").assertExist "True"
	.webLink("EditSettings").assertStatus "Visible"
	.webLink("EditSettings").press
	
	'Validate the header General Settings
	.webElement("GeneralSettings").assertExist "True"
	.webElement("GeneralSettings").assertStatus "Visible"
	.webElement("LastModified").assertExist "True"
	.webElement("LastModified").assertStatus "Visible"
	.webElement("LocationManager").assertExist "True"
	.webElement("LocationManager").assertStatus "Visible"
	.webEdit("LocationManager").assertExist "True"
	.webEdit("LocationManager").assertStatus "Visible"
	.webElement("ConfigurationService").assertExist "True"
	.webElement("ConfigurationService").assertStatus "Visible"
	.webEdit("ConfigurationServiceIP").assertExist "True"
	.webEdit("ConfigurationServiceIP").assertStatus "Visible"
	.webElement("ConfigurationServicePort").assertExist "True"
	.webElement("ConfigurationServicePort").assertStatus "Visible"
	.webEdit("ConfigurationServicePort").assertExist "True"
	.webEdit("ConfigurationServicePort").assertStatus "Visible"
	
	'Validate the header RHQ Connection Settings
	.webElement("RHQConnectionSettings").assertExist "True"
	.webElement("RHQConnectionSettings").assertStatus "Visible"
	.webLink("GoToRHQUI").assertExist "True"
	.webLink("GoToRHQUI").assertStatus "Visible"
	
	.webElement("IPAddress").assertExist "True"
	.webElement("IPAddress").assertStatus "Visible"
	
	.webEdit("IPAddress").assertExist "True"
	.webEdit("IPAddress").assertStatus "Visible"
	.webElement("Username").assertExist "True"
	.webElement("Username").assertStatus "Visible"
	.webEdit("Username").assertExist "True"
	.webEdit("Username").assertStatus "Visible"
	.webElement("Port").assertExist "True"
	.webElement("Port").assertStatus "Visible"
	.webEdit("Port").assertExist "True"
	.webEdit("Port").assertStatus "Visible"
	.webElement("Password").assertExist "True"
	.webElement("Password").assertStatus "Visible"
	.webEdit("Password").assertExist "True"
	.webEdit("Password").assertStatus "Visible"
	
	'Validate the header Display Settings
	.webElement("DisplaySettings").assertExist "True"
	.webElement("DisplaySettings").assertStatus "Visible"
	.webElement("Date_time").assertExist "True"
	.webElement("Date_time").assertStatus "Visible"
	.webElement("ShowDateAs").assertExist "True"
	.webElement("ShowDateAs").assertStatus "Visible"
	.webList("ShowDate").assertExist "True"
	.webList("ShowDate").assertStatus "Visible"
	.webElement("ShowTimeIn").assertExist "True"
	.webElement("ShowTimeIn").assertStatus "Visible"
	.webList("ShowTime").assertExist "True"
	.webList("ShowTime").assertStatus "Visible"
	
	'Validate the header User Settings
	.webElement("UserSettings").assertExist "True"
	.webElement("UserSettings").assertStatus "Visible"
	.webElement("PasswordPolicy").assertExist "True"
	.webElement("PasswordPolicy").assertStatus "Visible"
	.webCheckbox("EnablePasswordExpiration").assertExist "True"
	.webCheckbox("EnablePasswordExpiration").assertStatus "Visible"
	.webElement("EnablePasswordExpiration").assertExist "True"
	.webElement("EnablePasswordExpiration").assertStatus "Visible"
	.webEdit("PasswordExpiration").assertExist "True"
	.webEdit("PasswordExpiration").assertStatus "Visible"
	.webCheckbox("EnablePasswordThreshold1").assertExist "True"
	.webCheckbox("EnablePasswordThreshold1").assertStatus "Visible"
	.webElement("EnablePasswordLockout").assertExist "True"
	.webElement("EnablePasswordLockout").assertStatus "Visible"
	.webEdit("PasswordLockout").assertExist "True"
	.webEdit("PasswordLockout").assertStatus "Visible"
	
	'Validate the header LDAP Settings
	.webElement("LDAPSettings").assertExist "True"
	.webElement("LDAPSettings").assertStatus "Visible"
	.webCheckbox("Ldap").assertExist "True"
	.webCheckbox("Ldap").assertStatus "Visible"
	.webElement("LDAPS").assertExist "True"
	.webElement("LDAPS").assertStatus "Visible"
	
	.webElement("LDAPhost").assertExist "True"
	.webElement("LDAPhost").assertStatus "Visible"
	.webEdit("LDAPhost").assertExist "True"
	.webEdit("LDAPhost").assertStatus "Visible"
	.webElement("HostName").assertExist "True"
	.webElement("HostName").assertStatus "Visible"
	
	.webElement("Port1").assertExist "True"
	.webElement("Port1").assertStatus "Visible"
	.webEdit("LdapPort").assertExist "True"
	.webEdit("LdapPort").assertStatus "Visible"
	.webElement("PortNumber").assertExist "True"
	.webElement("PortNumber").assertStatus "Visible"
	
	.webElement("BaseDN").assertExist "True"
	.webElement("BaseDN").assertStatus "Visible"
	.webEdit("BaseDN").assertExist "True"
	.webEdit("BaseDN").assertStatus "Visible"
	.webElement("BaseDN").assertExist "True"
	.webElement("NameRootNode").assertStatus "Visible"
	.webElement("NameRootNode").assertExist "True"
	
	.webElement("BindDN").assertExist "True"
	.webElement("BindDN").assertStatus "Visible"
	.webEdit("BindDN").assertExist "True"
	.webEdit("BindDN").assertStatus "Visible"
	.webElement("BindDNLabel").assertExist "True"
	.webElement("BindDNLabel").assertStatus "Visible"
	
	.webElement("BindPassword").assertExist "True"
	.webElement("BindPassword").assertStatus "Visible"
	.webEdit("BindPassword").assertExist "True"
	.webEdit("BindPassword").assertStatus "Visible"
	.webElement("BindPasswordLabel").assertExist "True"
	.webElement("BindPasswordLabel").assertStatus "Visible"
	
	.webElement("SearchAttribute").assertExist "True"
	.webElement("SearchAttribute").assertStatus "Visible"
	.webEdit("SearchAttribute").assertExist "True"
	.webEdit("SearchAttribute").assertStatus "Visible"
	.webElement("AttributeLDAP").assertExist "True"
	.webElement("AttributeLDAP").assertStatus "Visible"
	
	'Validate the header Default Notification
	.webElement("DefaultNotifications").assertExist "True"
	.webElement("DefaultNotifications").assertStatus "Visible"
	.webElement("NotificationRecipients").assertExist "True"
	.webElement("NotificationRecipients").assertStatus "Visible"
	.webLink("AddRecipient").assertExist "True"
	.webLink("AddRecipient").assertStatus "Visible"
	
	
	
	
End With	
	
'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "GlobalSettings_Edit_GlobalSettingsPageControls", "ADMN_GS_TC_03"
