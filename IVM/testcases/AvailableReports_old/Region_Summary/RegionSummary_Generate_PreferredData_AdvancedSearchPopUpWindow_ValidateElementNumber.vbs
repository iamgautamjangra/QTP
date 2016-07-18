'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber
' Description					:	Validate "ElementNumber" text box in the Advanced Search Popup Window.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RSR_TC_025"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strElementNumberInv=testcasedata.getvalue("strElementNumberInv")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("ElementNumber_Adv").setValue strElementNumber
						   
							.webLink("AdvSearch").press
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RS").assertExist "True"
							
						
							.webTable("PreferredData_RS").assertValue strElementNumber,"6"
							wait 5	
							.webTable("PreferredData_RS").assertDelValue strElementNumber1
							.webLink("ClearAll").press
							wait 5
							.webElement("ElementNumber_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("PreferredData_RS").assertValue strElementNumber1,"6"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ElementNumber_Adv").setValue strElementNumberInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumberInv)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumberInv,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumberInv &"   X"
							End If
							
							.webElement("ElementNumber_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RS").assertExist "True"
						
							.webTable("PreferredData_RS").searchData NoRecordFound_msg
							
							.webTable("PreferredData_RS").assertDelValue strElementNumber
							.webTable("PreferredData_RS").assertDelValue strElementNumber1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("ElementNumber_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("PreferredData_RS").assertValue strElementNumber,"6"
							
							.webTable("PreferredData_RS").assertValue strElementNumber1,"6"
							
							.webTable("PreferredData_RS").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RSR_TC_025"