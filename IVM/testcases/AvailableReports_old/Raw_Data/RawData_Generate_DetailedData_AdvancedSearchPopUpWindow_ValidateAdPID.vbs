'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID
' Description					:	Validate the UIControls on advanced search window
' Author 						:   Fonantrix Solution
' Date 							:   09-04-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID", "REP_RDR_TC_037"

DataSet=testcasedata.getvalue("DataSet")
strCampaign=testcasedata.getvalue("strCampaign")
strProgramPid=testcasedata.getvalue("strProgramPid")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdPID=testcasedata.getvalue("strAdPID")
strAdPID1=testcasedata.getvalue("strAdPID1")
strAdPIDInv=testcasedata.getvalue("strAdPIDInv")


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
							
							.webEdit("AdPID_Adv").setValue strAdPID
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("AdPID_Filter").assertExist "True"
							If len(strAdPID)>9 then 
							.webElement("AdPID_Filter").assertText  "Ad PID ="& mid(strAdPID,1,10) &".." &"   X"
							
							Else
							.webElement("AdPID_Filter").assertText  "Ad PID ="& strAdPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
							
						
							.webTable("DetailedData_RD").assertValue strAdPID,"16"
							wait 5	
							.webTable("DetailedData_RD").assertDelValue strAdPID1
							.webLink("ClearAll").press
							wait 5
							.webElement("AdPID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_RD").assertValue strAdPID1,"16"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("AdPID_Adv").setValue strAdPIDInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("AdPID_Filter").assertExist "True"
							If len(strAdPIDInv)>9 then 
							.webElement("AdPID_Filter").assertText  "Ad PID ="& mid(strAdPIDInv,1,10) &".." &"   X"
							
							Else
							.webElement("AdPID_Filter").assertText  "Ad PID ="& strAdPIDInv &"   X"
							End If
							
							.webElement("AdPID_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_RD").assertExist "True"
						
							.webTable("DetailedData_RD").searchData NoRecordFound_msg
							
							.webTable("DetailedData_RD").assertDelValue strAdPID
							.webTable("DetailedData_RD").assertDelValue strAdPID1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("AdPID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("DetailedData_RD").assertValue strAdPID,"16"
							
							.webTable("DetailedData_RD").assertValue strAdPID1,"16"
							
							.webTable("DetailedData_RD").assertDelValue NoRecordFound_msg
							
					        
							
End with								
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RawData_Generate_DetailedData_AdvancedSearchPopUpWindow_ValidateAdPID", "REP_RDR_TC_037"