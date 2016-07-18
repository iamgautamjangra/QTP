'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_AdvanceSearch_Cancel
' Description					:	Validate Functionality of "Advance Search" Cancel 
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case a

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_Cancel", "ALC_NGP_TC_9"
  ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5
	
	 SearchDateCreated = testcasedata.getvalue("SearchDateCreated")
	strAdvSearchTerm = testcasedata.getvalue("strAdvSearchTerm")
	strSearchName = testcasedata.getvalue("SearchName")
	strSearchDescription = testcasedata.getvalue("SearchDescription")
    
	
	
	ivm.page(Common_page).webLink("AdvancedSearch").press
    wait 3
	
    ivm.page(Common_page).webEdit("SearchDescription").setValue strSearchDescription
    ivm.page(Common_page).webEdit("AdvSearchTerm").setValue strAdvSearchTerm
	ivm.page(Common_page).webEdit("SearchName").setValue strSearchName
	ivm.page(Common_page).selectDate "DataCreated",SearchDateCreated
	
		
	ivm.page(Common_page).webLink("SearchCancel").press
	wait 3

	ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
	ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"
	
	'ivm.page(Common_page).webEdit("SearchDescription").assertExist "False"
    'ivm.page(Common_page).webLink("AdvClearAll").assertExist "False"

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_Cancel", "ALC_NGP_TC_9"