'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_ValidateDeleteCancel
' Description					:	Validate UI Controls of Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateDeleteCancel", "ALC_NGP_TC_14"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strUserName = testcasedata.getvalue("UserName")
strUser = testcasedata.getvalue("User")
strName = testcasedata.getvalue("strName")
strDescription = testcasedata.getvalue("strDescription")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
     ivm.page(Common_page).webTable("NotificationGroups").pressTblLink strName,1
	  wait Wait5
	  ivm.page(Common_page).webLink("Actions").press
     wait 2

	 ivm.page(Common_page).webLink("Delete").assertExist "True"
     ivm.page(Common_page).webLink("Delete").assertStatus "Visible"
	 
	 ivm.page(Common_page).webLink("Delete").press
	  ivm.page(Common_page).webLink("Delete").press
	 wait 2
	 
	
	 ivm.page(Common_page).webLink("DlDelete").assertExist "True"
     ivm.page(Common_page).webLink("DlDelete").assertStatus "Visible"

     ivm.page(Common_page).webLink("DlCancel").assertExist "True"
     ivm.page(Common_page).webLink("DlCancel").assertStatus "Visible"

     ivm.page(Common_page).webLink("DlCancel").press
	 
	 ivm.page(Common_page).webLink("DlCancel").press
     wait 3
	 
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
	 
	 
    
    

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateDeleteCancel", "ALC_NGP_TC_14"	