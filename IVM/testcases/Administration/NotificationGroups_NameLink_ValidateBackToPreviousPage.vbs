'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_Edit_ValidateBackToPreviousPage
' Description					:	Validate UI Controls of Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateBackToPreviousPage", "ALC_NGP_TC_14"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strUserName = testcasedata.getvalue("UserName")
strUser = testcasedata.getvalue("User")
strName = testcasedata.getvalue("strName")
strDescription = testcasedata.getvalue("strDescription")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
     ivm.page(Common_page).webTable("NotificationGroups").pressLink "Edit",strName,1
	 
	   	
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
	 
	  ivm.page(Common_page).webLink("BackToPreviousPage").press
	wait 3
	 ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
	 ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	 ivm.page(Common_page).webTable("NotificationGroups").assertExist "True"
	 
	 
	 
	
    

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateBackToPreviousPage", "ALC_NGP_TC_14"	