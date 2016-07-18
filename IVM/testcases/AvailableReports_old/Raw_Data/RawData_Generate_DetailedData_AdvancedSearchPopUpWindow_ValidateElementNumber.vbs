'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateElementNumber
' Description					:	Validate the element number filter on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RDR_TC_018"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strElementNumber=testcasedata.getvalue("strElementNumber")
strElementNumber1=testcasedata.getvalue("strElementNumber1")
strElementNumberInv=testcasedata.getvalue("strElementNumberInv")


ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportRawData,3
							 wait 5

							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait 5
							
							.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPid,"True"
							
							.webEdit("EmailRecipients").setValue strEmail
							
							.webEdit("StorageLocation").setValue strStorageLocation
							
							.webList("ReportFormat").selectItem strReportFormat
							
							.webList("DataType").selectItem strDataType
							
							.webEdit("Comments").setValue strComments
							
						
						.webButton("Generate").press
						wait 8

End with	

With ivm.page(detailedData_page)	

							.webLink("DetailedData").press
							wait 4
							
							.webTable("DetailedData_RD").assertExist "True"
							
						   .webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("ElementNumber_Adv").setValue strElementNumber
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ElementNumber_Filter").assertExist "True"
							If len(strElementNumber)>9 then 
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& mid(strElementNumber,1,10) &".." &"   X"
							
							Else
							.webElement("ElementNumber_Filter").assertText  "Element Number ="& strElementNumber &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webTable("DetailedData_RD").assertValue strElementNumber,"27"
							wait 5	
							.webTable("DetailedData_RD").assertDelValue strElementNumber1
							.webLink("ClearAll").press
							wait 5
							.webElement("ElementNumber_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RD").assertValue strElementNumber1,"27"
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
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_RD").assertDelValue strElementNumber
							.webTable("DetailedData_RD").assertDelValue strElementNumber1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("ElementNumber_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_RD").assertValue strElementNumber,"27"
							
							.webTable("DetailedData_RD").assertValue strElementNumber1,"27"
							
							.webTable("DetailedData_RD").assertDelValue NoRecordFound_msg
							
					        
							
End with				
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "CampaignSummaryReport_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateElementNumber", "REP_RDR_TC_018"