'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateBindGUID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateBindGUID", "REP_RDR_TC_037"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strBindGUID=testcasedata.getvalue("strBindGUID")
strBindGUID1=testcasedata.getvalue("strBindGUID1")
strBindGUIDInv=testcasedata.getvalue("strBindGUIDInv")


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
							
							.webEdit("BindGUID_Adv").setValue strBindGUID
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("BindGUID_Filter").assertExist "True"
							If len(strBindGUID)>9 then 
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& mid(strBindGUID,1,10) &".." &"   X"
							
							Else
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& strBindGUID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webTable("DetailedData_RD").assertValue strBindGUID,"1"
							wait 5	
							.webTable("DetailedData_RD").assertDelValue strBindGUID1
							.webLink("ClearAll").press
							wait 5
							.webElement("BindGUID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RD").assertValue strBindGUID1,"1"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("BindGUID_Adv").setValue strBindGUIDInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("BindGUID_Filter").assertExist "True"
							If len(strBindGUIDInv)>9 then 
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& mid(strBindGUIDInv,1,10) &".." &"   X"
							
							Else
							.webElement("BindGUID_Filter").assertText  "Bind GUID ="& strBindGUIDInv &"   X"
							End If
							
							.webElement("BindGUID_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_RD").assertDelValue strBindGUID
							.webTable("DetailedData_RD").assertDelValue strBindGUID1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("BindGUID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_RD").assertValue strBindGUID,"1"
							
							.webTable("DetailedData_RD").assertValue strBindGUID1,"1"
							
							.webTable("DetailedData_RD").assertDelValue NoRecordFound_msg
							
					        
							
End with					
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateBindGUID", "REP_RDR_TC_037"