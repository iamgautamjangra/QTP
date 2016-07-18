'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	NotificationGroups_AdvanceSearch_withValidData
' Description					:	Validate Advance Search PopupWindow
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

executionController.startTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_withValidData", "ALC_NGP_TC_11"
ivm.NavigateToMenu MENU_NOTIFICATION_GROUPS
wait Wait5

    SearchDateCreated = testcasedata.getvalue("SearchDateCreated")
	strSearchTerm = testcasedata.getvalue("AdvSearchTerm")
	strSearchName = testcasedata.getvalue("SearchName")
	strSearchDescription = testcasedata.getvalue("SearchDescription")
     

    ivm.page(Common_page).webLink("AdvancedSearch").press
	wait 3

    
    ivm.page(Common_page).webEdit("AdvSearchTerm").setValue strSearchTerm
	ivm.page(Common_page).webEdit("SearchName").setValue strSearchName
	ivm.page(Common_page).webEdit("SearchDescription").setValue strSearchDescription
	wait 2
	ivm.page(Common_page).selectDate "DataCreated",SearchDateCreated
	wait 3 
    ivm.page(Common_page).webLink("AdvSearch").press
	wait Wait5


    ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
    ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("CreatedAt_Filter").assertExist "True"
    ivm.page(Common_page).webElement("CreatedAt_Filter").assertStatus "Visible"
    ivm.page(Common_page).webElement("CreatedAt_Filter").assertText "Created At " & "= " & SearchDateCreated
	
	ivm.page(Common_page).webElement("Description_Filter").assertExist "True"
    ivm.page(Common_page).webElement("Description_Filter").assertStatus "Visible"
    ivm.page(Common_page).webElement("Description_Filter").assertText "Description " & "= " & strSearchDescription
	
	ivm.page(Common_page).webElement("Name_Filter").assertExist "True"
    ivm.page(Common_page).webElement("Name_Filter").assertStatus "Visible"
    ivm.page(Common_page).webElement("Name_Filter").assertText "Name " & "= " & strSearchName
	
	ivm.page(Common_page).webElement("SearchTerm_Filter").assertExist "True"
    ivm.page(Common_page).webElement("SearchTerm_Filter").assertStatus "Visible"
    ivm.page(Common_page).webElement("SearchTerm_Filter").assertText "Search Term " & "= " & strSearchTerm
 
    ivm.page(Common_page).webLink("ClearAll").assertExist "True"
    ivm.page(Common_page).webLink("ClearAll").assertStatus "Visible"
	
	ivm.page(Common_page).webElement("SearchTerm_Filter").press
 wait Wait5
    ivm.page(Common_page).webLink("ClearAll").press
    wait Wait5
 
    ivm.page(Common_page).webElement("NotificationGroups").assertExist "True"
    ivm.page(Common_page).webElement("NotificationGroups").assertStatus "Visible"


'End Test Case
executionController.stopTestCase_w_TestCaseNumber "NotificationGroups_AdvanceSearch_withValidData", "ALC_NGP_TC_11"