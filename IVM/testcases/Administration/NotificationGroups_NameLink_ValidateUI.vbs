'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_ValidateUI
' Description					:	Validate Details Data of Name Link
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateUI", "ALC_NGP_TC_13"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strName = testcasedata.getvalue("Name")
strDescription = testcasedata.getvalue("strDescription")


     ivm.page(Common_page).webTable("NotificationGroups").assertTblLink strName,1
     ivm.page(Common_page).webTable("NotificationGroups").pressTblLink strName,1

     ivm.page(Common_page).webLink("BackToPreviousPage").assertExist "True"
     ivm.page(Common_page).webLink("BackToPreviousPage").assertStatus "Visible"

     ivm.page(Common_page).webElement("NotificationGroupDetails").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroupDetails").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("NotificationGroupDetails").assertText "Notification Group Details"
	 
	 ivm.page(Common_page).webElement("NotificationGroupName").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroupName").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("NotificationGroupName").assertText strName & " Details"

     ivm.page(Common_page).webElement("Name").assertExist "True"
     ivm.page(Common_page).webElement("Name").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("Name_Value").assertExist "True"
     ivm.page(Common_page).webElement("Name_Value").assertStatus "Visible"
     ivm.page(Common_page).webElement("Name_Value").assertText strName
	 
	 ivm.page(Common_page).webElement("Description").assertExist "True"
	 ivm.page(Common_page).webElement("Description").assertStatus "Visible"
	 
	  ivm.page(Common_page).webElement("Description_Value").assertExist "True"
	 ivm.page(Common_page).webElement("Description_Value").assertStatus "Visible"
	 
	 ivm.page(Common_page).webElement("Description_Value").assertText strDescription

     ivm.page(Common_page).webElement("Emailrecipients").assertExist "True"
     ivm.page(Common_page).webElement("Emailrecipients").assertStatus "Visible"

     ivm.page(Common_page).webLink("Actions").assertExist "True"
     ivm.page(Common_page).webLink("Actions").assertStatus "Visible"

     ivm.page(Common_page).webLink("Actions").press
     wait Wait5

	 ivm.page(Common_page).webLink("Edit").assertExist "True"
     ivm.page(Common_page).webLink("Edit").assertStatus "Visible"

     ivm.page(Common_page).webLink("Delete").assertExist "True"
     ivm.page(Common_page).webLink("Delete").assertStatus "Visible"

     ivm.page(Common_page).webLink("BackToPreviousPage").press
	
     ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
	 ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateUI", "ALC_NGP_TC_13"