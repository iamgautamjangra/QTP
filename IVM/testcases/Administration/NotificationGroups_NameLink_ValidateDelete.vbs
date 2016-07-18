'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_ValidateDelete
' Description					:	Validate UI Controls of Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateDelete", "ALC_NGP_TC_14"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strUserName = testcasedata.getvalue("UserName")
strUser = testcasedata.getvalue("User")
strName = testcasedata.getvalue("strName")
strDescription = testcasedata.getvalue("strDescription")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
     ivm.page(Common_page).webTable("NotificationGroups").pressTblLink strName,1
	 
	  ivm.page(Common_page).webLink("Actions").press
     wait Wait5

	 ivm.page(Common_page).webLink("Delete").assertExist "True"
     ivm.page(Common_page).webLink("Delete").assertStatus "Visible"
	 
	 ivm.page(Common_page).webLink("Delete").press
	 wait Wait5
	 
	 ivm.page(Common_page).webElement("Delete").assertExist "True"
     ivm.page(Common_page).webElement("Delete").assertStatus "Visible"

	 ivm.page(Common_page).webLink("Delete").assertExist "True"
     ivm.page(Common_page).webLink("Delete").assertStatus "Visible"

     ivm.page(Common_page).webLink("DlCancel").assertExist "True"
     ivm.page(Common_page).webLink("DlCancel").assertStatus "Visible"

     ivm.page(Common_page).webLink("Delete").press
     wait 3
	 
	  ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"

	 ivm.page(Common_page).webTable("NotificationGroups").assertDelValue strName
	 
	 
    
    

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_ValidateDelete", "ALC_NGP_TC_14"	