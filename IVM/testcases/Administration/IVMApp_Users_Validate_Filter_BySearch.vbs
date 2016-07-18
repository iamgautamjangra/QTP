'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	IVMApp_Users_Validate_Filter_BySearch
' Description					:	Validate Filter by Search option of User page
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------
 
 'Start Test Case 

 executionController.startTestCase_w_TestCaseNumber "IVMApp_Users_Validate_Filter_BySearch", "AAA_UMG_TC_013"
	
'Enter valid data in "Search" textbox and click on the "search" icon.
strSearchValid=testcasedata.getvalue("SearchValid")
strSearchInValid=testcasedata.getvalue("SearchInValid")
strSearchBlank=testcasedata.getvalue("SearchBlank")
strtblEmpty=testcasedata.getvalue("tblEmpty")

'Enter invalid data in "Search" textbox and click on the "search" icon.
ivm.page(Common_page).webLink("Administration").press
ivm.page(User_page).webLink("UserManager").press
ivm.page(User_page).webLink("Users").press

ivm.page(Common_page).webEdit("Search").setValue strSearchInValid	
ivm.page(Common_page).webButton("Go").press

ivm.page(User_page).webTable("Users").assertValue strtblEmpty,1

ivm.page(Common_page).webElement("SearchCriteria").assertExist "True"
ivm.page(Common_page).webElement("SearchCriteria").assertStatus "Visible"

ivm.page(Common_page).webLink("SearchTerm").assertExist "True"
ivm.page(Common_page).webLink("SearchTerm").assertStatus "Visible"
ivm.page(Common_page).webLink("ClearAllSearch").assertExist "True"
ivm.page(Common_page).webLink("ClearAllSearch").assertStatus "Visible"

'Click  Search Term Link
ivm.page(Common_page).webLink("SearchTerm").press
ivm.page(User_page).webTable("Users").assertValue "Status",1

'----Validate Data for valid  value
ivm.page(Common_page).webEdit("Search").setValue strSearchValid	
ivm.page(Common_page).webButton("Go").press

ivm.page(User_page).webTable("Users").searchdata  strSearchValid
ivm.page(Common_page).webLink("ClearAllSearch").press

'---DataBase Validation for the Search grid----------------------------STEP 
ivm.page(Common_page).webEdit("Search").setValue strSearchBlank	
ivm.page(Common_page).webButton("Go").press
ivm.page(User_page).webTable("Users").assertValue "Status",1

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "IVMApp_Users_Validate_Filter_BySearch", "AAA_UMG_TC_013"
