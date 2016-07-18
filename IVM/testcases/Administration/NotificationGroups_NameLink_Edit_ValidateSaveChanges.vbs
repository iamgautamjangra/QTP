'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_NameLink_Edit_ValidateSaveChanges
' Description					:	Validate the functionality Edit page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateSaveChanges", "ALC_NGP_TC_16"
 ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
strName = testcasedata.getvalue("Name")
strNameEdit = testcasedata.getvalue("NameEdit")
strDescriptionEdit = testcasedata.getvalue("strDescriptionEdit")

    ivm.page(Common_page).webTable("NotificationGroups").assertValue strName,1
    ivm.page(Common_page).webTable("NotificationGroups").pressTblLink strName,1
wait 3

  ivm.page(Common_page).webLink("Actions").press
     wait Wait5
    ivm.page(Common_page).webLink("Edit").press	
    wait Wait5

    ivm.page(Common_page).webElement("NotificationGroupdetails").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroupdetails").assertStatus "Visible"

    ivm.page(Common_page).webEdit("Name").setValue strNameEdit
    
   ivm.page(Common_page).webEdit("Description").setValue strDescriptionEdit
    ivm.page(Common_page).webLink("SaveChanges").press
    wait Wait5

    
	
	ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
     ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"

	 ivm.page(Common_page).webTable("NotificationGroups").assertTblValue strDescriptionEdit,"1",strNameEdit

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_NameLink_Edit_ValidateSaveChanges", "ALC_NGP_TC_16"