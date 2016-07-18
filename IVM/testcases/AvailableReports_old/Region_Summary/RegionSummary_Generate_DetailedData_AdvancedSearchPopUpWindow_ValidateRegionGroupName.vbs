'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName
' Description					:	Validate the Region Group Name filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName", "REP_RSR_TC_045"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strRegionGroupName=testcasedata.getvalue("strRegionGroupName")
strRegionGroupName1=testcasedata.getvalue("strRegionGroupName1")
strRegionGroupNameInv=testcasedata.getvalue("strRegionGroupNameInv")

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
	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("RegionGroupName_Adv").setValue strRegionGroupName
						   
							.webLink("AdvSearch").press
							.webElement("RegionGroupName_Filter").assertExist "True"
							If len(strRegionGroupName)>9 then 
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& mid(strRegionGroupName,1,10) &".." &"   X"
							
							Else
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& strRegionGroupName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
							
						
							.webTable("DetailedData_RS").assertValue strRegionGroupName,"6"
							wait 5	
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName1
							.webLink("ClearAll").press
							wait 5
							.webElement("RegionGroupName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RS").assertValue strRegionGroupName1,"6"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("RegionGroupName_Adv").setValue strRegionGroupNameInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("RegionGroupName_Filter").assertExist "True"
							If len(strRegionGroupNameInv)>9 then 
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& mid(strRegionGroupNameInv,1,10) &".." &"   X"
							
							Else
							.webElement("RegionGroupName_Filter").assertText  "Region Group Name ="& strRegionGroupNameInv &"   X"
							End If
							
							.webElement("RegionGroupName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RS").assertExist "True"
						
							.webTable("DetailedData_RS").searchData NoRecordFound_msg
							
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName
							.webTable("DetailedData_RS").assertDelValue strRegionGroupName1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("RegionGroupName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_RS").assertValue strRegionGroupName,"6"
							
							.webTable("DetailedData_RS").assertValue strRegionGroupName1,"6"
							
							.webTable("DetailedData_RS").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateRegionGroupName", "REP_RSR_TC_045"